/*
 * baremetal/usb_hid.c
 *
 * Minimal xHCI host controller + USB HID polling for TH1520 bare-metal.
 * Targets the Nintendo Classic Controller connected through a USB adapter
 * and USB hub on the TH1520 micro-USB 3.0 port.
 *
 * Assumes U-Boot has already initialized the DWC3 USB PHY, clocks, and
 * global configuration before handing off to the bare-metal payload.
 * The xHCI host-controller state itself is re-initialized from scratch.
 *
 * Exported symbols (always present, no-op on non-TH1520):
 *   void     __calynda_rt_usb_init(void)
 *   uint32_t __calynda_rt_usb_classic_buttons(void)
 *   void     __calynda_rt_controller_demo_hold(void)
 */

#include <stdint.h>
#include <stddef.h>

/* ── TH1520-only implementation ─────────────────────────────────────────── */
#ifdef MACHINE_TH1520

/* ── TH1520 DWC3 / xHCI MMIO base ──────────────────────────────────────── */
#define XHCI_BASE  UINT64_C(0xFFE7040000)

/* DWC3 global control register (relative to XHCI_BASE) */
#define DWC3_GCTL_OFF          0xC110u
#define DWC3_GCTL_PRTCAPDIR_MASK  (3u << 12u)
#define DWC3_GCTL_PRTCAPDIR_HOST  (1u << 12u)  /* 01 = host */

/* DWC3 USB 2.0 PHY config register 0 (relative to XHCI_BASE) */
#define DWC3_GUSB2PHYCFG0_OFF  0xC200u
#define DWC3_GUSB2PHYCFG_SUSPPHY  (1u << 7u)  /* software suspend request */
#define DWC3_GUSB2PHYCFG_PHYSUSP  (1u << 6u)  /* PHY is suspended */

/* ── Framebuffer constants (must match screen.cal / runtime_boot.c) ──────── */
#define HID_FB_BASE        UINT64_C(0x04200000)
#define HID_FB_WIDTH       1920
#define HID_FB_HEIGHT      1080
#define HID_FB_SIZE_BYTES  UINT64_C(0x007E9000)
#define HID_CMO_STRIDE     32u

/* ── DMA region above bringup scratch (0x05000000–0x051FFFFF) ───────────── */
#define USB_DMA_BASE  UINT64_C(0x05102000)

/* Offsets within USB_DMA_BASE
 * Context size: HCCPARAMS1.CSZ=1 on TH1520 → 64-byte context entries
 * (each entry is 32 bytes of xHCI data + 32 bytes of hardware state)       */
#define USB_DCBAA_OFF          0x0000u  /* 256 × 8 B  = 2048 B              */
#define USB_CMD_RING_OFF       0x0800u  /* 16  × 16 B =  256 B              */
#define USB_EVT_RING_OFF       0x0900u  /* 64  × 16 B = 1024 B              */
#define USB_ERST_OFF           0x0D00u  /* 1   × 16 B =   16 B              */
/* 0x0D10–0x0FFF: alignment pad */
#define USB_OUT_CTX1_OFF       0x1000u  /* 32 × 64 B = 2048 B  slot 1 out   */
#define USB_OUT_CTX2_OFF       0x1800u  /* 32 × 64 B = 2048 B  slot 2 out   */
#define USB_IN_CTX_OFF         0x2000u  /* 34 × 64 B = 2176 B  input ctx    */
#define USB_EP0_RING1_OFF      0x2880u  /* EP0 transfer ring slot 1: 256 B  */
#define USB_EP0_RING2_OFF      0x2980u  /* EP0 transfer ring slot 2: 256 B  */
#define USB_INT_RING_OFF       0x2A80u  /* INT-IN transfer ring:     256 B  */
#define USB_DATA_BUF_OFF       0x2B80u  /* control-transfer data buf: 512 B */
#define USB_HID_REPORT_OFF     0x2D80u  /* HID report buffer: 64 B          */
#define USB_SCRATCH_ARRAY_OFF  0x2DC0u  /* scratchpad ptr array: 2 × 8 B    */
#define USB_SCRATCH_BUF0_OFF   0x3000u  /* scratchpad buffer 0: 4 KB        */
#define USB_SCRATCH_BUF1_OFF   0x4000u  /* scratchpad buffer 1: 4 KB        */

#define CMD_RING_TRBS   16u
#define EVT_RING_TRBS   64u
#define EP0_RING_TRBS   16u
#define INT_RING_TRBS   16u

/* ── xHCI TRB type codes ─────────────────────────────────────────────────── */
#define TRB_NORMAL        1u
#define TRB_SETUP_STAGE   2u
#define TRB_DATA_STAGE    3u
#define TRB_STATUS_STAGE  4u
#define TRB_LINK          6u
#define TRB_ENABLE_SLOT   9u
#define TRB_ADDRESS_DEV  11u
#define TRB_CONFIG_EP    12u
#define TRB_EV_TRANSFER  32u
#define TRB_EV_CMD_CMPL  33u

/* ── xHCI endpoint types ─────────────────────────────────────────────────── */
#define EP_TYPE_CTRL   4u
#define EP_TYPE_INT_IN 7u

/* ── USB standard requests ───────────────────────────────────────────────── */
#define USB_DIR_IN        0x80u
#define USB_DIR_OUT       0x00u
#define USB_TYPE_STD      0x00u
#define USB_TYPE_CLS      0x20u
#define USB_RCPT_DEV      0x00u
#define USB_RCPT_IFC      0x01u
#define USB_RCPT_PORT     0x03u
#define USB_REQ_GET_DESC  0x06u
#define USB_REQ_SET_CFG   0x09u
#define USB_DTYPE_DEVICE  0x01u
#define USB_DTYPE_CONFIG  0x02u
#define USB_DTYPE_HUB     0x29u
#define HID_REQ_SET_IDLE  0x0Au
#define HID_REQ_SET_PROTO 0x0Bu

/* ── xHCI completion codes ───────────────────────────────────────────────── */
#define CC_SUCCESS    1u
#define CC_SHORT_PKT 13u

/* ── TRB structure (16 bytes) ────────────────────────────────────────────── */
typedef struct { uint32_t w0, w1, w2, w3; } Trb;

#define TRB_TYPE_SHIFT 10u
#define TRB_CYCLE      (1u << 0)
#define TRB_TC         (1u << 1)   /* toggle cycle – Link TRB only */
#define TRB_IDT        (1u << 6)   /* immediate data – Setup Stage */
#define TRB_IOC        (1u << 5)   /* interrupt on completion */
#define TRB_DIR_IN     (1u << 16)  /* data-stage direction */

/* ── 32-byte context entry ───────────────────────────────────────────────── */
typedef struct { uint32_t w[16]; } CtxEntry;  /* 64-byte: CSZ=1 on TH1520 */

/* ── Driver state ────────────────────────────────────────────────────────── */
static volatile uint32_t *s_cap;      /* HCCR base                          */
static volatile uint32_t *s_op;       /* HCOR base                          */
static volatile uint32_t *s_rt;       /* runtime registers base             */
static volatile uint32_t *s_db;       /* doorbell registers base            */
static uint32_t s_caplength;
static uint32_t s_nports;
static uint32_t s_max_slots;

static Trb    *s_cmd_ring;
static uint32_t s_cmd_enq;
static uint32_t s_cmd_ccs;            /* command ring producer cycle state  */

static Trb    *s_evt_ring;
static uint32_t s_evt_deq;
static uint32_t s_evt_ccs;            /* event ring consumer expected cycle */

static uint8_t   s_hid_slot;
static uint8_t   s_hid_dci;
static Trb      *s_int_ring;
static uint32_t  s_int_enq;
static uint32_t  s_int_ccs;
static uint32_t  s_hid_report_len;
static uint8_t  *s_hid_report;
static uint32_t  s_hub_slot;
static int       s_usb_ready;
static uint32_t  s_last_buttons;

/* EP0 ring state per slot (slot 1 and slot 2). Indexed by slot id; index 0
 * unused. Must persist across consecutive ctrl_xfer() calls because the host
 * controller's dequeue pointer keeps advancing — if we reset enq=0 every
 * transfer, our writes land at indices the HC has already consumed (with the
 * stale PCS), and the HC never sees new TRBs at its real dequeue position. */
#define EP0_MAX_SLOTS 3u
static uint32_t ep0_enq_tbl[EP0_MAX_SLOTS];
static uint32_t ep0_ccs_tbl[EP0_MAX_SLOTS];
static uint32_t ep0_slot_cur;
#define ep0_enq ep0_enq_tbl[ep0_slot_cur]
#define ep0_ccs ep0_ccs_tbl[ep0_slot_cur]

/* ── Address helpers ─────────────────────────────────────────────────────── */
static uint64_t usb_phys(uint32_t off) { return USB_DMA_BASE + (uint64_t)off; }
static void    *usb_ptr(uint32_t off)  { return (void *)(uintptr_t)(USB_DMA_BASE + (uint64_t)off); }

/* ── Cache / memory barrier primitives ──────────────────────────────────── */
static void usb_fence(void)
{
    __asm__ volatile("fence" : : : "memory");
}

static void usb_dcache_clean_line(uint64_t addr)
{
    register uintptr_t a __asm__("a0") = (uintptr_t)addr;
    __asm__ volatile(".long 0x0295000b" : : "r"(a) : "memory");
}

static void usb_dcache_inv_line(uint64_t addr)
{
    register uintptr_t a __asm__("a0") = (uintptr_t)addr;
    /* th.dcache.civa a0 — clean+invalidate. We pair every DMA-from-device
     * buffer with a usb_clean_range() BEFORE the transfer, leaving the cache
     * line clean so civa's writeback is a no-op and only the invalidate has
     * effect. Pure dcache.iva (0x02a5000b) is restricted to M-mode on some
     * T-Head cores; we run in S-mode after U-Boot, so we stay on civa. */
    __asm__ volatile(".long 0x02b5000b" : : "r"(a) : "memory");
}

static void usb_dcache_final(void)
{
    /* sync.s */
    __asm__ volatile(".long 0x0190000b" : : : "memory");
}

static void usb_clean_range(uint64_t start, uint64_t size)
{
    uint64_t line = start & ~(uint64_t)(HID_CMO_STRIDE - 1u);
    uint64_t end  = start + size;
    while (line < end) { usb_dcache_clean_line(line); line += HID_CMO_STRIDE; }
    usb_dcache_final();
}

static void usb_inv_range(uint64_t start, uint64_t size)
{
    uint64_t line = start & ~(uint64_t)(HID_CMO_STRIDE - 1u);
    uint64_t end  = start + size;
    while (line < end) { usb_dcache_inv_line(line); line += HID_CMO_STRIDE; }
    usb_dcache_final();
}

/* ── Busy-wait delay ─────────────────────────────────────────────────────── */
static void usb_delay_us(uint32_t us)
{
    volatile uint32_t t = us * 1000u;
    while (t != 0u) { t -= 1u; }
}

static void usb_delay_ms(uint32_t ms) { usb_delay_us(ms * 1000u); }

/* ── Debug UART helpers (enabled only when CALYNDA_BRINGUP_DEBUG=1) ───────────── */
#if CALYNDA_BRINGUP_DEBUG
#define USB_UART_BASE UINT64_C(0xFFE7014000)
static void usb_uart_putc(char ch)
{
    volatile uint32_t *uart = (volatile uint32_t *)(uintptr_t)USB_UART_BASE;
    while ((uart[5] & 0x20u) == 0u) {}
    uart[0] = (uint32_t)(unsigned char)ch;
}
static void usb_uart_puts(const char *s)
{
    while (*s) { if (*s == '\n') { usb_uart_putc('\r'); } usb_uart_putc(*s++); }
}
static void usb_uart_puthex8(uint8_t v)
{
    static const char HX[] = "0123456789ABCDEF";
    usb_uart_putc(HX[(v >> 4u) & 0xFu]);
    usb_uart_putc(HX[v & 0xFu]);
}
static void usb_uart_puthex16(uint16_t v)
{
    usb_uart_puthex8((uint8_t)(v >> 8u));
    usb_uart_puthex8((uint8_t)(v & 0xFFu));
}
static void usb_uart_puthex32(uint32_t v)
{
    usb_uart_puthex16((uint16_t)(v >> 16u));
    usb_uart_puthex16((uint16_t)(v & 0xFFFFu));
}
#define DBG_PUTS(s)   usb_uart_puts(s)
#define DBG_HEX8(v)   usb_uart_puthex8((uint8_t)(v))
#define DBG_HEX16(v)  usb_uart_puthex16((uint16_t)(v))
#define DBG_HEX32(v)  usb_uart_puthex32((uint32_t)(v))
#define DBG_NL()      usb_uart_puts("\n")
#else
#define DBG_PUTS(s)   ((void)0)
#define DBG_HEX8(v)   ((void)0)
#define DBG_HEX16(v)  ((void)0)
#define DBG_HEX32(v)  ((void)0)
#define DBG_NL()      ((void)0)
#endif /* CALYNDA_BRINGUP_DEBUG */

/* ── Memory helpers ──────────────────────────────────────────────────────── */
static void usb_zero(void *ptr, size_t n)
{
    uint8_t *p = (uint8_t *)ptr;
    size_t i;
    for (i = 0; i < n; i++) { p[i] = 0u; }
}

/* ── xHCI register I/O ───────────────────────────────────────────────────── */
static uint32_t cap_read32(uint32_t off) { return s_cap[off / 4u]; }

static uint32_t op_read32(uint32_t off)  { return s_op[off / 4u]; }
static void     op_write32(uint32_t off, uint32_t v)
{
    s_op[off / 4u] = v; usb_fence();
}
static void     op_write64(uint32_t off, uint64_t v)
{
    s_op[off / 4u]      = (uint32_t)(v & 0xFFFFFFFFu);
    s_op[off / 4u + 1u] = (uint32_t)(v >> 32u);
    usb_fence();
}

/* Runtime interrupter 0 (at RTSOFF + 0x20) */
static volatile uint32_t *ir0(void) { return s_rt + (0x20u / 4u); }

static void ir0_write32(uint32_t off, uint32_t v)
{
    ir0()[off / 4u] = v; usb_fence();
}
static void ir0_write64(uint32_t off, uint64_t v)
{
    ir0()[off / 4u]      = (uint32_t)(v & 0xFFFFFFFFu);
    ir0()[off / 4u + 1u] = (uint32_t)(v >> 32u);
    usb_fence();
}

/* Doorbell ring */
static void ring_db(uint32_t slot, uint32_t target)
{
    s_db[slot] = target; usb_fence();
}

/* ── TRB helpers ─────────────────────────────────────────────────────────── */
static void trb_set(Trb *t, uint64_t param, uint32_t status, uint32_t ctrl)
{
    t->w0 = (uint32_t)(param & 0xFFFFFFFFu);
    t->w1 = (uint32_t)(param >> 32u);
    t->w2 = status;
    t->w3 = ctrl;
}

/* Enqueue one command ring TRB; ctrl_template must not include the cycle bit */
static void cmd_enqueue(uint64_t param, uint32_t status, uint32_t ctrl_template)
{
    Trb *t = &s_cmd_ring[s_cmd_enq];
    trb_set(t, param, status, ctrl_template | s_cmd_ccs);
    usb_clean_range(usb_phys(USB_CMD_RING_OFF) + s_cmd_enq * 16u, 16u);
    s_cmd_enq++;
    if (s_cmd_enq >= CMD_RING_TRBS - 1u) {
        Trb *link = &s_cmd_ring[CMD_RING_TRBS - 1u];
        trb_set(link, usb_phys(USB_CMD_RING_OFF), 0u,
                (TRB_LINK << TRB_TYPE_SHIFT) | TRB_TC | s_cmd_ccs);
        usb_clean_range(usb_phys(USB_CMD_RING_OFF) + (CMD_RING_TRBS - 1u) * 16u, 16u);
        s_cmd_ccs ^= 1u;
        s_cmd_enq = 0u;
    }
}

/* Drain the event ring until a Command Completion Event is found.
 * Returns the completion code; writes slot_id (if non-NULL) from event. */
static uint32_t wait_cmd_cmpl(uint32_t *out_slot)
{
    uint32_t deadline = 8000u;
    while (deadline-- != 0u) {
        Trb *ev = &s_evt_ring[s_evt_deq];
        uint32_t ctrl, type, cc;

        usb_inv_range(usb_phys(USB_EVT_RING_OFF) + s_evt_deq * 16u, 16u);
        ctrl = ev->w3;
        if ((ctrl & 1u) != s_evt_ccs) { usb_delay_us(1000u); continue; }

        type = (ctrl >> TRB_TYPE_SHIFT) & 0x3Fu;
        cc   = (ev->w2 >> 24u) & 0xFFu;
        if (out_slot) { *out_slot = (ctrl >> 24u) & 0xFFu; }

        s_evt_deq++;
        if (s_evt_deq >= EVT_RING_TRBS) { s_evt_deq = 0u; s_evt_ccs ^= 1u; }
        ir0_write64(0x18u, usb_phys(USB_EVT_RING_OFF) + s_evt_deq * 16u);

        if (type == TRB_EV_CMD_CMPL) { return cc; }
        /* Discard non-CMD_CMPL events (port-status-change, transfer, etc.) */
        DBG_PUTS("USB: discard ev type="); DBG_HEX8((uint8_t)type);
        DBG_PUTS(" cc="); DBG_HEX8((uint8_t)cc); DBG_NL();
    }
    return 0u; /* timeout */
}

/* ── DWC3 global: ensure host mode before touching xHCI registers ───────── */
static void dwc3_set_host_mode(void)
{
    volatile uint32_t *gctl =
        (volatile uint32_t *)(uintptr_t)(XHCI_BASE + DWC3_GCTL_OFF);
    uint32_t val;

    val = *gctl;
    DBG_PUTS("USB: DWC3 GCTL="); DBG_HEX32(val); DBG_NL();

    /* Set PRTCAPDIR = host (01) */
    val = (val & ~DWC3_GCTL_PRTCAPDIR_MASK) | DWC3_GCTL_PRTCAPDIR_HOST;
    *gctl = val;
    usb_fence();
    DBG_PUTS("USB: DWC3 GCTL->"); DBG_HEX32(val); DBG_NL();

    /* DWC3 Core Soft Reset – required after PRTCAPDIR change (DWC3 databook
     * section on mode switching). PRTCAPDIR is sticky and is preserved.
     * TH1520 quirk: CoreSoftReset does not self-clear; pulse it manually. */
    val = *gctl | (1u << 11u);  /* CoreSoftReset = 1 */
    *gctl = val;
    usb_fence();
    usb_delay_ms(1u);           /* 1ms for reset to propagate */
    val = *gctl & ~(1u << 11u); /* CoreSoftReset = 0 (explicit release) */
    *gctl = val;
    usb_fence();
    DBG_PUTS("USB: DWC3 post-CSR GCTL="); DBG_HEX32(*gctl); DBG_NL();

    /* Ensure USB 2.0 PHY is not suspended (GUSB2PHYCFG.SUSPPHY/PHYSUSP) */
    {
        volatile uint32_t *phycfg =
            (volatile uint32_t *)(uintptr_t)(XHCI_BASE + DWC3_GUSB2PHYCFG0_OFF);
        uint32_t pv = *phycfg;
        DBG_PUTS("USB: GUSB2PHYCFG="); DBG_HEX32(pv); DBG_NL();
        pv &= ~(DWC3_GUSB2PHYCFG_SUSPPHY | DWC3_GUSB2PHYCFG_PHYSUSP);
        *phycfg = pv;
        usb_fence();
    }
    usb_delay_ms(100u);  /* let PHY stabilize after core reset */
}

/* ── Host Controller Initialization ─────────────────────────────────────── */
static int xhci_hc_init(void)
{
    uint32_t dboff, rtsoff, config, timeout;
    Trb     *link;
    uint64_t *dcbaa;
    uint32_t *erst;

    s_cap = (volatile uint32_t *)(uintptr_t)XHCI_BASE;
    s_caplength  = cap_read32(0x00u) & 0xFFu;
    s_nports     = (cap_read32(0x04u) >> 24u) & 0xFFu;
    s_max_slots  = cap_read32(0x04u) & 0xFFu;
    dboff        = cap_read32(0x14u) & ~3u;
    rtsoff       = cap_read32(0x18u) & ~31u;

    s_op = (volatile uint32_t *)(uintptr_t)(XHCI_BASE + s_caplength);
    s_rt = (volatile uint32_t *)(uintptr_t)(XHCI_BASE + rtsoff);
    s_db = (volatile uint32_t *)(uintptr_t)(XHCI_BASE + dboff);

    DBG_PUTS("USB: HC caplength="); DBG_HEX8((uint8_t)s_caplength);
    DBG_PUTS(" nports="); DBG_HEX8((uint8_t)s_nports);
    DBG_PUTS(" maxslots="); DBG_HEX8((uint8_t)s_max_slots);
    DBG_PUTS(" dboff="); DBG_HEX32(dboff);
    DBG_NL();
    {
        uint32_t hcc1 = cap_read32(0x10u);
        uint32_t hcs2 = cap_read32(0x08u);
        DBG_PUTS("USB: HCCPARAMS1="); DBG_HEX32(hcc1);
        DBG_PUTS(" HCSPARAMS2="); DBG_HEX32(hcs2);
        DBG_NL();
    }

    /* Wait for Controller Not Ready to clear */
    timeout = 10000u;
    while ((op_read32(0x04u) & (1u << 11u)) != 0u && --timeout != 0u) {
        usb_delay_us(100u);
    }
    if (timeout == 0u) { DBG_PUTS("USB: CNR timeout\n"); return -1; }

    /* Host Controller Reset */
    op_write32(0x00u, op_read32(0x00u) | (1u << 1u));
    timeout = 10000u;
    while ((op_read32(0x00u) & (1u << 1u)) != 0u && --timeout != 0u) {
        usb_delay_us(100u);
    }
    if (timeout == 0u) { DBG_PUTS("USB: HCRST timeout\n"); return -1; }

    /* Wait CNR again after reset */
    timeout = 10000u;
    while ((op_read32(0x04u) & (1u << 11u)) != 0u && --timeout != 0u) {
        usb_delay_us(100u);
    }
    if (timeout == 0u) { DBG_PUTS("USB: CNR2 timeout\n"); return -1; }

    /* Set MaxSlotsEn (cap at 4 for this demo) */
    config = op_read32(0x38u);
    config = (config & ~0xFFu) | (s_max_slots < 4u ? s_max_slots : 4u);
    op_write32(0x38u, config);

    /* DCBAA – zero all entries, point controller at it */
    dcbaa = (uint64_t *)usb_ptr(USB_DCBAA_OFF);
    usb_zero(dcbaa, 256u * 8u);

    /* Scratchpad buffers (HCSPARAMS2.MAXSCRATCHPADBUFS must be satisfied) */
    {
        uint32_t hcs2     = cap_read32(0x08u);
        uint32_t n_scratch = ((hcs2 >> 27u) & 0x1Fu)
                           | (((hcs2 >> 21u) & 0x1Fu) << 5u);
        if (n_scratch > 0u) {
            static const uint32_t sb_off[2] =
                { USB_SCRATCH_BUF0_OFF, USB_SCRATCH_BUF1_OFF };
            uint64_t *sb_arr = (uint64_t *)usb_ptr(USB_SCRATCH_ARRAY_OFF);
            uint32_t si;
            DBG_PUTS("USB: scratch n="); DBG_HEX8((uint8_t)n_scratch); DBG_NL();
            usb_zero(sb_arr, (n_scratch > 2u ? 2u : n_scratch) * 8u);
            for (si = 0u; si < n_scratch && si < 2u; si++) {
                sb_arr[si] = usb_phys(sb_off[si]);
                usb_zero(usb_ptr(sb_off[si]), 4096u);
                usb_clean_range(usb_phys(sb_off[si]), 4096u);
            }
            usb_clean_range(usb_phys(USB_SCRATCH_ARRAY_OFF),
                            (n_scratch > 2u ? 2u : n_scratch) * 8u);
            dcbaa[0] = usb_phys(USB_SCRATCH_ARRAY_OFF);
        }
    }
    usb_clean_range(usb_phys(USB_DCBAA_OFF), 256u * 8u);
    op_write64(0x30u, usb_phys(USB_DCBAA_OFF));

    /* Command ring */
    s_cmd_ring = (Trb *)usb_ptr(USB_CMD_RING_OFF);
    s_cmd_enq  = 0u;
    s_cmd_ccs  = 1u;
    usb_zero(s_cmd_ring, CMD_RING_TRBS * 16u);
    link = &s_cmd_ring[CMD_RING_TRBS - 1u];
    trb_set(link, usb_phys(USB_CMD_RING_OFF), 0u,
            (TRB_LINK << TRB_TYPE_SHIFT) | TRB_TC | 1u);
    usb_clean_range(usb_phys(USB_CMD_RING_OFF), CMD_RING_TRBS * 16u);
    op_write64(0x18u, usb_phys(USB_CMD_RING_OFF) | 1u); /* CRCR, RCS=1 */

    /* Event ring */
    s_evt_ring = (Trb *)usb_ptr(USB_EVT_RING_OFF);
    s_evt_deq  = 0u;
    s_evt_ccs  = 1u;
    usb_zero(s_evt_ring, EVT_RING_TRBS * 16u);
    usb_clean_range(usb_phys(USB_EVT_RING_OFF), EVT_RING_TRBS * 16u);

    erst = (uint32_t *)usb_ptr(USB_ERST_OFF);
    usb_zero(erst, 16u);
    erst[0] = (uint32_t)(usb_phys(USB_EVT_RING_OFF) & 0xFFFFFFFFu);
    erst[1] = (uint32_t)(usb_phys(USB_EVT_RING_OFF) >> 32u);
    erst[2] = EVT_RING_TRBS;
    erst[3] = 0u;
    usb_clean_range(usb_phys(USB_ERST_OFF), 16u);

    ir0_write32(0x08u, 1u);                              /* ERSTSZ = 1       */
    ir0_write64(0x18u, usb_phys(USB_EVT_RING_OFF));      /* ERDP             */
    ir0_write64(0x10u, usb_phys(USB_ERST_OFF));          /* ERSTBA           */
    ir0_write32(0x00u, ir0()[0] | 0x2u);                 /* IMAN.IE = 1      */

    /* Start the controller: RS=1, INTE=1 */
    op_write32(0x00u, op_read32(0x00u) | 1u | (1u << 2u));

    timeout = 10000u;
    while ((op_read32(0x04u) & 1u) != 0u && --timeout != 0u) { /* HCHalted==0 */
        usb_delay_us(100u);
    }
    if (timeout == 0u) { DBG_PUTS("USB: start timeout\n"); return -1; }
    DBG_PUTS("USB: xhci ready\n");
    return 0;
}

/* ── Port management ─────────────────────────────────────────────────────── */
static int xhci_port_reset(uint32_t port)
{
    uint32_t portsc_off = 0x400u + port * 0x10u;
    uint32_t portsc, timeout;
    uint32_t is_ss;

    portsc = op_read32(portsc_off);
    DBG_PUTS("USB: port "); DBG_HEX8((uint8_t)port); DBG_PUTS(" portsc="); DBG_HEX32(portsc);
    if ((portsc & 1u) == 0u) { DBG_PUTS(" (no CCS)\n"); return -1; }

    /* Detect SuperSpeed port: PSI field [13:10] >= 4 */
    is_ss = (((portsc >> 10u) & 0xFu) >= 4u);

    if (is_ss) {
        /* SS Warm Port Reset: set WPR (bit 31), wait for WRC (bit 19) */
        portsc = (portsc & ~(0x3Fu << 17u) & ~2u) | (1u << 31u);
        op_write32(portsc_off, portsc);

        timeout = 5000u;
        while (--timeout != 0u) {
            portsc = op_read32(portsc_off);
            if ((portsc & (1u << 19u)) != 0u) { break; }  /* WRC set */
            usb_delay_us(200u);
        }
        if (timeout == 0u) { DBG_PUTS(" (WRC timeout)\n"); return -1; }
        /* Clear WRC; do NOT write PED=1 (disables port on TH1520 DWC3) */
        op_write32(portsc_off, (op_read32(portsc_off) & ~2u) | (1u << 19u));
    } else {
        /* HS/FS/LS Hot Reset: set PR (bit 4), wait for PRC (bit 21) */
        portsc = (portsc & ~(0x3Fu << 17u) & ~2u) | (1u << 4u);
        op_write32(portsc_off, portsc);

        timeout = 5000u;
        while (--timeout != 0u) {
            portsc = op_read32(portsc_off);
            if ((portsc & (1u << 21u)) != 0u) { break; }  /* PRC set */
            usb_delay_us(200u);
        }
        if (timeout == 0u) { DBG_PUTS(" (PRC timeout)\n"); return -1; }
        /* Clear PRC; do NOT write PED=1 (disables port on TH1520 DWC3) */
        op_write32(portsc_off, (op_read32(portsc_off) & ~2u) | (1u << 21u));

        /* Wait for PED=1: HC sets this when port speed is determined */
        timeout = 2000u;
        while (--timeout != 0u) {
            portsc = op_read32(portsc_off);
            if ((portsc & 2u) != 0u) { break; }  /* PED=1 */
            usb_delay_us(500u);
        }
        if (timeout == 0u) { DBG_PUTS(" (PED timeout)\n"); return -1; }
    }

    usb_delay_ms(10u);
    DBG_PUTS(" post="); DBG_HEX32(op_read32(0x400u + port * 0x10u));
    DBG_PUTS(" ok\n");
    return 0;
}

static uint32_t xhci_port_speed(uint32_t port)
{
    uint32_t portsc = op_read32(0x400u + port * 0x10u);
    if ((portsc & 1u) == 0u) { return 0u; }
    return (portsc >> 10u) & 0xFu;  /* 1=FS 2=LS 3=HS 4=SS */
}

/* ── Slot / context helpers ──────────────────────────────────────────────── */
static CtxEntry *out_ctx(uint32_t slot, uint32_t entry)
{
    uint32_t off = (slot == 1u) ? USB_OUT_CTX1_OFF : USB_OUT_CTX2_OFF;
    return &((CtxEntry *)usb_ptr(off))[entry];
}

static CtxEntry *in_ctx(uint32_t entry)
{
    return &((CtxEntry *)usb_ptr(USB_IN_CTX_OFF))[entry];
}

static Trb *ep0_ring_ptr(uint32_t slot)
{
    uint32_t off = (slot == 1u) ? USB_EP0_RING1_OFF : USB_EP0_RING2_OFF;
    return (Trb *)usb_ptr(off);
}

static uint64_t ep0_ring_phys(uint32_t slot)
{
    return usb_phys((slot == 1u) ? USB_EP0_RING1_OFF : USB_EP0_RING2_OFF);
}

static uint32_t speed_ep0_maxpkt(uint32_t speed)
{
    if (speed == 4u) { return 512u; }  /* SS */
    if (speed == 2u) { return 8u; }    /* LS */
    return 64u;                         /* FS / HS */
}

static void setup_input_ctx(uint32_t slot,
                             uint32_t root_port,
                             uint32_t speed,
                             uint32_t ep0_maxpkt,
                             uint32_t hub_slot,
                             uint32_t hub_port,
                             uint32_t route_string)
{
    CtxEntry *icc, *slot_ctx, *ep0_ctx;
    Trb      *ring;
    uint64_t  ring_phys;
    uint64_t *dcbaa;
    uint32_t  out_off;

    /* Zero all 34 context entries including 64-byte hardware-state halves */
    usb_zero(in_ctx(0u), 34u * sizeof(CtxEntry));

    icc = in_ctx(0u);
    icc->w[1] = 0x3u;  /* add slot (bit 0) + EP0 (bit 1) */

    slot_ctx = in_ctx(1u);
    slot_ctx->w[0] = (route_string & 0xFFFFFu)
                   | ((speed & 0xFu) << 20u)
                   | (1u << 27u);                    /* last valid EP index = 1 */
    slot_ctx->w[1] = (root_port + 1u) << 16u;        /* RH port, 1-based */
    if (hub_slot != 0u) {
        slot_ctx->w[2] = hub_slot | (hub_port << 8u);  /* TT slot / TT port */
    }

    ep0_ctx = in_ctx(2u);
    ring      = ep0_ring_ptr(slot);
    ring_phys = ep0_ring_phys(slot);
    usb_zero(ring, EP0_RING_TRBS * 16u);
    trb_set(&ring[EP0_RING_TRBS - 1u], ring_phys, 0u,
            (TRB_LINK << TRB_TYPE_SHIFT) | TRB_TC | 1u);
    usb_clean_range(ring_phys, EP0_RING_TRBS * 16u);

    /* Initialise per-slot ring state to match the freshly zeroed ring:
     * enq=0, producer cycle = 1 (Link TRB above also has cycle=1 with TC). */
    if (slot < EP0_MAX_SLOTS) {
        ep0_enq_tbl[slot] = 0u;
        ep0_ccs_tbl[slot] = 1u;
    }

    ep0_ctx->w[1] = (3u << 1u) | (4u << 3u) | (ep0_maxpkt << 16u); /* CErr=3, EPType=4(Ctrl), MaxPktSz */
    ep0_ctx->w[2] = (uint32_t)(ring_phys & 0xFFFFFFFFu) | 1u;  /* DCS=1 */
    ep0_ctx->w[3] = (uint32_t)(ring_phys >> 32u);
    ep0_ctx->w[4] = 8u;  /* average TRB length */

    /* Point DCBAA slot entry to the output context for this slot */
    out_off = (slot == 1u) ? USB_OUT_CTX1_OFF : USB_OUT_CTX2_OFF;
    usb_zero(usb_ptr(out_off), 32u * sizeof(CtxEntry));
    usb_clean_range(usb_phys(out_off), 32u * sizeof(CtxEntry));
    dcbaa = (uint64_t *)usb_ptr(USB_DCBAA_OFF);
    dcbaa[slot] = usb_phys(out_off);
    usb_clean_range(usb_phys(USB_DCBAA_OFF), 256u * 8u);
}

/* ── Slot commands ───────────────────────────────────────────────────────── */
static uint32_t xhci_enable_slot(void)
{
    uint32_t cc, slot_id = 0u;
    cmd_enqueue(0u, 0u, TRB_ENABLE_SLOT << TRB_TYPE_SHIFT);
    ring_db(0u, 0u);
    cc = wait_cmd_cmpl(&slot_id);
    if (cc != CC_SUCCESS) { DBG_PUTS("USB: enable_slot cc="); DBG_HEX8((uint8_t)cc); DBG_NL(); }
    else { DBG_PUTS("USB: enable_slot ok slot="); DBG_HEX8((uint8_t)slot_id); DBG_NL(); }
    return (cc == CC_SUCCESS) ? slot_id : 0u;
}

static int xhci_address_device(uint32_t slot_id)
{
    uint32_t cc, s = 0u;
    {
        uint64_t *dcbaa = (uint64_t *)usb_ptr(USB_DCBAA_OFF);
        uint32_t out_off = (slot_id == 1u) ? USB_OUT_CTX1_OFF : USB_OUT_CTX2_OFF;
        CtxEntry *out_s  = (CtxEntry *)usb_ptr(out_off);
        CtxEntry *ep0_e  = in_ctx(2u);
        usb_inv_range(usb_phys(USB_DCBAA_OFF) + slot_id * 8u, 8u);
        usb_inv_range(usb_phys(out_off), sizeof(CtxEntry));
        DBG_PUTS("USB: addr dcbaa="); DBG_HEX32((uint32_t)dcbaa[slot_id]);
        DBG_PUTS(" outslt.w3=");      DBG_HEX32(out_s->w[3]);
        DBG_PUTS(" ep0.w1=");         DBG_HEX32(ep0_e->w[1]);
        DBG_NL();
    }
    usb_clean_range(usb_phys(USB_IN_CTX_OFF), 34u * sizeof(CtxEntry));
    cmd_enqueue(usb_phys(USB_IN_CTX_OFF), 0u,
                (TRB_ADDRESS_DEV << TRB_TYPE_SHIFT) | (slot_id << 24u));
    ring_db(0u, 0u);
    cc = wait_cmd_cmpl(&s);
    if (cc != CC_SUCCESS) { DBG_PUTS("USB: addr_device cc="); DBG_HEX8((uint8_t)cc); DBG_NL(); }
    return (cc == CC_SUCCESS) ? 0 : -1;
}

/* ── EP0 control transfer ────────────────────────────────────────────────── */
static void ep0_init(uint32_t slot)
{
    /* Select the per-slot ring state. Do NOT reset enq/ccs here — they must
     * persist between transfers so our enqueue pointer tracks the HC's
     * dequeue pointer. The state is initialised in setup_input_ctx(). */
    ep0_slot_cur = slot;
}

static void ep0_push(Trb *ring, uint64_t param, uint32_t status, uint32_t ctrl_template)
{
    Trb     *t        = &ring[ep0_enq];
    uint64_t rp       = ep0_ring_phys(ep0_slot_cur);
    uint32_t ring_off = (ep0_slot_cur == 1u) ? USB_EP0_RING1_OFF : USB_EP0_RING2_OFF;

    trb_set(t, param, status, ctrl_template | ep0_ccs);
    usb_clean_range(usb_phys(ring_off) + ep0_enq * 16u, 16u);
    ep0_enq++;
    if (ep0_enq >= EP0_RING_TRBS - 1u) {
        Trb *link = &ring[EP0_RING_TRBS - 1u];
        trb_set(link, rp, 0u, (TRB_LINK << TRB_TYPE_SHIFT) | TRB_TC | ep0_ccs);
        usb_clean_range(usb_phys(ring_off) + (EP0_RING_TRBS - 1u) * 16u, 16u);
        ep0_ccs ^= 1u;
        ep0_enq = 0u;
    }
}

/* Poll event ring for one Transfer Completion event; discard others. */
static uint32_t wait_xfer_cmpl(void)
{
    uint32_t deadline = 500u;
    while (deadline-- != 0u) {
        Trb *ev = &s_evt_ring[s_evt_deq];
        uint32_t ctrl, type, cc;

        usb_inv_range(usb_phys(USB_EVT_RING_OFF) + s_evt_deq * 16u, 16u);
        ctrl = ev->w3;
        if ((ctrl & 1u) != s_evt_ccs) { usb_delay_us(1000u); continue; }

        type = (ctrl >> TRB_TYPE_SHIFT) & 0x3Fu;
        cc   = (ev->w2 >> 24u) & 0xFFu;

        s_evt_deq++;
        if (s_evt_deq >= EVT_RING_TRBS) { s_evt_deq = 0u; s_evt_ccs ^= 1u; }
        ir0_write64(0x18u, usb_phys(USB_EVT_RING_OFF) + s_evt_deq * 16u);

        if (type == TRB_EV_TRANSFER) {
            return (cc == CC_SUCCESS || cc == CC_SHORT_PKT) ? 0u : cc;
        }
    }
    return 0xFFu;  /* timeout – treat as success to not stall enumeration */
}

/* Issue a USB control transfer on EP0 of 'slot'. */
static int ctrl_xfer(uint32_t slot,
                     uint8_t bmRequestType, uint8_t bRequest,
                     uint16_t wValue, uint16_t wIndex, uint16_t wLength,
                     uint64_t data_phys)
{
    Trb    *ring = ep0_ring_ptr(slot);
    int     dir_in = (bmRequestType & 0x80u) != 0u;
    uint32_t trt = (wLength == 0u) ? 0u : (dir_in ? 3u : 2u);
    uint32_t setup_w0, setup_w1;
    int      rc;

    DBG_PUTS("USB: ctrl s="); DBG_HEX8((uint8_t)slot);
    DBG_PUTS(" rt="); DBG_HEX8(bmRequestType);
    DBG_PUTS(" r="); DBG_HEX8(bRequest);
    DBG_PUTS(" v="); DBG_HEX16(wValue);
    DBG_PUTS(" i="); DBG_HEX16(wIndex);
    DBG_PUTS(" l="); DBG_HEX16(wLength);
    DBG_NL();

    ep0_init(slot);

    setup_w0 = (uint32_t)bmRequestType
             | ((uint32_t)bRequest <<  8u)
             | ((uint32_t)wValue   << 16u);
    setup_w1 = (uint32_t)wIndex
             | ((uint32_t)wLength  << 16u);

    ep0_push(ring,
             ((uint64_t)setup_w1 << 32u) | setup_w0,
             8u,
             (TRB_SETUP_STAGE << TRB_TYPE_SHIFT) | TRB_IDT | (trt << 16u));

    if (wLength > 0u) {
        if (data_phys != 0u) { usb_inv_range(data_phys, wLength); }
        ep0_push(ring, data_phys, (uint32_t)wLength,
                 (TRB_DATA_STAGE << TRB_TYPE_SHIFT) | (dir_in ? TRB_DIR_IN : 0u));
    }

    ep0_push(ring, 0u, 0u,
             (TRB_STATUS_STAGE << TRB_TYPE_SHIFT) | TRB_IOC |
             (dir_in ? 0u : TRB_DIR_IN));

    ring_db(slot, 1u);  /* EP0 doorbell: DCI = 1 */

    rc = (int)wait_xfer_cmpl();
    DBG_PUTS("USB:  -> cc="); DBG_HEX8((uint8_t)rc); DBG_NL();
    return rc;
}

static uint8_t *data_buf(void) { return (uint8_t *)usb_ptr(USB_DATA_BUF_OFF); }

/* ── Descriptor helpers ──────────────────────────────────────────────────── */
static int get_device_descriptor(uint32_t slot, uint8_t *out_class)
{
    uint8_t *buf = data_buf();
    int rc;
    usb_zero(buf, 18u);
    usb_clean_range(usb_phys(USB_DATA_BUF_OFF), 18u);
    rc = ctrl_xfer(slot, USB_DIR_IN | USB_TYPE_STD | USB_RCPT_DEV,
                   USB_REQ_GET_DESC, (uint16_t)(USB_DTYPE_DEVICE << 8u),
                   0u, 18u, usb_phys(USB_DATA_BUF_OFF));
    if (rc == 0) {
        usb_inv_range(usb_phys(USB_DATA_BUF_OFF), 18u);
        if (out_class) { *out_class = buf[4u]; }
    }
    return rc;
}

static int get_config_descriptor(uint32_t slot, uint16_t *out_total)
{
    uint8_t  *buf = data_buf();
    uint16_t  total;
    int       rc;

    usb_zero(buf, 9u);
    usb_clean_range(usb_phys(USB_DATA_BUF_OFF), 9u);
    rc = ctrl_xfer(slot, USB_DIR_IN | USB_TYPE_STD | USB_RCPT_DEV,
                   USB_REQ_GET_DESC, (uint16_t)(USB_DTYPE_CONFIG << 8u),
                   0u, 9u, usb_phys(USB_DATA_BUF_OFF));
    if (rc != 0) { return rc; }
    usb_inv_range(usb_phys(USB_DATA_BUF_OFF), 9u);

    total = (uint16_t)buf[2u] | ((uint16_t)buf[3u] << 8u);
    if (total > 512u) { total = 512u; }
    if (total > 9u) {
        usb_zero(buf, total);
        usb_clean_range(usb_phys(USB_DATA_BUF_OFF), total);
        rc = ctrl_xfer(slot, USB_DIR_IN | USB_TYPE_STD | USB_RCPT_DEV,
                       USB_REQ_GET_DESC, (uint16_t)(USB_DTYPE_CONFIG << 8u),
                       0u, total, usb_phys(USB_DATA_BUF_OFF));
        if (rc != 0) { return rc; }
        usb_inv_range(usb_phys(USB_DATA_BUF_OFF), total);
    }
    if (out_total) { *out_total = total; }
    return 0;
}

/* Scan config descriptor for a HID interface with an INT-IN endpoint. */
static int find_hid_ep(uint16_t total,
                       uint8_t *out_cfg, uint8_t *out_iface,
                       uint8_t *out_ep,  uint16_t *out_maxpkt,
                       uint8_t *out_interval)
{
    uint8_t *buf = data_buf();
    uint8_t *p   = buf;
    uint8_t *end = buf + total;
    uint8_t  cur_iface = 0u;
    int      in_hid    = 0;

    if (total >= 6u && buf[1u] == USB_DTYPE_CONFIG) {
        *out_cfg = buf[5u];
    }

    while (p < end) {
        uint8_t len  = p[0u];
        uint8_t type = p[1u];
        if (len < 2u) { break; }

        if (type == 0x04u) {                          /* Interface descriptor */
            cur_iface = p[2u];
            in_hid    = (p[5u] == 0x03u);             /* bInterfaceClass=HID */
        }
        if (in_hid && type == 0x05u && len >= 7u) {  /* Endpoint descriptor  */
            uint8_t  ep_addr  = p[2u];
            uint8_t  attr     = p[3u];
            uint16_t maxpkt   = (uint16_t)p[4u] | ((uint16_t)p[5u] << 8u);
            if ((ep_addr & 0x80u) != 0u && (attr & 0x03u) == 0x03u) {  /* INT IN */
                *out_iface    = cur_iface;
                *out_ep       = ep_addr;
                *out_maxpkt   = maxpkt;
                *out_interval = p[6u];
                return 0;
            }
        }
        p += len;
    }
    return -1;
}

/* ── Configure INT-IN endpoint ───────────────────────────────────────────── */
static int xhci_configure_ep(uint32_t slot, uint8_t ep_addr,
                              uint16_t maxpkt, uint8_t interval)
{
    uint32_t  dci       = (uint32_t)((ep_addr & 0x0Fu) * 2u) + 1u;
    uint64_t  rp        = usb_phys(USB_INT_RING_OFF);
    CtxEntry *icc, *slot_in, *ep_in;
    uint32_t  cc, s2 = 0u;

    /* Init INT-IN transfer ring */
    usb_zero(usb_ptr(USB_INT_RING_OFF), INT_RING_TRBS * 16u);
    s_int_ring = (Trb *)usb_ptr(USB_INT_RING_OFF);
    s_int_enq  = 0u;
    s_int_ccs  = 1u;
    trb_set(&s_int_ring[INT_RING_TRBS - 1u], rp, 0u,
            (TRB_LINK << TRB_TYPE_SHIFT) | TRB_TC | 1u);
    usb_clean_range(rp, INT_RING_TRBS * 16u);

    /* Input Control Context: add slot (bit 0) + target EP DCI.
     * Each context entry is 64 B (CSZ=1 on TH1520); zero the full entry so
     * reserved fields don't carry stale state into the HC. */
    icc = in_ctx(0u);
    usb_zero(icc, sizeof(CtxEntry));
    icc->w[1] = (1u << 0u) | (1u << dci);

    /* Slot context: copy from output, bump last-valid-EP */
    {
        CtxEntry *src = out_ctx(slot, 0u);
        uint32_t i;
        usb_inv_range(usb_phys((slot == 1u) ? USB_OUT_CTX1_OFF : USB_OUT_CTX2_OFF),
                      sizeof(CtxEntry));
        slot_in = in_ctx(1u);
        for (i = 0u; i < 16u; i++) { slot_in->w[i] = src->w[i]; }
        slot_in->w[0] = (slot_in->w[0] & ~(0x1Fu << 27u)) | (dci << 27u);
    }

    /* INT-IN endpoint context (index dci + 1 in the input context array) */
    ep_in = in_ctx(dci + 1u);
    usb_zero(ep_in, sizeof(CtxEntry));
    ep_in->w[0] = (uint32_t)interval << 16u;
    ep_in->w[1] = (EP_TYPE_INT_IN << 3u) | (3u << 1u) | ((uint32_t)maxpkt << 16u);
    ep_in->w[2] = (uint32_t)(rp & 0xFFFFFFFFu) | 1u;  /* DCS=1 */
    ep_in->w[3] = (uint32_t)(rp >> 32u);
    ep_in->w[4] = (uint32_t)maxpkt;

    /* Flush the full Input Context (icc + slot + EP0..EPdci), 64 B per entry. */
    usb_clean_range(usb_phys(USB_IN_CTX_OFF), (dci + 2u) * sizeof(CtxEntry));
    cmd_enqueue(usb_phys(USB_IN_CTX_OFF), 0u,
                (TRB_CONFIG_EP << TRB_TYPE_SHIFT) | (slot << 24u));
    ring_db(0u, 0u);
    cc = wait_cmd_cmpl(&s2);
    if (cc != CC_SUCCESS) { DBG_PUTS("USB: config_ep cc="); DBG_HEX8((uint8_t)cc); DBG_NL(); }

    s_hid_dci = (uint8_t)dci;
    return (cc == CC_SUCCESS) ? 0 : -1;
}

/* ── INT-IN transfer queue and poll ─────────────────────────────────────── */
static void int_in_rearm(void)
{
    uint64_t buf_phys = usb_phys(USB_HID_REPORT_OFF);
    Trb     *t;

    usb_inv_range(buf_phys, s_hid_report_len);
    t = &s_int_ring[s_int_enq];
    trb_set(t, buf_phys, s_hid_report_len,
            (TRB_NORMAL << TRB_TYPE_SHIFT) | TRB_IOC | s_int_ccs);
    usb_clean_range(usb_phys(USB_INT_RING_OFF) + s_int_enq * 16u, 16u);

    s_int_enq++;
    if (s_int_enq >= INT_RING_TRBS - 1u) {
        Trb *link = &s_int_ring[INT_RING_TRBS - 1u];
        trb_set(link, usb_phys(USB_INT_RING_OFF), 0u,
                (TRB_LINK << TRB_TYPE_SHIFT) | TRB_TC | s_int_ccs);
        usb_clean_range(usb_phys(USB_INT_RING_OFF) + (INT_RING_TRBS - 1u) * 16u, 16u);
        s_int_ccs ^= 1u;
        s_int_enq = 0u;
    }
    ring_db(s_hid_slot, (uint32_t)s_hid_dci);
}

/* Returns 1 if a new report arrived, 0 otherwise (non-blocking). */
static int int_in_poll_once(void)
{
    Trb    *ev = &s_evt_ring[s_evt_deq];
    uint32_t ctrl, type, cc;

    usb_inv_range(usb_phys(USB_EVT_RING_OFF) + s_evt_deq * 16u, 16u);
    ctrl = ev->w3;
    if ((ctrl & 1u) != s_evt_ccs) { return 0; }

    type = (ctrl >> TRB_TYPE_SHIFT) & 0x3Fu;
    cc   = (ev->w2 >> 24u) & 0xFFu;

    s_evt_deq++;
    if (s_evt_deq >= EVT_RING_TRBS) { s_evt_deq = 0u; s_evt_ccs ^= 1u; }
    ir0_write64(0x18u, usb_phys(USB_EVT_RING_OFF) + s_evt_deq * 16u);

    if (type == TRB_EV_TRANSFER && (cc == CC_SUCCESS || cc == CC_SHORT_PKT)) {
        return 1;
    }
    return 0;
}

/* ── Hub helpers ─────────────────────────────────────────────────────────── */
static int get_hub_descriptor(uint32_t slot, uint8_t *out_nports)
{
    uint8_t *buf = data_buf();
    int rc;
    usb_zero(buf, 9u);
    usb_clean_range(usb_phys(USB_DATA_BUF_OFF), 9u);
    rc = ctrl_xfer(slot, USB_DIR_IN | USB_TYPE_CLS | USB_RCPT_DEV,
                   USB_REQ_GET_DESC, (uint16_t)(USB_DTYPE_HUB << 8u),
                   0u, 9u, usb_phys(USB_DATA_BUF_OFF));
    if (rc == 0) {
        usb_inv_range(usb_phys(USB_DATA_BUF_OFF), 9u);
        if (out_nports) { *out_nports = buf[2u]; }
    }
    return rc;
}

static void hub_port_power(uint32_t hub_slot, uint32_t port)
{
    int rc = ctrl_xfer(hub_slot, USB_DIR_OUT | USB_TYPE_CLS | USB_RCPT_PORT,
                       0x03u, 8u, (uint16_t)port, 0u, 0u);  /* SET_FEATURE PORT_POWER */
    if (rc != 0) {
        DBG_PUTS("USB: port_power port="); DBG_HEX8((uint8_t)port);
        DBG_PUTS(" cc="); DBG_HEX8((uint8_t)rc); DBG_NL();
    }
}

static uint16_t hub_port_status(uint32_t hub_slot, uint32_t port)
{
    uint8_t *buf = data_buf();
    int      rc;
    usb_zero(buf, 4u);
    /* Flush our pre-zeroed cache line to memory BEFORE the transfer so the
     * device's DMA write lands in memory without racing a later writeback. */
    usb_clean_range(usb_phys(USB_DATA_BUF_OFF), 4u);
    rc = ctrl_xfer(hub_slot, USB_DIR_IN | USB_TYPE_CLS | USB_RCPT_PORT,
                   0x00u, 0u, (uint16_t)port, 4u, usb_phys(USB_DATA_BUF_OFF));
    usb_inv_range(usb_phys(USB_DATA_BUF_OFF), 4u);
    if (rc != 0) {
        DBG_PUTS("USB: port_status port="); DBG_HEX8((uint8_t)port);
        DBG_PUTS(" cc="); DBG_HEX8((uint8_t)rc); DBG_NL();
    }
    return (uint16_t)buf[0u] | ((uint16_t)buf[1u] << 8u);
}

static void hub_port_reset(uint32_t hub_slot, uint32_t port)
{
    ctrl_xfer(hub_slot, USB_DIR_OUT | USB_TYPE_CLS | USB_RCPT_PORT,
              0x03u, 4u, (uint16_t)port, 0u, 0u);  /* SET_FEATURE PORT_RESET */
}

static void hub_clear_port_reset(uint32_t hub_slot, uint32_t port)
{
    ctrl_xfer(hub_slot, USB_DIR_OUT | USB_TYPE_CLS | USB_RCPT_PORT,
              0x01u, 0x14u, (uint16_t)port, 0u, 0u); /* CLEAR_FEATURE C_PORT_RESET */
}

static uint32_t hub_port_speed_code(uint16_t psts)
{
    if (psts & (1u << 9u)) { return 3u; }   /* HighSpeed */
    if (psts & (1u << 2u)) { return 2u; }   /* LowSpeed */
    return 1u;                               /* FullSpeed */
}

/* ── Device enumeration ──────────────────────────────────────────────────── */
/*
 * Enumerate the device at (root_port, speed), optionally behind hub
 * (hub_slot/hub_port).  Recursion depth is bounded by the single-hub
 * scenario this demo targets.  Sets s_hid_slot on success.
 */
static int enumerate_device(uint32_t root_port, uint32_t speed,
                             uint32_t hub_slot, uint32_t hub_port,
                             uint32_t route_string)
{
    uint32_t slot_id;
    uint8_t  dev_class = 0u;
    int      rc;

    DBG_PUTS("USB: enum port="); DBG_HEX8((uint8_t)root_port);
    DBG_PUTS(" speed="); DBG_HEX8((uint8_t)speed);
    DBG_PUTS(" hub="); DBG_HEX8((uint8_t)hub_slot);
    DBG_PUTS("/"); DBG_HEX8((uint8_t)hub_port);
    DBG_NL();
    slot_id = xhci_enable_slot();
    if (slot_id == 0u) { DBG_PUTS("USB: enable_slot failed\n"); return -1; }

    setup_input_ctx(slot_id, root_port, speed,
                    speed_ep0_maxpkt(speed), hub_slot, hub_port, route_string);

    rc = xhci_address_device(slot_id);
    if (rc != 0) { DBG_PUTS("USB: address_device failed\n"); return -1; }

    rc = get_device_descriptor(slot_id, &dev_class);
    if (rc != 0) { DBG_PUTS("USB: devdesc failed\n"); return -1; }
    {
        uint8_t *buf = data_buf();
        uint16_t vid = (uint16_t)buf[8u] | ((uint16_t)buf[9u] << 8u);
        uint16_t pid = (uint16_t)buf[10u] | ((uint16_t)buf[11u] << 8u);
        DBG_PUTS("USB: slot="); DBG_HEX8((uint8_t)slot_id);
        DBG_PUTS(" class="); DBG_HEX8(dev_class);
        DBG_PUTS(" sub="); DBG_HEX8(buf[5u]);
        DBG_PUTS(" VID="); DBG_HEX16(vid);
        DBG_PUTS(" PID="); DBG_HEX16(pid);
        DBG_NL();
    }

    if (dev_class == 0x09u) {
        /* This device is a hub – enumerate downstream ports */
        uint8_t  nports    = 0u;
        uint8_t  cfg_val   = 1u;
        uint16_t cfg_total = 0u;
        uint32_t p;

        s_hub_slot = slot_id;

        get_config_descriptor(slot_id, &cfg_total);
        if (cfg_total >= 6u) { cfg_val = data_buf()[5u]; }
        ctrl_xfer(slot_id, USB_DIR_OUT | USB_TYPE_STD | USB_RCPT_DEV,
                  USB_REQ_SET_CFG, (uint16_t)cfg_val, 0u, 0u, 0u);

        get_hub_descriptor(slot_id, &nports);
        if (nports == 0u || nports > 7u) { nports = 4u; }
        DBG_PUTS("USB: hub nports="); DBG_HEX8(nports); DBG_NL();

        for (p = 1u; p <= nports; p++) { hub_port_power(slot_id, p); }
        usb_delay_ms(100u);

        for (p = 1u; p <= nports; p++) {
            uint16_t psts;
            uint32_t child_speed;

            psts = hub_port_status(slot_id, p);
            DBG_PUTS("USB: hub port "); DBG_HEX8((uint8_t)p); DBG_PUTS(" psts="); DBG_HEX16(psts);
            if ((psts & 1u) == 0u) { DBG_PUTS(" (empty)\n"); continue; }

            hub_port_reset(slot_id, p);
            usb_delay_ms(50u);
            psts        = hub_port_status(slot_id, p);
            child_speed = hub_port_speed_code(psts);
            hub_clear_port_reset(slot_id, p);
            DBG_PUTS(" speed="); DBG_HEX8((uint8_t)child_speed); DBG_NL();

            /* Route string: hub port number occupies first nibble (depth 1) */
            rc = enumerate_device(root_port, child_speed,
                                  slot_id, p, p & 0xFu);
            if (rc == 0) { return 0; }
        }
        return -1;  /* no HID device found behind hub */
    }

    /* Non-hub: look for a HID interface with an INT-IN endpoint */
    {
        uint8_t  cfg_val   = 1u;
        uint8_t  iface_num = 0u;
        uint8_t  ep_addr   = 0u;
        uint16_t ep_maxpkt = 8u;
        uint8_t  ep_intv   = 10u;
        uint16_t cfg_total = 0u;

        rc = get_config_descriptor(slot_id, &cfg_total);
        if (rc != 0) { return -1; }

        rc = find_hid_ep(cfg_total, &cfg_val, &iface_num,
                         &ep_addr, &ep_maxpkt, &ep_intv);
        if (rc != 0) { DBG_PUTS("USB: no HID INT-IN ep\n"); return -1; }
        DBG_PUTS("USB: HID ep="); DBG_HEX8(ep_addr);
        DBG_PUTS(" maxpkt="); DBG_HEX16(ep_maxpkt);
        DBG_PUTS(" intv="); DBG_HEX8(ep_intv);
        DBG_NL();

        ctrl_xfer(slot_id, USB_DIR_OUT | USB_TYPE_STD | USB_RCPT_DEV,
                  USB_REQ_SET_CFG, (uint16_t)cfg_val, 0u, 0u, 0u);

        /* HID SET_IDLE(0) – suppress repeated identical reports */
        ctrl_xfer(slot_id, USB_DIR_OUT | USB_TYPE_CLS | USB_RCPT_IFC,
                  HID_REQ_SET_IDLE, 0u, (uint16_t)iface_num, 0u, 0u);

        /* HID SET_PROTOCOL(1) – boot protocol for reliable minimal report */
        ctrl_xfer(slot_id, USB_DIR_OUT | USB_TYPE_CLS | USB_RCPT_IFC,
                  HID_REQ_SET_PROTO, 1u, (uint16_t)iface_num, 0u, 0u);

        rc = xhci_configure_ep(slot_id, ep_addr, ep_maxpkt, ep_intv);
        if (rc != 0) { DBG_PUTS("USB: configure_ep failed\n"); return -1; }
        DBG_PUTS("USB: HID ready slot="); DBG_HEX8((uint8_t)slot_id); DBG_NL();

        s_hid_slot       = (uint8_t)slot_id;
        s_hid_report_len = (ep_maxpkt < 64u) ? ep_maxpkt : 64u;
        s_hid_report     = (uint8_t *)usb_ptr(USB_HID_REPORT_OFF);
        usb_zero(s_hid_report, 64u);

        int_in_rearm();
        return 0;
    }
}

/* ── Nintendo Classic Controller button decoding ─────────────────────────── */
/*
 * Mayflash W010 / compatible 8-byte report (no Report ID):
 *   Byte 0: LX  (0=left, 128=center, 255=right)
 *   Byte 1: LY  (0=up,   128=center, 255=down)
 *   Byte 2: RX
 *   Byte 3: RY
 *   Byte 4: HAT (0=N, 1=NE, 2=E, 3=SE, 4=S, 5=SW, 6=W, 7=NW, 8=neutral)
 *   Byte 5: face/shoulder  [Y, B, A, X, L, R, ZL, ZR]
 *   Byte 6: menu           [Select, Home, Start, ...]
 */
#define BTN_Y       (1u <<  0)
#define BTN_B       (1u <<  1)
#define BTN_A       (1u <<  2)
#define BTN_X       (1u <<  3)
#define BTN_L       (1u <<  4)
#define BTN_R       (1u <<  5)
#define BTN_ZL      (1u <<  6)
#define BTN_ZR      (1u <<  7)
#define BTN_SELECT  (1u <<  8)
#define BTN_HOME    (1u <<  9)
#define BTN_START   (1u << 10)
#define BTN_DPAD_N  (1u << 11)
#define BTN_DPAD_E  (1u << 12)
#define BTN_DPAD_S  (1u << 13)
#define BTN_DPAD_W  (1u << 14)

static uint32_t decode_classic_buttons(const uint8_t *rep)
{
    /*
     * 056E:2007 is the iBuffalo "Classic USB Gamepad" family. Clone
     * variants disagree on exactly which byte holds the face buttons, so
     * we sample multiple plausible bytes/bits and union the results. The
     * raw report bytes are also dumped to UART when any byte changes
     * (see __calynda_rt_usb_classic_buttons) so the mapping can be
     * verified empirically by pressing each button.
     *
     * Common iBuffalo SNES-style 8-byte layout:
     *   [0] X axis (00 left, 80 center, FF right)
     *   [1] Y axis (00 up,   80 center, FF down)
     *   [2] 00  constant
     *   [3] 80  constant or hat (some clones)
     *   [4] hat: 0..7 = directions, 0x0F = neutral (some clones)
     *   [5] face buttons:  bit0..3 = Y, B, A, X ;  bit4..5 = L, R
     *   [6] meta buttons:  bit0 = Select, bit1 = Start (no Home on SNES)
     *   [7] 00
     */
    uint32_t bits = 0u;
    uint8_t  x    = rep[0u];
    uint8_t  y    = rep[1u];
    uint8_t  hat  = rep[4u];
    uint8_t  b5   = rep[5u];
    uint8_t  b6   = rep[6u];

    /* HAT → D-pad (only if hat is in valid range) */
    if (hat <= 7u) {
        if (hat == 0u || hat == 1u || hat == 7u) { bits |= BTN_DPAD_N; }
        if (hat == 1u || hat == 2u || hat == 3u) { bits |= BTN_DPAD_E; }
        if (hat == 3u || hat == 4u || hat == 5u) { bits |= BTN_DPAD_S; }
        if (hat == 5u || hat == 6u || hat == 7u) { bits |= BTN_DPAD_W; }
    }

    /* Analog-style axis → D-pad (iBuffalo native: 0x00 / 0x80 / 0xFF). */
    if (x < 0x40u) { bits |= BTN_DPAD_W; }
    if (x > 0xC0u) { bits |= BTN_DPAD_E; }
    if (y < 0x40u) { bits |= BTN_DPAD_N; }
    if (y > 0xC0u) { bits |= BTN_DPAD_S; }

    if (b5 & (1u << 0u)) { bits |= BTN_Y; }
    if (b5 & (1u << 1u)) { bits |= BTN_B; }
    if (b5 & (1u << 2u)) { bits |= BTN_A; }
    if (b5 & (1u << 3u)) { bits |= BTN_X; }
    if (b5 & (1u << 4u)) { bits |= BTN_L; }
    if (b5 & (1u << 5u)) { bits |= BTN_R; }
    if (b5 & (1u << 6u)) { bits |= BTN_ZL; }
    if (b5 & (1u << 7u)) { bits |= BTN_ZR; }

    if (b6 & (1u << 0u)) { bits |= BTN_SELECT; }
    if (b6 & (1u << 1u)) { bits |= BTN_START; }
    if (b6 & (1u << 2u)) { bits |= BTN_HOME; }

    /* iBuffalo-native fallback: byte 3 holds face buttons on some clones.
     * Bits: 0=Y, 1=B, 2=A, 3=X, 4=L, 5=R, 6=Select, 7=Start. */
    {
        uint8_t b3 = rep[3u];
        if (b3 & (1u << 0u)) { bits |= BTN_Y; }
        if (b3 & (1u << 1u)) { bits |= BTN_B; }
        if (b3 & (1u << 2u)) { bits |= BTN_A; }
        if (b3 & (1u << 3u)) { bits |= BTN_X; }
        if (b3 & (1u << 4u)) { bits |= BTN_L; }
        if (b3 & (1u << 5u)) { bits |= BTN_R; }
        if (b3 & (1u << 6u)) { bits |= BTN_SELECT; }
        if (b3 & (1u << 7u)) { bits |= BTN_START; }
    }

    return bits;
}

/* ── Framebuffer drawing (local – avoids static linkage of runtime_boot.c) ── */
static void hid_fb_rect(int32_t x0, int32_t y0, int32_t x1, int32_t y1,
                        uint32_t color)
{
    volatile uint32_t *fb = (volatile uint32_t *)(uintptr_t)HID_FB_BASE;
    int32_t y;
    for (y = y0; y <= y1; y++) {
        int32_t x;
        volatile uint32_t *row = fb + (size_t)(uint32_t)y * (size_t)HID_FB_WIDTH;
        for (x = x0; x <= x1; x++) { row[x] = color; }
    }
}

static void hid_fb_flush(void)
{
    uint64_t line = HID_FB_BASE & ~(uint64_t)(HID_CMO_STRIDE - 1u);
    uint64_t end  = HID_FB_BASE + HID_FB_SIZE_BYTES;
    while (line < end) { usb_dcache_clean_line(line); line += HID_CMO_STRIDE; }
    usb_dcache_final();
}

/* ── USB status strip (16-pixel tall bar above controller body) ─────────── */
/*
 * The strip is drawn at y=168–183, spanning the full width.  Colors:
 *   C_STATUS_INIT  – cyan:    xHCI init in progress / enumerating
 *   C_STATUS_READY – green:   HID device found and polling
 *   C_STATUS_ERROR – red:     enumeration failed / no device
 */
#define C_STATUS_INIT   0x00AAAAu   /* bright cyan:  USB init in progress */
#define C_STATUS_READY  0x00AA00u   /* bright green: HID device found     */
#define C_STATUS_ERROR  0xAA0000u   /* bright red:   enumeration failed   */

static void draw_status_strip(uint32_t color)
{
    hid_fb_rect(260, 168, 1660, 183, color);
}

/* ── Controller-layout visual constants ──────────────────────────────────── */
/*
 * Controller body centered on 1920×1080.  All pixel coordinates are
 * inclusive (x0,y0)–(x1,y1) as passed to hid_fb_rect.
 *
 * Layout:
 *   Body:       (260, 240) – (1660, 840)   [1400 × 600]
 *   ZL zone:    (260, 200) – (540, 260)    top-left shoulder
 *   L zone:     (280, 260) – (520, 320)    left shoulder
 *   ZR zone:    (1380, 200) – (1660, 260)  top-right shoulder
 *   R zone:     (1400, 260) – (1640, 320)  right shoulder
 *   D-pad ctr:  (580, 540)
 *   Face ctr:   (1340, 540)
 *   Select:     (820, 520) – (910, 560)
 *   Home:       (935, 510) – (985, 570)
 *   Start:      (1010, 520) – (1100, 560)
 */
#define C_BG       0x0A0A1Au  /* dark navy background        */
#define C_BODY     0x282835u  /* controller body dark gray   */
#define C_OUTLINE  0x404050u  /* body outline                */

/* Colors: idle / pressed pairs */
#define C_Y_IDLE   0x484800u
#define C_Y_PRESS  0xFFFF00u
#define C_B_IDLE   0x000048u
#define C_B_PRESS  0x4080FFu
#define C_A_IDLE   0x480000u
#define C_A_PRESS  0xFF3030u
#define C_X_IDLE   0x004800u
#define C_X_PRESS  0x30FF30u
#define C_L_IDLE   0x203808u
#define C_L_PRESS  0x70C020u
#define C_R_IDLE   0x203808u
#define C_R_PRESS  0x70C020u
#define C_ZL_IDLE  0x380820u
#define C_ZL_PRESS 0xFF2080u
#define C_ZR_IDLE  0x380820u
#define C_ZR_PRESS 0xFF2080u
#define C_SEL_IDLE 0x282828u
#define C_SEL_PRESS 0xCCCCCCu
#define C_HOME_IDLE  0x504000u
#define C_HOME_PRESS 0xFFCC00u
#define C_STA_IDLE  0x282828u
#define C_STA_PRESS 0xCCCCCCu
#define C_DP_IDLE  0x1A3020u
#define C_DP_PRESS 0x00FF80u

static void draw_controller_static(void)
{
    /* Background — painted ONCE at init. */
    hid_fb_rect(0, 0, HID_FB_WIDTH - 1, HID_FB_HEIGHT - 1, C_BG);

    /* Controller body */
    hid_fb_rect(260, 240, 1660, 840, C_BODY);
    /* Thin outline */
    hid_fb_rect(260, 240, 1660, 244, C_OUTLINE);
    hid_fb_rect(260, 836, 1660, 840, C_OUTLINE);
    hid_fb_rect(260, 240, 264, 840, C_OUTLINE);
    hid_fb_rect(1656, 240, 1660, 840, C_OUTLINE);
}

static void draw_controller(uint32_t btns)
{
    /* ZL shoulder (top-left) */
    hid_fb_rect(260, 200, 540, 260,
                (btns & BTN_ZL) ? C_ZL_PRESS : C_ZL_IDLE);
    /* L shoulder */
    hid_fb_rect(280, 260, 520, 320,
                (btns & BTN_L) ? C_L_PRESS : C_L_IDLE);

    /* ZR shoulder (top-right) */
    hid_fb_rect(1380, 200, 1660, 260,
                (btns & BTN_ZR) ? C_ZR_PRESS : C_ZR_IDLE);
    /* R shoulder */
    hid_fb_rect(1400, 260, 1640, 320,
                (btns & BTN_R) ? C_R_PRESS : C_R_IDLE);

    /* D-pad: center (580, 540), arm width 46, arm length 90 */
    /* Up arm */
    hid_fb_rect(557, 450, 603, 540,
                (btns & BTN_DPAD_N) ? C_DP_PRESS : C_DP_IDLE);
    /* Down arm */
    hid_fb_rect(557, 540, 603, 630,
                (btns & BTN_DPAD_S) ? C_DP_PRESS : C_DP_IDLE);
    /* Left arm */
    hid_fb_rect(490, 517, 580, 563,
                (btns & BTN_DPAD_W) ? C_DP_PRESS : C_DP_IDLE);
    /* Right arm */
    hid_fb_rect(580, 517, 670, 563,
                (btns & BTN_DPAD_E) ? C_DP_PRESS : C_DP_IDLE);
    /* Center cross fill (always body color to hide overlap gaps) */
    hid_fb_rect(557, 517, 603, 563, C_BODY);

    /* Face buttons: center (1340, 540), each ~60×60 */
    /* A – right */
    hid_fb_rect(1400, 510, 1460, 570,
                (btns & BTN_A) ? C_A_PRESS : C_A_IDLE);
    /* B – bottom */
    hid_fb_rect(1310, 600, 1370, 660,
                (btns & BTN_B) ? C_B_PRESS : C_B_IDLE);
    /* X – top */
    hid_fb_rect(1310, 420, 1370, 480,
                (btns & BTN_X) ? C_X_PRESS : C_X_IDLE);
    /* Y – left */
    hid_fb_rect(1220, 510, 1280, 570,
                (btns & BTN_Y) ? C_Y_PRESS : C_Y_IDLE);

    /* Center buttons */
    /* Select */
    hid_fb_rect(820, 520, 910, 560,
                (btns & BTN_SELECT) ? C_SEL_PRESS : C_SEL_IDLE);
    /* Home */
    hid_fb_rect(935, 510, 985, 570,
                (btns & BTN_HOME) ? C_HOME_PRESS : C_HOME_IDLE);
    /* Start */
    hid_fb_rect(1010, 520, 1100, 560,
                (btns & BTN_START) ? C_STA_PRESS : C_STA_IDLE);
}

/* ── Public API ─────────────────────────────────────────────────────────── */

void __calynda_rt_usb_init(void)
{
    uint32_t port;

    dwc3_set_host_mode();
    if (xhci_hc_init() != 0) { return; }
    usb_delay_ms(200u);  /* let ports settle after HC start */

    for (port = 0u; port < s_nports && port < 8u; port++) {
        uint32_t speed;
        if (xhci_port_reset(port) != 0) { continue; }
        speed = xhci_port_speed(port);
        if (speed == 0u) { continue; }
        if (enumerate_device(port, speed, 0u, 0u, 0u) == 0) {
            s_usb_ready = 1;
            DBG_PUTS("USB: controller found\n");
            break;
        }
    }
    if (!s_usb_ready) { DBG_PUTS("USB: no HID device found\n"); }
}

uint32_t __calynda_rt_usb_classic_buttons(void)
{
    if (!s_usb_ready) { return s_last_buttons; }

    if (int_in_poll_once()) {
        static uint8_t prev_rep[8] = { 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u };
        uint32_t i;
        int      changed = 0;
        usb_inv_range(usb_phys(USB_HID_REPORT_OFF), s_hid_report_len);
        for (i = 0u; i < 8u && i < s_hid_report_len; i++) {
            if (s_hid_report[i] != prev_rep[i]) { changed = 1; break; }
        }
        if (changed) {
            DBG_PUTS("HID:");
            for (i = 0u; i < 8u && i < s_hid_report_len; i++) {
                DBG_PUTS(" "); DBG_HEX8(s_hid_report[i]);
                prev_rep[i] = s_hid_report[i];
            }
            DBG_NL();
        }
        s_last_buttons = decode_classic_buttons(s_hid_report);
        int_in_rearm();
    }
    return s_last_buttons;
}

void __calynda_rt_controller_demo_hold(void)
{
    uint32_t prev_btns = 0xFFFFFFFFu;  /* force first draw */

    /* Paint static scenery ONCE. Subsequent frames only repaint the
     * button rects — the background and body never change, so redrawing
     * them every frame just creates flicker as the DC8200 scans out
     * partially-written pixels. */
    draw_controller_static();
    draw_controller(0u);
    draw_status_strip(C_STATUS_INIT);
    hid_fb_flush();

    __calynda_rt_usb_init();

    /* Update status strip: green = found, red = not found */
    draw_status_strip(s_usb_ready ? C_STATUS_READY : C_STATUS_ERROR);
    hid_fb_flush();

    for (;;) {
        uint32_t btns = __calynda_rt_usb_classic_buttons();

        if (btns != prev_btns) {
            draw_controller(btns);  /* button rects only */
            hid_fb_flush();
            prev_btns = btns;
        }

        usb_delay_us(4000u);  /* ~4 ms polling interval */
    }
}

#else  /* !MACHINE_TH1520 – provide empty stubs for non-TH1520 targets */

void __calynda_rt_usb_init(void) {}

uint32_t __calynda_rt_usb_classic_buttons(void) { return 0u; }

void __calynda_rt_controller_demo_hold(void)
{
    for (;;) {}
}

#endif /* MACHINE_TH1520 */
