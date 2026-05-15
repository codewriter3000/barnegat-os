/*
 * baremetal/hdmi_fb.c
 *
 * Bare-metal HDMI framebuffer test pattern for the BeagleV-Ahead (TH1520).
 *
 * How it works (warm-start approach)
 * -----------------------------------
 * The DC8200 display engine and DW-HDMI transmitter are left fully
 * configured by the prior Linux boot.  The DC8200's IOMMU maps the HDMI
 * plane framebuffer:
 *
 *   IOVA 0x67000000 → PA 0x100970000   (from /sys/kernel/debug/dri/0/*)
 *
 * Both the MMIO register state and the IOMMU page tables reside in DRAM
 * and survive the warm U-Boot handoff that loaded us.  We therefore do
 * not need to re-initialise the display pipeline; we only need to write
 * new pixels into the physical framebuffer that the DC8200 is already
 * scanning out.
 *
 * Display geometry (confirmed from live DRM state on the BeagleV-Ahead):
 *   1920 × 1080, XRGB8888, stride = 7680 bytes (1920 px × 4 B/px).
 */

#include <stdint.h>

/* ----------------------------------------------------------------
 * Minimal 16550-compatible UART TX for TH1520 UART0 (0xFFE7014000).
 * U-Boot already configured the divisor; no init required.
 * ---------------------------------------------------------------- */
#define TH1520_UART0  0xFFE7014000ULL
static void uart_putc(char c)
{
    volatile uint32_t *u = (volatile uint32_t *)TH1520_UART0;
    while (!(u[5] & 0x20U))   /* LSR[5] = THRE */
        ;
    u[0] = (uint32_t)(unsigned char)c;
}
static void uart_puts_bare(const char *s)
{
    while (*s) {
        if (*s == '\n') uart_putc('\r');
        uart_putc(*s++);
    }
}
static void uart_puthex(uint32_t v)
{
    static const char h[] = "0123456789ABCDEF";
    uart_putc('0'); uart_putc('x');
    for (int i = 28; i >= 0; i -= 4)
        uart_putc(h[(v >> i) & 0xFU]);
}
static void uart_puthex64(uint64_t v)
{
    static const char h[] = "0123456789ABCDEF";
    uart_putc('0'); uart_putc('x');
    for (int i = 60; i >= 0; i -= 4)
        uart_putc(h[(unsigned int)((v >> i) & 0xFU)]);
}
static void uart_dump_mmio32(uint64_t addr, int words)
{
    volatile uint32_t *mmio = (volatile uint32_t *)(uintptr_t)addr;

    for (int i = 0; i < words; i += 4) {
        uart_puthex64(addr + (uint64_t)(i * 4));
        uart_puts_bare(":");
        for (int j = 0; j < 4 && (i + j) < words; j++) {
            uart_putc(' ');
            uart_puthex(mmio[i + j]);
        }
        uart_putc('\n');
    }
}

/* Physical base address of our bare-metal framebuffer.
 * Must fit in 32 bits — the DC8200 FB_ADDRESS register is 32-bit.
 *
 * 0x04200000 = 2 MB above our binary load address (0x04000000).
 * The TH1520 security controller restricts the DC8200's AXI DMA master
 * to the lower DRAM region at cold boot.  0x50000000 is reachable by
 * the C910 CPU but causes a bus error on the DC8200 DMA path → the
 * display engine falls back to U-Boot's stale red-splash framebuffer.
 * 0x04200000 is in the same low region as the binary itself (confirmed
 * reachable by all AXI masters).  8 MB framebuffer: 0x04200000–0x049FFFFF.
 * Scratch region at 0x05000000 is unaffected. */
#define FB_PHYS   ((volatile uint32_t *)0x04200000ULL)

#define FB_WIDTH   1920
#define FB_HEIGHT  1080
#define FB_STRIDE_BYTES  (FB_WIDTH * 4U)
#define FB_SIZE_BYTES    (FB_STRIDE_BYTES * FB_HEIGHT)

/* Conservative stride for T-Head cache maintenance-by-address.
 * Linux discovers the real block size at runtime; here we step by 32 bytes so
 * every plausible line size on C9xx is covered at least once. */
#define THEAD_CMO_STRIDE 32U

/* XRGB8888: DC8200 on TH1520 uses standard XRGB byte order.
 * bits 23:16 = R, 15:8 = G, 7:0 = B; bits 31:24 are ignored. */
#define RGB(r, g, b)  ((uint32_t)(((uint32_t)(r) << 16) | \
                                   ((uint32_t)(g) << 8)  | \
                                   ((uint32_t)(b))))

/* ---------------------------------------------------------------------- */

static void fb_rect(int x0, int y0, int x1, int y1, uint32_t color)
{
    volatile uint32_t *p = FB_PHYS;
    for (int y = y0; y <= y1; y++) {
        for (int x = x0; x <= x1; x++) {
            p[y * FB_WIDTH + x] = color;
        }
    }
}

static void fb_fill(uint32_t color)
{
    fb_rect(0, 0, FB_WIDTH - 1, FB_HEIGHT - 1, color);
}

static void thead_dcache_clean_range(uintptr_t start, uintptr_t size)
{
    uintptr_t line = start & ~((uintptr_t)THEAD_CMO_STRIDE - 1U);
    uintptr_t end = start + size;

    while (line < end) {
        register uintptr_t addr __asm__("a0") = line;

        __asm__ volatile (".long 0x0295000b" : : "r"(addr) : "memory");
        line += THEAD_CMO_STRIDE;
    }

    __asm__ volatile (".long 0x0190000b" ::: "memory");
}

/*
 * Draw a horizontal-gradient background.
 * The gradient sweeps dark navy (top-left) → medium blue-grey (bottom-right).
 */
static void fb_gradient_bg(int y0, int y1)
{
    volatile uint32_t *p = FB_PHYS;
    int height = y1 - y0 + 1;
    for (int y = y0; y <= y1; y++) {
        uint32_t vy = (uint32_t)((y - y0) * 255 / height);
        for (int x = 0; x < FB_WIDTH; x++) {
            uint32_t vx = (uint32_t)(x * 255 / FB_WIDTH);
            uint32_t r  = 5  + (vy * 20 + vx * 10) / 255;
            uint32_t g  = 20 + (vy * 30 + vx * 20) / 255;
            uint32_t b  = 60 + (vy * 80 + vx * 60) / 255;
            p[y * FB_WIDTH + x] = RGB(r, g, b);
        }
    }
}

/* SMPTE-inspired colour bars (white, yellow, cyan, green, magenta, red, blue) */
static const uint32_t COLOUR_BARS[] = {
    RGB(0xFF, 0xFF, 0xFF), /* white   */
    RGB(0xFF, 0xFF, 0x00), /* yellow  */
    RGB(0x00, 0xFF, 0xFF), /* cyan    */
    RGB(0x00, 0xFF, 0x00), /* green   */
    RGB(0xFF, 0x00, 0xFF), /* magenta */
    RGB(0xFF, 0x00, 0x00), /* red     */
    RGB(0x00, 0x00, 0xFF), /* blue    */
};
#define NUM_BARS  (int)(sizeof(COLOUR_BARS) / sizeof(COLOUR_BARS[0]))

static void fb_colour_bars(int y0, int y1)
{
    for (int i = 0; i < NUM_BARS; i++) {
        int x0 = i       * FB_WIDTH / NUM_BARS;
        int x1 = (i + 1) * FB_WIDTH / NUM_BARS - 1;
        fb_rect(x0, y0, x1, y1, COLOUR_BARS[i]);
    }
}

static void fb_border(int x0, int y0, int x1, int y1,
                      uint32_t color, int thick)
{
    fb_rect(x0,            y0,            x1,            y0 + thick - 1, color);
    fb_rect(x0,            y1 - thick + 1, x1,           y1,             color);
    fb_rect(x0,            y0,            x0 + thick - 1, y1,            color);
    fb_rect(x1 - thick + 1, y0,           x1,            y1,             color);
}

/*
 * Render a single 8×8 glyph at pixel position (px, py).
 * Each glyph is 8 bytes; bit 7 of each byte is the left-most pixel.
 * Scale > 1 renders each logical pixel as a scale×scale block.
 */
static void fb_glyph(int px, int py, const uint8_t *g, int scale,
                     uint32_t fg, uint32_t bg)
{
    for (int row = 0; row < 8; row++) {
        for (int col = 0; col < 8; col++) {
            uint32_t color = ((g[row] >> (7 - col)) & 1) ? fg : bg;
            for (int sy = 0; sy < scale; sy++) {
                for (int sx = 0; sx < scale; sx++) {
                    int dx = px + col * scale + sx;
                    int dy = py + row * scale + sy;
                    if (dx < FB_WIDTH && dy < FB_HEIGHT) {
                        FB_PHYS[dy * FB_WIDTH + dx] = color;
                    }
                }
            }
        }
    }
}

/*
 * Minimal 8×8 bitmap font — printable ASCII 0x20 – 0x7E.
 *
 * Data derived from the classic IBM PC VGA character ROM (public domain).
 * Each entry is 8 bytes: one byte per scanline, bit 7 = leftmost pixel.
 */
static const uint8_t FONT8[95][8] = {
    /* 0x20 ' '  */ {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},
    /* 0x21 '!'  */ {0x18,0x18,0x18,0x18,0x18,0x00,0x18,0x00},
    /* 0x22 '"'  */ {0x66,0x66,0x66,0x00,0x00,0x00,0x00,0x00},
    /* 0x23 '#'  */ {0x6C,0xFE,0x6C,0x6C,0xFE,0x6C,0x6C,0x00},
    /* 0x24 '$'  */ {0x18,0x7E,0xC0,0x7C,0x06,0xFC,0x18,0x00},
    /* 0x25 '%'  */ {0x00,0xC6,0xCC,0x18,0x30,0x66,0xC6,0x00},
    /* 0x26 '&'  */ {0x38,0x6C,0x38,0x76,0xDC,0xCC,0x76,0x00},
    /* 0x27 '\'' */ {0x18,0x18,0x30,0x00,0x00,0x00,0x00,0x00},
    /* 0x28 '('  */ {0x0C,0x18,0x30,0x30,0x30,0x18,0x0C,0x00},
    /* 0x29 ')'  */ {0x30,0x18,0x0C,0x0C,0x0C,0x18,0x30,0x00},
    /* 0x2A '*'  */ {0x00,0x66,0x3C,0xFF,0x3C,0x66,0x00,0x00},
    /* 0x2B '+'  */ {0x00,0x18,0x18,0x7E,0x18,0x18,0x00,0x00},
    /* 0x2C ','  */ {0x00,0x00,0x00,0x00,0x00,0x18,0x18,0x30},
    /* 0x2D '-'  */ {0x00,0x00,0x00,0x7E,0x00,0x00,0x00,0x00},
    /* 0x2E '.'  */ {0x00,0x00,0x00,0x00,0x00,0x18,0x18,0x00},
    /* 0x2F '/'  */ {0x06,0x0C,0x18,0x30,0x60,0xC0,0x80,0x00},
    /* 0x30 '0'  */ {0x7C,0xC6,0xCE,0xD6,0xE6,0xC6,0x7C,0x00},
    /* 0x31 '1'  */ {0x18,0x38,0x18,0x18,0x18,0x18,0x7E,0x00},
    /* 0x32 '2'  */ {0x7C,0xC6,0x06,0x1C,0x30,0x66,0xFE,0x00},
    /* 0x33 '3'  */ {0x7C,0xC6,0x06,0x3C,0x06,0xC6,0x7C,0x00},
    /* 0x34 '4'  */ {0x1C,0x3C,0x6C,0xCC,0xFE,0x0C,0x1E,0x00},
    /* 0x35 '5'  */ {0xFE,0xC0,0xC0,0xFC,0x06,0xC6,0x7C,0x00},
    /* 0x36 '6'  */ {0x38,0x60,0xC0,0xFC,0xC6,0xC6,0x7C,0x00},
    /* 0x37 '7'  */ {0xFE,0xC6,0x0C,0x18,0x30,0x30,0x30,0x00},
    /* 0x38 '8'  */ {0x7C,0xC6,0xC6,0x7C,0xC6,0xC6,0x7C,0x00},
    /* 0x39 '9'  */ {0x7C,0xC6,0xC6,0x7E,0x06,0x0C,0x78,0x00},
    /* 0x3A ':'  */ {0x00,0x18,0x18,0x00,0x00,0x18,0x18,0x00},
    /* 0x3B ';'  */ {0x00,0x18,0x18,0x00,0x00,0x18,0x18,0x30},
    /* 0x3C '<'  */ {0x06,0x0C,0x18,0x30,0x18,0x0C,0x06,0x00},
    /* 0x3D '='  */ {0x00,0x00,0x7E,0x00,0x00,0x7E,0x00,0x00},
    /* 0x3E '>'  */ {0x60,0x30,0x18,0x0C,0x18,0x30,0x60,0x00},
    /* 0x3F '?'  */ {0x7C,0xC6,0x0C,0x18,0x18,0x00,0x18,0x00},
    /* 0x40 '@'  */ {0x7C,0xC6,0xDE,0xDE,0xDE,0xC0,0x78,0x00},
    /* 0x41 'A'  */ {0x38,0x6C,0xC6,0xFE,0xC6,0xC6,0xC6,0x00},
    /* 0x42 'B'  */ {0xFC,0xC6,0xC6,0xFC,0xC6,0xC6,0xFC,0x00},
    /* 0x43 'C'  */ {0x3C,0x66,0xC0,0xC0,0xC0,0x66,0x3C,0x00},
    /* 0x44 'D'  */ {0xF8,0xCC,0xC6,0xC6,0xC6,0xCC,0xF8,0x00},
    /* 0x45 'E'  */ {0xFE,0xC0,0xC0,0xF8,0xC0,0xC0,0xFE,0x00},
    /* 0x46 'F'  */ {0xFE,0xC0,0xC0,0xF8,0xC0,0xC0,0xC0,0x00},
    /* 0x47 'G'  */ {0x3C,0x66,0xC0,0xCE,0xC6,0x66,0x3A,0x00},
    /* 0x48 'H'  */ {0xC6,0xC6,0xC6,0xFE,0xC6,0xC6,0xC6,0x00},
    /* 0x49 'I'  */ {0x7E,0x18,0x18,0x18,0x18,0x18,0x7E,0x00},
    /* 0x4A 'J'  */ {0x1E,0x06,0x06,0x06,0xC6,0xC6,0x7C,0x00},
    /* 0x4B 'K'  */ {0xC6,0xCC,0xD8,0xF0,0xD8,0xCC,0xC6,0x00},
    /* 0x4C 'L'  */ {0xC0,0xC0,0xC0,0xC0,0xC0,0xC0,0xFE,0x00},
    /* 0x4D 'M'  */ {0xC6,0xEE,0xFE,0xFE,0xD6,0xC6,0xC6,0x00},
    /* 0x4E 'N'  */ {0xC6,0xE6,0xF6,0xDE,0xCE,0xC6,0xC6,0x00},
    /* 0x4F 'O'  */ {0x38,0x6C,0xC6,0xC6,0xC6,0x6C,0x38,0x00},
    /* 0x50 'P'  */ {0xFC,0xC6,0xC6,0xFC,0xC0,0xC0,0xC0,0x00},
    /* 0x51 'Q'  */ {0x78,0xCC,0xCC,0xCC,0xDC,0x78,0x1C,0x00},
    /* 0x52 'R'  */ {0xFC,0xC6,0xC6,0xFC,0xD8,0xCC,0xC6,0x00},
    /* 0x53 'S'  */ {0x7C,0xC6,0xC0,0x7C,0x06,0xC6,0x7C,0x00},
    /* 0x54 'T'  */ {0xFF,0x18,0x18,0x18,0x18,0x18,0x18,0x00},
    /* 0x55 'U'  */ {0xC6,0xC6,0xC6,0xC6,0xC6,0xC6,0x7C,0x00},
    /* 0x56 'V'  */ {0xC6,0xC6,0xC6,0xC6,0xC6,0x6C,0x38,0x00},
    /* 0x57 'W'  */ {0xC6,0xC6,0xC6,0xD6,0xFE,0xEE,0xC6,0x00},
    /* 0x58 'X'  */ {0xC6,0xC6,0x6C,0x38,0x6C,0xC6,0xC6,0x00},
    /* 0x59 'Y'  */ {0xC6,0xC6,0x6C,0x38,0x18,0x18,0x18,0x00},
    /* 0x5A 'Z'  */ {0xFE,0x06,0x0C,0x18,0x30,0x60,0xFE,0x00},
    /* 0x5B '['  */ {0x3C,0x30,0x30,0x30,0x30,0x30,0x3C,0x00},
    /* 0x5C '\\' */ {0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x00},
    /* 0x5D ']'  */ {0x3C,0x0C,0x0C,0x0C,0x0C,0x0C,0x3C,0x00},
    /* 0x5E '^'  */ {0x10,0x38,0x6C,0xC6,0x00,0x00,0x00,0x00},
    /* 0x5F '_'  */ {0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0x00},
    /* 0x60 '`'  */ {0x18,0x18,0x0C,0x00,0x00,0x00,0x00,0x00},
    /* 0x61 'a'  */ {0x00,0x00,0x78,0x0C,0x7C,0xCC,0x76,0x00},
    /* 0x62 'b'  */ {0xC0,0xC0,0xDC,0xE6,0xC6,0xE6,0xDC,0x00},
    /* 0x63 'c'  */ {0x00,0x00,0x7C,0xC6,0xC0,0xC6,0x7C,0x00},
    /* 0x64 'd'  */ {0x06,0x06,0x76,0xCE,0xC6,0xCE,0x76,0x00},
    /* 0x65 'e'  */ {0x00,0x00,0x7C,0xC6,0xFE,0xC0,0x7C,0x00},
    /* 0x66 'f'  */ {0x1C,0x36,0x30,0xFC,0x30,0x30,0x78,0x00},
    /* 0x67 'g'  */ {0x00,0x00,0x76,0xCC,0xCC,0x7C,0x0C,0x78},
    /* 0x68 'h'  */ {0xC0,0xC0,0xDC,0xE6,0xC6,0xC6,0xC6,0x00},
    /* 0x69 'i'  */ {0x18,0x00,0x38,0x18,0x18,0x18,0x3C,0x00},
    /* 0x6A 'j'  */ {0x06,0x00,0x0E,0x06,0x06,0xC6,0xC6,0x7C},
    /* 0x6B 'k'  */ {0xC0,0xC0,0xC6,0xCC,0xF8,0xCC,0xC6,0x00},
    /* 0x6C 'l'  */ {0x38,0x18,0x18,0x18,0x18,0x18,0x3C,0x00},
    /* 0x6D 'm'  */ {0x00,0x00,0xEC,0xFE,0xD6,0xC6,0xC6,0x00},
    /* 0x6E 'n'  */ {0x00,0x00,0xDC,0xE6,0xC6,0xC6,0xC6,0x00},
    /* 0x6F 'o'  */ {0x00,0x00,0x7C,0xC6,0xC6,0xC6,0x7C,0x00},
    /* 0x70 'p'  */ {0x00,0x00,0xDC,0xE6,0xE6,0xDC,0xC0,0xC0},
    /* 0x71 'q'  */ {0x00,0x00,0x76,0xCE,0xCE,0x76,0x06,0x06},
    /* 0x72 'r'  */ {0x00,0x00,0xDC,0xE6,0xC0,0xC0,0xC0,0x00},
    /* 0x73 's'  */ {0x00,0x00,0x7C,0xC0,0x7C,0x06,0xFC,0x00},
    /* 0x74 't'  */ {0x30,0x30,0xFC,0x30,0x30,0x36,0x1C,0x00},
    /* 0x75 'u'  */ {0x00,0x00,0xC6,0xC6,0xC6,0xCE,0x76,0x00},
    /* 0x76 'v'  */ {0x00,0x00,0xC6,0xC6,0xC6,0x6C,0x38,0x00},
    /* 0x77 'w'  */ {0x00,0x00,0xC6,0xC6,0xD6,0xFE,0x6C,0x00},
    /* 0x78 'x'  */ {0x00,0x00,0xC6,0x6C,0x38,0x6C,0xC6,0x00},
    /* 0x79 'y'  */ {0x00,0x00,0xC6,0xC6,0xCE,0x76,0x06,0x7C},
    /* 0x7A 'z'  */ {0x00,0x00,0xFE,0x0C,0x18,0x30,0xFE,0x00},
    /* 0x7B '{'  */ {0x0E,0x18,0x18,0x70,0x18,0x18,0x0E,0x00},
    /* 0x7C '|'  */ {0x18,0x18,0x18,0x00,0x18,0x18,0x18,0x00},
    /* 0x7D '}'  */ {0x70,0x18,0x18,0x0E,0x18,0x18,0x70,0x00},
    /* 0x7E '~'  */ {0x76,0xDC,0x00,0x00,0x00,0x00,0x00,0x00},
};

/*
 * Print a NUL-terminated string at character cell (col, row).
 * Each character cell is (8×scale) × (8×scale) pixels.
 * bg_transparent: if non-zero, only foreground pixels are drawn (bg_color
 *   is ignored) so the string floats over the existing background.
 */
static void fb_puts(int col, int row, const char *s, int scale,
                    uint32_t fg, uint32_t bg, int bg_transparent)
{
    for (; *s; s++, col++) {
        unsigned char c = (unsigned char)*s;
        const uint8_t *glyph;
        if (c < 0x20 || c > 0x7E) {
            glyph = FONT8['?' - 0x20];
        } else {
            glyph = FONT8[c - 0x20];
        }
        int px = col * 8 * scale;
        int py = row * 8 * scale;
        for (int row8 = 0; row8 < 8; row8++) {
            for (int col8 = 0; col8 < 8; col8++) {
                int lit = (glyph[row8] >> (7 - col8)) & 1;
                if (!lit && bg_transparent) continue;
                uint32_t color = lit ? fg : bg;
                for (int sy = 0; sy < scale; sy++) {
                    for (int sx = 0; sx < scale; sx++) {
                        int dx = px + col8 * scale + sx;
                        int dy = py + row8 * scale + sy;
                        if (dx < FB_WIDTH && dy < FB_HEIGHT) {
                            FB_PHYS[dy * FB_WIDTH + dx] = color;
                        }
                    }
                }
            }
        }
    }
}

static void fb_puts_px(int px, int py, const char *s, int scale,
                       uint32_t fg, uint32_t bg, int bg_transparent)
{
    for (; *s; s++, px += 8 * scale) {
        unsigned char c = (unsigned char)*s;
        const uint8_t *glyph;
        if (c < 0x20 || c > 0x7E) {
            glyph = FONT8['?' - 0x20];
        } else {
            glyph = FONT8[c - 0x20];
        }
        for (int row8 = 0; row8 < 8; row8++) {
            for (int col8 = 0; col8 < 8; col8++) {
                int lit = (glyph[row8] >> (7 - col8)) & 1;
                if (!lit && bg_transparent) continue;
                uint32_t color = lit ? fg : bg;
                for (int sy = 0; sy < scale; sy++) {
                    for (int sx = 0; sx < scale; sx++) {
                        int dx = px + col8 * scale + sx;
                        int dy = py + row8 * scale + sy;
                        if (dx < FB_WIDTH && dy < FB_HEIGHT) {
                            FB_PHYS[dy * FB_WIDTH + dx] = color;
                        }
                    }
                }
            }
        }
    }
}

static void fb_layout_probe(void)
{
    static const uint32_t probe_cols[8] = {
        RGB(0xFF, 0xFF, 0xFF),
        RGB(0xFF, 0xFF, 0x00),
        RGB(0x00, 0xFF, 0xFF),
        RGB(0x00, 0xFF, 0x00),
        RGB(0xFF, 0x00, 0xFF),
        RGB(0xFF, 0x40, 0x40),
        RGB(0x30, 0x60, 0xFF),
        RGB(0x80, 0x80, 0x80),
    };
    const int cols = 8;
    const int rows = 4;
    const int cell_w = FB_WIDTH / cols;
    const int cell_h = FB_HEIGHT / rows;

    fb_fill(RGB(0x10, 0x10, 0x10));
    fb_border(0, 0, FB_WIDTH - 1, FB_HEIGHT - 1, RGB(0xFF, 0xFF, 0xFF), 4);

    for (int row = 0; row < rows; row++) {
        for (int col = 0; col < cols; col++) {
            int x0 = col * cell_w;
            int y0 = row * cell_h;
            int x1 = (col == cols - 1) ? (FB_WIDTH - 1) : ((col + 1) * cell_w - 1);
            int y1 = (row == rows - 1) ? (FB_HEIGHT - 1) : ((row + 1) * cell_h - 1);
            int label_px;
            int label_py;
            char label[3];

            fb_rect(x0 + 4, y0 + 4, x1 - 4, y1 - 4, probe_cols[col]);
            fb_border(x0, y0, x1, y1, RGB(0xFF, 0xFF, 0xFF), 2);

            for (int marker = 0; marker <= row; marker++) {
                int my = y0 + 18 + marker * 16;
                fb_rect(x0 + 18, my, x1 - 18, my + 7, RGB(0, 0, 0));
            }
            for (int marker = 0; marker <= col; marker++) {
                int mx = x0 + 18 + marker * 16;
                fb_rect(mx, y0 + 72, mx + 7, y1 - 18, RGB(0, 0, 0));
            }

            label[0] = (char)('A' + col);
            label[1] = (char)('0' + row);
            label[2] = '\0';
            label_px = x0 + (cell_w - 64) / 2;
            label_py = y0 + (cell_h - 32) / 2;
            fb_rect(label_px - 10, label_py - 10,
                    label_px + 64 + 9, label_py + 32 + 9,
                    RGB(0, 0, 0));
            fb_puts_px(label_px, label_py, label, 4,
                       RGB(0xFF, 0xFF, 0xFF), RGB(0, 0, 0), 1);
        }
    }
}

/* ---------------------------------------------------------------------- */

void hdmi_fb_demo(void)
{
    /* ----------------------------------------------------------
     * 1. Gradient background (dark blue → mid blue-grey)
     * ---------------------------------------------------------- */
    int bar_y = FB_HEIGHT * 4 / 5;   /* colour bars start here */
    fb_gradient_bg(0, bar_y - 1);

    /* ----------------------------------------------------------
     * 2. SMPTE colour bars along the bottom fifth
     * ---------------------------------------------------------- */
    fb_colour_bars(bar_y, FB_HEIGHT - 1);

    /* ----------------------------------------------------------
     * 3. White border around the full screen
     * ---------------------------------------------------------- */
    fb_border(0, 0, FB_WIDTH - 1, FB_HEIGHT - 1,
              RGB(0xFF, 0xFF, 0xFF), 4);

    /* ----------------------------------------------------------
     * 4. Inner blue accent border
     * ---------------------------------------------------------- */
    fb_border(20, 20, FB_WIDTH - 21, FB_HEIGHT - 21,
              RGB(0x44, 0xAA, 0xFF), 2);

    /* ----------------------------------------------------------
     * 5. Centre crosshair
     * ---------------------------------------------------------- */
    int cx = FB_WIDTH / 2;
    int cy = bar_y / 2;
    /* vertical arm */
    fb_rect(cx - 1, 50, cx + 1, bar_y - 51, RGB(0xFF, 0xFF, 0xFF));
    /* horizontal arm */
    fb_rect(50, cy - 1, FB_WIDTH - 51, cy + 1, RGB(0xFF, 0xFF, 0xFF));
    /* centre dot */
    fb_rect(cx - 6, cy - 6, cx + 6, cy + 6, RGB(0xFF, 0x44, 0x00));

    /* ----------------------------------------------------------
     * 6. Title text  (scale=3 → 24×24 px per character cell)
     * ---------------------------------------------------------- */
    fb_puts(3, 2, "barnegat-os", 3,
            RGB(0x44, 0xAA, 0xFF), RGB(0, 0, 0), 1);

    /* ----------------------------------------------------------
     * 7. Subtitle text (scale=2 → 16×16 px per character cell)
     * ---------------------------------------------------------- */
    fb_puts(3, 7, "bare-metal HDMI  1920x1080  XRGB8888", 2,
            RGB(0xFF, 0xFF, 0xFF), RGB(0, 0, 0), 1);
    fb_puts(3, 10, "TH1520  BeagleV-Ahead", 2,
            RGB(0xCC, 0xCC, 0xCC), RGB(0, 0, 0), 1);

    /* ----------------------------------------------------------
     * 8. Memory barrier — flush CPU write buffer before returning
     * ---------------------------------------------------------- */
    __asm__ volatile ("fence" ::: "memory");
}

/* ================================================================
 * Hardware initialisation — vosys clocks + DC8200 + DW-HDMI 2.0
 *
 * All register values were captured from a live /dev/mem dump on the
 * BeagleV-Ahead while HDMI was active (1920×1080 XRGB8888 60 Hz).
 * U-Boot gates the vosys clock domain on every cold boot, so every
 * DC8200 / DW-HDMI register write is silently discarded until clocks
 * are re-enabled here.
 * ================================================================ */

/* Spin-delay: ≈ 'us' microseconds at 750 MHz (deliberately slow). */
static void delay_us(unsigned int us)
{
    for (volatile unsigned int i = 0; i < us * 1000u; i++)
        __asm__ volatile ("nop");
}

/* ----------------------------------------------------------------
 * AP CLKGEN DPU0 PLL — configure for 1080p60 pixel clock (148.5 MHz).
 *
 * AP CLKGEN base: 0xFFEF010000 (thead,light-fm-ree-clk in DTS).
 *
 * The TH1520 has two display PLLs (DPU0 and DPU1) which are
 * *programmable* and must be explicitly configured.  The Video PLL
 * (792 MHz fixed) is used by other subsystems and is always-on.
 *
 * DPU0 PLL registers (INT mode, cfg0_reg_off = 0x40):
 *   CFG0  ap+0x40: [5:0]=REFDIV, [19:8]=FBDIV, [22:20]=POSTDIV1, [26:24]=POSTDIV2
 *   CFG1  ap+0x44: BIT(29)=RST, BIT(30)=BYPASS
 *   STS   ap+0x80: BIT(8)=LOCK
 *
 * For FOUTPOSTDIV=1188 MHz (refdiv=1, fbdiv=99, postdiv1=2, postdiv2=1):
 *   FOUTVCO = 24 * 99 / 1 = 2376 MHz
 *   FOUTPOSTDIV = 2376 / (2*1) = 1188 MHz
 *
 * DPU0_PLL_DIV_CLK register (ap+0x1e8):
 *   bits[7:0] = ONE_BASED divider value (8 → 1188/8 = 148.5 MHz pixel clock)
 *   bit[8]    = sync_en: clear, write divider, then set to trigger update
 * ---------------------------------------------------------------- */
static void dpu0_pll_configure_1080p60(void)
{
    volatile uint32_t *ap = (volatile uint32_t *)0xFFEF010000ULL;

    /* 1. Assert RST to hold PLL in reset while writing CFG0. */
    uint32_t cfg1 = ap[0x44/4];
    cfg1 |= (1U << 29);    /* RST = 1 */
    ap[0x44/4] = cfg1;
    __asm__ volatile ("fence" ::: "memory");

    /* 2. CFG0: refdiv=1, fbdiv=99, postdiv1=2, postdiv2=1 → 1188 MHz */
    ap[0x40/4] = (1U  <<  0) |   /* REFDIV   = 1 */
                 (99U <<  8) |   /* FBDIV    = 99 */
                 (2U  << 20) |   /* POSTDIV1 = 2  */
                 (1U  << 24);    /* POSTDIV2 = 1  */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(3);

    /* 3. Deassert RST and BYPASS — PLL begins locking. */
    cfg1  = ap[0x44/4];
    cfg1 &= ~(1U << 29);   /* RST    = 0 */
    cfg1 &= ~(1U << 30);   /* BYPASS = 0 */
    ap[0x44/4] = cfg1;
    __asm__ volatile ("fence" ::: "memory");

    /* 4. Wait for PLL lock (BIT(8) of status at ap+0x80). ~20 µs typical. */
    for (int i = 0; i < 200; i++) {
        if (ap[0x80/4] & (1U << 8)) break;
        delay_us(1);
    }
    delay_us(30);   /* 30 µs additional stability margin */

    /* 5. DPU0_PLL_DIV_CLK divider at ap+0x1e8.
     *    Sequence per clk_lightdiv_set_rate: clear sync_en, write divider, set sync_en. */
    uint32_t div_reg = ap[0x1e8/4];
    div_reg &= ~(1U << 8);      /* a) clear sync_en */
    ap[0x1e8/4] = div_reg;
    __asm__ volatile ("fence" ::: "memory");
    delay_us(1);

    div_reg &= ~0xFFU;           /* b) clear 8-bit divider field */
    div_reg |= 8U;               /* divider = 8 → 1188/8 = 148.5 MHz */
    ap[0x1e8/4] = div_reg;
    __asm__ volatile ("fence" ::: "memory");
    delay_us(1);

    div_reg |= (1U << 8);        /* c) set sync_en to apply new divider */
    ap[0x1e8/4] = div_reg;
    __asm__ volatile ("fence" ::: "memory");
}

/* ----------------------------------------------------------------
 * AP CLKGEN DPU1 PLL — configure for 1080p60 pixel clock (148.5 MHz).
 *
 * Identical target frequency to DPU0; DPU1 registers are offset by +0x10:
 *   CFG0  ap+0x50: same layout as DPU0 ap+0x40
 *   CFG1  ap+0x54: BIT(29)=RST, BIT(30)=BYPASS
 *   STS   ap+0x80: BIT(9)=LOCK  (vs BIT(8) for DPU0)
 *   DIV   ap+0x1ec: same layout as DPU0 ap+0x1e8
 *
 * The HDMI pixel clock may be sourced from DPU1_PLL_DIV_CLK rather
 * than DPU0_PLL_DIV_CLK.  Configuring both guarantees 148.5 MHz
 * arrives at the DW-HDMI PHY regardless of the VOSYS clock mux setting.
 * ---------------------------------------------------------------- */
static void dpu1_pll_configure_1080p60(void)
{
    volatile uint32_t *ap = (volatile uint32_t *)0xFFEF010000ULL;

    /* 1. Assert RST. */
    uint32_t cfg1 = ap[0x54/4];
    cfg1 |= (1U << 29);
    ap[0x54/4] = cfg1;
    __asm__ volatile ("fence" ::: "memory");

    /* 2. CFG0: refdiv=1, fbdiv=99, postdiv1=2, postdiv2=1 → 1188 MHz */
    ap[0x50/4] = (1U  <<  0) |
                 (99U <<  8) |
                 (2U  << 20) |
                 (1U  << 24);
    __asm__ volatile ("fence" ::: "memory");
    delay_us(3);

    /* 3. Deassert RST and BYPASS. */
    cfg1  = ap[0x54/4];
    cfg1 &= ~(1U << 29);
    cfg1 &= ~(1U << 30);
    ap[0x54/4] = cfg1;
    __asm__ volatile ("fence" ::: "memory");

    /* 4. Wait for DPU1_PLL lock (BIT(9) of ap+0x80). */
    for (int i = 0; i < 200; i++) {
        if (ap[0x80/4] & (1U << 9)) break;
        delay_us(1);
    }
    delay_us(30);

    /* 5. DPU1_PLL_DIV_CLK divider at ap+0x1ec: set to 8 → 148.5 MHz. */
    uint32_t div_reg = ap[0x1ec/4];
    div_reg &= ~(1U << 8);      /* a) clear sync_en */
    ap[0x1ec/4] = div_reg;
    __asm__ volatile ("fence" ::: "memory");
    delay_us(1);

    div_reg &= ~0xFFU;
    div_reg |= 8U;
    ap[0x1ec/4] = div_reg;
    __asm__ volatile ("fence" ::: "memory");
    delay_us(1);

    div_reg |= (1U << 8);
    ap[0x1ec/4] = div_reg;
    __asm__ volatile ("fence" ::: "memory");
}

/* ----------------------------------------------------------------
 * vosys-clk-gate (0xFFEF528000)
 * Re-enable display-subsystem clocks (DC8200 + HDMI TX).
 * Values from /dev/mem read while Linux had HDMI active.
 * ---------------------------------------------------------------- */
static void vosys_clk_enable(void)
{
    volatile uint32_t *clk = (volatile uint32_t *)0xFFEF528000ULL;
    clk[0x004/4] = 0x00000007U;
    clk[0x008/4] = 0x00000001U;
    clk[0x00C/4] = 0x00000001U;
    clk[0x014/4] = 0x00000003U;
    clk[0x018/4] = 0x00000003U;
    clk[0x020/4] = 0x0000000FU;
    clk[0x050/4] = 0x7BFABFE5U;
    clk[0x054/4] = 0x00000001U;
    clk[0x064/4] = 0x00000014U;
    clk[0x070/4] = 0x00000001U;
    clk[0x074/4] = 0x00007130U;  /* pixel clock divider */
    clk[0x078/4] = 0x00007130U;
    /* Additional enable banks present in Linux live capture but absent
     * from our original write list.  0x0A4 contains bits[19:12] which
     * gate individual DW-HDMI sub-block clocks (sfr, i2cm, etc.). */
    clk[0x0A4/4] = 0x000FF000U;
    clk[0x100/4] = 0x00000001U;
    clk[0x108/4] = 0x00000001U;
    clk[0x130/4] = 0x00000001U;
    clk[0x138/4] = 0x00000001U;
    __asm__ volatile ("fence" ::: "memory");
}

/* ----------------------------------------------------------------
 * DW-HDMI PHY I2CM 16-bit write (vendor PHY slave 0x69).
 * h[] indexed by logical DW-HDMI register number (reg_shift=2,
 * so h[n] == byte offset n*4).
 * ---------------------------------------------------------------- */
/*
 * Single I2CM write attempt.
 * Returns:  1 = success,  0 = timeout (neither bit set after 2ms),  -1 = error
 *
 * The IH_I2CMPHY_STAT0 clear (W1C) is placed as the LAST write before
 * triggering OPERATION.  Placing it earlier allows synchroniser-pipeline
 * events from SOFTRSTZ to arrive in the window between the clear and the
 * poll, producing a spurious bit[0]=1 (error) before any I2C clock edge.
 *
 * We poll IH every 1 ms for up to 50 ms.  At DIV=0x0B / SS_HCNT=0x7F
 * the PHY I2C bus runs ~50 kHz and a 16-bit write takes ~1 ms end-to-end,
 * so 50 ms is a 50× margin regardless of U-Boot CPU clock speed.  Using
 * 1000 ms (Linux's ceiling) works but inflates failure-detection time to
 * ~3 minutes when the C910 is at its slow U-Boot frequency (~300 MHz).
 *
 * PHY_I2CM_INT (0x3027) and PHY_I2CM_CTLINT (0x3028) must be written
 * per-transaction, immediately before triggering OPERATION.
 *
 * Bit layout (confirmed from dw-hdmi.h):
 *   INT    [3]=DONE_POL  [2]=DONE_MASK  (0x08=POL-only, 0x04=MASK-only!)
 *   CTLINT [7]=NAK_POL   [6]=NAK_MASK   [3]=ARB_POL  [2]=ARB_MASK
 *
 * Correct values: INT=0x08 (DONE_POL=1, DONE_MASK=0 → IH capture ENABLED),
 *                 CTLINT=0x88 (NAK_POL=1, ARB_POL=1, both MASKs=0).
 * WRONG values:   INT=0x04 sets DONE_MASK=1 → IH_I2CMPHY_STAT0 never fires!
 */
static int hdmi_phy_i2cm_write_once(volatile uint32_t *h,
                                    uint8_t reg, uint16_t val)
{
    h[0x3021] = reg;                  /* PHY_I2CM_ADDRESS */
    h[0x3022] = (val >> 8) & 0xFFU;  /* PHY_I2CM_DATAO_1 (MSB) */
    h[0x3023] = val & 0xFFU;          /* PHY_I2CM_DATAO_0 (LSB) */
    h[0x0108] = 0xFFU;               /* IH_I2CMPHY_STAT0: W1C clear */
    h[0x3027] = 0x08U;               /* PHY_I2CM_INT:    DONE_POL=BIT(3), DONE_MASK=0 */
    h[0x3028] = 0x88U;               /* PHY_I2CM_CTLINT: NAK_POL=BIT(7)|ARB_POL=BIT(3) */
    __asm__ volatile ("fence" ::: "memory");
    h[0x3026] = 0x10U;               /* PHY_I2CM_OPERATION = write — starts the transaction */
    __asm__ volatile ("fence" ::: "memory");
    /* Poll IH every 1 ms for up to 50 ms.
     * At DIV=0x0B / SS_HCNT=0x7F the bus runs ~50 kHz; a 16-bit write
     * takes ~1 ms.  50 ms gives 50× margin even on a slow U-Boot clock. */
    for (int t = 0; t < 50; t++) {
        delay_us(1000);
        uint32_t s = h[0x0108] & 0x03U;
        if (s) {
            h[0x0108] = s;           /* W1C clear */
            if (s & 0x02U) return  1; /* bit[1] = done  */
            if (s & 0x01U) return -1; /* bit[0] = error */
        }
    }
    return 0;                         /* timeout after 50 ms */
}

#define I2CM_ATTEMPTS       5
#define I2CM_RETRY_DELAY_US 500
static int hdmi_phy_i2cm_write(volatile uint32_t *h,
                               uint8_t reg, uint16_t val)
{
    int r = 0;
    for (int a = 0; a < I2CM_ATTEMPTS; a++) {
        r = hdmi_phy_i2cm_write_once(h, reg, val);
        if (r == 1) return 1;
        delay_us(I2CM_RETRY_DELAY_US);
    }
    return r;
}

static void hdmi_program_identity_csc(volatile uint32_t *h)
{
    static const uint16_t coeffs[3][4] = {
        {0x2000U, 0x0000U, 0x0000U, 0x0000U},
        {0x0000U, 0x2000U, 0x0000U, 0x0000U},
        {0x0000U, 0x0000U, 0x2000U, 0x0000U},
    };
    static const uint32_t msb_base[3] = {0x4102U, 0x410AU, 0x4112U};
    static const uint32_t lsb_base[3] = {0x4103U, 0x410BU, 0x4113U};

    for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 4; col++) {
            uint16_t coeff = coeffs[row][col];
            h[msb_base[row] + (uint32_t)(col * 2)] = (coeff >> 8) & 0xFFU;
            h[lsb_base[row] + (uint32_t)(col * 2)] = coeff & 0xFFU;
        }
    }

    /* RGB888 in -> RGB888 out, CSC bypass, identity matrix. */
    h[0x4100] = 0x00U;  /* HDMI_CSC_CFG   = no interpolation/decimation */
    h[0x4101] = 0x01U;  /* HDMI_CSC_SCALE = 24bpp + identity scale      */
    h[0x4004] = 0x00U;  /* HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_BYPASS */
    __asm__ volatile ("fence" ::: "memory");
}

static void hdmi_clear_overflow(volatile uint32_t *h)
{
    uint32_t invidconf = h[0x1000] & 0xFFU;

    /* Pulse the TMDS software reset request, then rewrite FC_INVIDCONF.
     * This matches the upstream workaround for a DW-HDMI frame-composer
     * condition where a register write can be missed while the block is busy. */
    h[0x4002] = 0xFDU;  /* clear bit1 = HDMI_MC_SWRSTZ_TMDSSWRST_REQ */
    __asm__ volatile ("fence" ::: "memory");
    for (int i = 0; i < 4; i++)
        h[0x1000] = invidconf;
    h[0x4002] = 0xFFU;  /* release TMDS software reset request */
    __asm__ volatile ("fence" ::: "memory");
}

static void hdmi_program_hdcp_video_polarity(volatile uint32_t *h)
{
    /* Match the upstream HDMI-mode / video-polarity setup:
     *   A_HDCPCFG0: HDMI mode, RX detect disabled
     *   A_HDCPCFG1: encryption disabled bit set to "disable disable"
     *   A_VIDPOLCFG: DE/HS/VS active high for 1080p60 */
    h[0x5000] = 0x01U;
    h[0x5001] = 0x02U;
    h[0x5009] = 0x1AU;
    __asm__ volatile ("fence" ::: "memory");
}

/* ----------------------------------------------------------------
 * DW-HDMI 2.0 TX init (base 0xFFEF540000, reg_shift=2).
 * Replays the full register state captured from Linux.
 * ---------------------------------------------------------------- */
/* Two packed diagnostic words written directly to scratch[6] and scratch[7].
 *
 * diag0 (scratch[6]) — register readback diagnostics:
 *   bits[31:24] = PHY_I2CM_SLAVE readback  (0x69 = writes reaching HW;
 *                                            0x00 = I2CM clock gated, writes lost)
 *   bits[23:16] = PHY_I2CM_DIV   readback  (0x0B expected)
 *   bits[15:8]  = IH_I2CMPHY_STAT0 read BEFORE first OPERATION
 *                                           (0x00 = clean; non-zero = stuck bit)
 *   bits[7:0]   = i2cm_ok        (0x06 = all 6 writes succeeded)
 *
 * diag2 (scratch[8]) — first-transaction clock/IH probe:
 *   bits[31:16] = MC_CLKDIS readback (0x0000 = all clocks running;
 *                                     non-zero = I2CM clock gated)
 *   bits[15:8]  = IH_I2CMPHY_STAT0 read ~5us AFTER first OPERATION
 *                                    (non-zero = very fast done/error;
 *                                     0x00 = transaction not yet started)
 *   bits[7:0]   = IH_I2CMPHY_STAT0 read after 50 ms poll on first write
 *                                    (0x02=done, 0x01=error, 0x00=never fired)
 *
 * diag1 (scratch[7]) — I2CM transaction status:
 *   bits[23:16] = first_fail_reg  (0x00=none, 0x06=failed on first register)
 *   bits[15:8]  = PHY_STAT0       (0xF3=TX_PHY_LOCK=1 → video; 0xF2=no lock)
 *   bits[7:0]   = fail_type       (0=none, 1=timeout, 2=NACK/error)
 *
 * Perfect run: scratch[6]=0x690B0006, scratch[7]=0x0000F300 */
static void dw_hdmi_init(uint32_t *diag0_out, uint32_t *diag1_out,
                         uint32_t *diag2_out)
{
    volatile uint32_t *h = (volatile uint32_t *)0xFFEF540000ULL;

    /* Mute all interrupts first. */
    h[0x0180] = 0xFFU; h[0x0181] = 0xFFU; h[0x0182] = 0xFFU;
    h[0x0183] = 0xFFU; h[0x0184] = 0xFFU; h[0x0185] = 0xFFU;
    h[0x0186] = 0xFFU; h[0x0187] = 0xFFU; h[0x0188] = 0xFFU;
    h[0x01FF] = 0x03U;  /* IH_MUTE — top-level mute */
    __asm__ volatile ("fence" ::: "memory");

    /* MC: enable all clocks. */
    h[0x4001] = 0x00U;  /* MC_CLKDIS = 0x00 (all enabled) */
    h[0x4006] = 0x71U;  /* MC_LOCKONCLOCK */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(100);

    /* TX: RGB 4:4:4, 8-bit. */
    h[0x0200] = 0x01U;  /* TX_INVID0     */
    h[0x0201] = 0x07U;  /* TX_INSTUFFING */
    h[0x0202] = 0x00U;  /* TX_GYDATA0    */
    h[0x0203] = 0x00U;  /* TX_GYDATA1    */
    h[0x0204] = 0x00U;  /* TX_RCRDATA0   */
    h[0x0205] = 0x00U;  /* TX_RCRDATA1   */
    h[0x0206] = 0x00U;  /* TX_BCBDATA0   */
    h[0x0207] = 0x00U;  /* TX_BCBDATA1   */

    /* Video Packetizer. */
    h[0x0801] = 0x40U;  /* VP_PR_CD */
    h[0x0802] = 0x27U;  /* VP_STUFF */
    h[0x0804] = 0x47U;  /* VP_CONF  */
    h[0x0807] = 0xFFU;  /* VP_MASK  */
    __asm__ volatile ("fence" ::: "memory");

    /* CSC / main video path. Upstream Linux and U-Boot always program an
     * explicit identity CSC path for RGB888, even when no color conversion
     * is needed. Leaving this block at reset/unknown state can result in a
     * constant-color output that ignores the live video input. */
    hdmi_program_identity_csc(h);

    /* Frame Composer — 1920×1080 60 Hz (VIC 16). */
    h[0x1000] = 0x78U;  /* FC_INVIDCONF     */
    h[0x1001] = 0x80U;  /* FC_INHACTV0      (1920 & 0xFF) */
    h[0x1002] = 0x07U;  /* FC_INHACTV1      (1920 >> 8)   */
    h[0x1003] = 0x18U;  /* FC_INHBLANK0     (280 & 0xFF)  */
    h[0x1004] = 0x01U;  /* FC_INHBLANK1     (280 >> 8)    */
    h[0x1005] = 0x38U;  /* FC_INVACTV0      (1080 & 0xFF) */
    h[0x1006] = 0x04U;  /* FC_INVACTV1      (1080 >> 8)   */
    h[0x1007] = 0x2DU;  /* FC_INVBLANK      = 45          */
    h[0x1008] = 0x58U;  /* FC_HSYNCINDELAY0 = 88          */
    h[0x1009] = 0x00U;  /* FC_HSYNCINDELAY1               */
    h[0x100A] = 0x2CU;  /* FC_HSYNCINWIDTH0 = 44          */
    h[0x100B] = 0x00U;  /* FC_HSYNCINWIDTH1               */
    h[0x100C] = 0x04U;  /* FC_VSYNCINDELAY               */
    h[0x100D] = 0x05U;  /* FC_VSYNCINWIDTH                */
    h[0x1011] = 0x0CU;  /* FC_CTRLDUR                     */
    h[0x1012] = 0x20U;  /* FC_EXCTRLDUR                   */
    h[0x1013] = 0x01U;  /* FC_EXCTRLSPAC                  */
    h[0x1014] = 0x0BU;  /* FC_CH0PREAM                    */
    h[0x1015] = 0x16U;  /* FC_CH1PREAM                    */
    h[0x1016] = 0x21U;  /* FC_CH2PREAM                    */
    h[0x1019] = 0x60U;  /* FC_AVICONF0                    */
    h[0x101A] = 0x28U;  /* FC_AVICONF1                    */
    h[0x101B] = 0x04U;  /* FC_AVICONF2                    */
    h[0x101C] = 0x10U;  /* FC_AVIVID = VIC 16 (1080p60)   */
    __asm__ volatile ("fence" ::: "memory");

    /* MC soft-reset: release all SW resets.
     * MC_SWRSTZ is active-low; writing 0xFF releases everything. */
    h[0x4002] = 0xFFU;  /* MC_SWRSTZ: release all */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(100);

    /* Work around a DW-HDMI frame-composer/TMDS sync issue after the video
     * path is programmed. Without this pulse some controllers can continue
     * driving a stale constant field instead of the current input video. */
    hdmi_clear_overflow(h);

    /* === Solution I: TSTCLR before I2CM setup + SLAVE_rb/DIV_rb diagnostics ===
     *
     * Solutions G+H proved the PHY is out of reset (failure mode changed from
     * NACK → timeout), but the I2CM master never fires IH even after 3 full
     * seconds of polling.  This rules out clock-stretching; the I2CM state
     * machine is not generating any transactions at all.
     *
     * Root cause hypothesis: writing PHY_TST0[5]=TSTCLR=1 (Step 5 in G/H)
     * may reset the PHY_I2CM controller's own configuration registers
     * (DIV, SOFTRSTZ, SCL timings) because PHY_TST0 drives a test-clear
     * signal that spans the entire PHY domain including the I2CM block.
     * If TSTCLR resets DIV back to 0x00 (maximum divider), the I2C clock
     * becomes ~DC, the bus never completes a transaction, and IH never fires.
     *
     * Fix: reorder so TSTCLR runs BEFORE I2CM setup, not after.  Even if
     * TSTCLR resets I2CM state, the subsequent setup re-arms everything.
     *
     * Additional diagnostic: read back PHY_I2CM_SLAVE (0x3020) and
     * PHY_I2CM_DIV (0x3029) immediately after setup to confirm writes stick:
     *   scratch[6] = (slave_rb<<24)|(div_rb<<16)|(ih_preop<<8)|(i2cm_ok)
     *   Perfect:   0x690B000B
     * scratch[7] = (first_fail_reg<<16)|(PHY_STAT0<<8)|(fail_type)
     *   Perfect:   0x0000F300 (TX_PHY_LOCK=1) */

    /* Step 1: PHY power-off state before reset.
     *   PHY_CONF0 = 0x36: SPARE(5)=1, PDDQ(4)=1, TXPWRON(3)=0,
     *                     ENHPDRXSENSE(2)=1, SELDATAENPOL(1)=1 */
    h[0x3000] = 0x36U;
    __asm__ volatile ("fence" ::: "memory");

    /* Step 2: MC_PHYRSTZ pulse — Gen2 active-HIGH reset. */
    h[0x4005] = 0x01U;  /* MC_PHYRSTZ: ASSERT (gen2: 1 = in reset) */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(200);
    h[0x4005] = 0x00U;  /* MC_PHYRSTZ: DEASSERT (gen2: 0 = running) */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(50000);    /* 50 ms: PHY digital logic (including I2C slave) stabilises */

    /* Step 3: Assert HEAC PHY reset (Linux: MC_HEACPHY_RST = 0x4007, ASSERT=1). */
    h[0x4007] = 0x01U;
    __asm__ volatile ("fence" ::: "memory");

    /* Step 4: TSTCLR protocol FIRST — before I2CM setup.
     *   From Linux dw_hdmi_phy_i2c_set_addr():
     *     hdmi_phy_test_clear(1)  → PHY_TST0[5]=TSTCLR=1
     *     write SLAVE_ADDR = 0x69
     *     hdmi_phy_test_clear(0)  → PHY_TST0[5]=TSTCLR=0
     *   Run this before configuring the I2CM controller so any TSTCLR-induced
     *   reset of PHY_I2CM registers happens BEFORE we program them. */
    h[0x3001] = 0x20U;  /* PHY_TST0: TSTCLR=1 (bit 5) */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(100);
    h[0x3020] = 0x69U;  /* PHY_I2CM_SLAVE = GEN2 PHY address */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(100);
    h[0x3001] = 0x00U;  /* PHY_TST0: TSTCLR=0 */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(1000);     /* 1 ms settle after TSTCLR release */

    /* Step 5: I2CM controller setup AFTER TSTCLR (so TSTCLR can't reset them). */
    h[0x3029] = 0x0BU;  /* PHY_I2CM_DIV */
    h[0x302A] = 0x00U;  /* PHY_I2CM_SOFTRSTZ: assert */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(100);
    h[0x302A] = 0x01U;  /* PHY_I2CM_SOFTRSTZ: release */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(100);
    h[0x302B] = 0x00U; h[0x302C] = 0x7FU;  /* SS_HCNT */
    h[0x302D] = 0x00U; h[0x302E] = 0x7FU;  /* SS_LCNT */
    h[0x302F] = 0x00U; h[0x3030] = 0x35U;  /* FS_HCNT */
    h[0x3031] = 0x00U; h[0x3032] = 0x7FU;  /* FS_LCNT */
    h[0x3033] = 0x08U;                       /* SDA_HOLD */
    h[0x3027] = 0x08U;  /* PHY_I2CM_INT:    DONE_POL=BIT(3), DONE_MASK=0 (enabled) */
    h[0x3028] = 0x88U;  /* PHY_I2CM_CTLINT: NAK_POL=BIT(7)|ARB_POL=BIT(3), masks=0 */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(1000);

    /* Readback: confirm register writes reached the hardware.
     *   slave_rb = 0x69 → SLAVE write survived TSTCLR + setup
     *   div_rb   = 0x0B → DIV write survived (I2CM clocked correctly)
     *   Either = 0x00   → clock-gated; writes silently discarded */
    uint32_t slave_rb = h[0x3020] & 0xFFU;  /* PHY_I2CM_SLAVE readback */
    uint32_t div_rb   = h[0x3029] & 0xFFU;  /* PHY_I2CM_DIV   readback */

    /* Flush IH before transactions. */
    h[0x0108] = 0xFFU;
    __asm__ volatile ("fence" ::: "memory");

    /* Unmute IH_MUTE_I2CMPHY_STAT0 (0x0188).
     * Controls whether IH events reach the CPU interrupt line.  Must be 0x00
     * so we can poll IH_I2CMPHY_STAT0 and see the done/error bits.          */
    h[0x0188] = 0x00U;  /* IH_MUTE_I2CMPHY_STAT0: unmute DONE(1) and ERROR(0) */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(1000);
    uint32_t ih_preop = h[0x0108] & 0xFFU;

    /* diag2: read MC_CLKDIS now to confirm I2CM clock is running. */
    uint32_t mc_clkdis_rb = h[0x4001] & 0xFFU;

    /* diag2: fire the first transaction manually so we can sample IH
     * immediately after OPERATION to detect very-fast done/error.
     * First real PHY config register: OPMODE_PLLCFG (0x06) = 0x0001. */
    uint32_t ih_fast = 0;
    uint32_t ih_final = 0;
    {
        uint8_t  ra = 0x06; uint16_t va = 0x0001;  /* OPMODE_PLLCFG */
        h[0x3021] = ra;
        h[0x3022] = (va >> 8) & 0xFFU;
        h[0x3023] = va & 0xFFU;
        h[0x0108] = 0xFFU;
        h[0x3027] = 0x08U;  /* DONE_POL=BIT(3), DONE_MASK=0 */
        h[0x3028] = 0x88U;  /* NAK_POL=BIT(7)|ARB_POL=BIT(3) */
        __asm__ volatile ("fence" ::: "memory");
        h[0x3026] = 0x10U;
        __asm__ volatile ("fence" ::: "memory");
        delay_us(5);                         /* ~5 µs: sample IH immediately */
        ih_fast = h[0x0108] & 0x03U;
        /* now continue polling to get final outcome */
        int done = 0;
        for (int t = 0; t < 50 && !done; t++) {
            delay_us(1000);
            uint32_t s = h[0x0108] & 0x03U;
            if (s) { h[0x0108] = s; ih_final = s; done = 1; }
        }
    }
    *diag2_out = ((uint32_t)mc_clkdis_rb << 16) |
                 ((uint32_t)ih_fast       <<  8) |
                  (uint32_t)ih_final;

    /* Step 6: 6 PHY register writes for 1080p60.
     * Values from dw_hdmi_tx_phy_gen2_configure() in TH1520 BSP:
     *   drivers/gpu/drm/verisilicon/dw_hdmi_tx_phy_gen2.h
     *   mpll_configs[] entry for pixelclock=148500 kHz, 8bpp, HDMI 1.4.
     *
     * Bit-packing for 148500 kHz entry:
     *   OPMODE_PLLCFG  (0x06): prep_div=0, mpll_cko_div=0, opmode=0, ref_cntrl=0, mpll_n_cntrl=1 → 0x0001
     *   PLLCURRGMPCTRL (0x10): gmp_cntrl=2<<12, prop_cntrl=2<<6, int_cntrl=0             → 0x2080
     *   PLLDIVCTRL     (0x11): vco_cntrl=1<<9, mpll_multiplier=0xa                       → 0x020A
     *   TXTERM         (0x19): txterm=7 (TXTERM_OPEN_CIRCUIT)                            → 0x0007
     *   VLEVCTRL       (0x0E): sup_txlvl=0xd<<5                                          → 0x01A0
     *   CKSYMTXCTRL    (0x09): OVERRIDE_5=BIT(15), tx_symon=8<<4, ck_symon=8<<0         → 0x8088
     *
     * reg 0x06 was already attempted in the diag probe above. */
    int i2cm_ok = (ih_final & 0x02U) ? 1 : 0;
    int first_fail_reg  = (i2cm_ok == 0) ? 0x06 : 0;
    int first_fail_type = (i2cm_ok == 0) ? ((ih_final & 0x01U) ? 2 : 1) : 0;
    int r;
#define I2CM_W(ra, va) \
    do { r = hdmi_phy_i2cm_write(h, (uint8_t)(ra), (uint16_t)(va)); \
         if (r == 1) { i2cm_ok++; } \
         else if (first_fail_type == 0) { \
             first_fail_reg  = (ra); \
             first_fail_type = (r == -1) ? 2 : 1; \
         } } while (0)
    /* reg 0x06 probed above; only retry it if the probe failed */
    if (i2cm_ok == 0) { I2CM_W(0x06, 0x0001); }  /* OPMODE_PLLCFG  */
    I2CM_W(0x10, 0x2080);  /* PLLCURRGMPCTRL: gmp=2, prop=2, int=0          */
    I2CM_W(0x11, 0x020A);  /* PLLDIVCTRL:     vco_cntrl=1, mpll_mult=0xa    */
    I2CM_W(0x19, 0x0007);  /* TXTERM:         TXTERM_OPEN_CIRCUIT            */
    I2CM_W(0x0E, 0x01A0);  /* VLEVCTRL:       sup_txlvl=0xd                 */
    I2CM_W(0x09, 0x8088);  /* CKSYMTXCTRL:    OVERRIDE_5, symon=8           */
#undef I2CM_W
    __asm__ volatile ("fence" ::: "memory");

    /* Step 7: PHY power-on (Linux dw_hdmi_phy_power_on for gen2).
     *   PHY_CONF0 = 0x2E: SVSRET(5)=1, TXPWRON(3)=1, PDDQ(4)=0,
     *                     ENHPDRXSENSE(2)=1, SELDATAENPOL(1)=1 */
    h[0x3000] = 0x2EU;
    __asm__ volatile ("fence" ::: "memory");

    /* Wait up to 200 ms for TX_PHY_LOCK after first iteration. */
    for (int i = 0; i < 200; i++) {
        if (h[0x3004] & 0x01U) break;
        delay_us(1000);
    }

    /* Linux runs hdmi_phy_configure() TWICE ("HDMI Phy spec says to do the
     * phy initialization sequence twice").  If not locked after first pass,
     * do a second power-off → HEACPHY_RST → I2CM writes → power-on cycle. */
    if (!(h[0x3004] & 0x01U)) {
        /* Second iteration: power off */
        h[0x3000] = 0x36U;  /* PDDQ=1, TXPWRON=0 */
        __asm__ volatile ("fence" ::: "memory");
        delay_us(5000);

        /* MC_PHYRSTZ assert/deassert */
        h[0x4005] = 0x01U;
        __asm__ volatile ("fence" ::: "memory");
        delay_us(200);
        h[0x4005] = 0x00U;
        __asm__ volatile ("fence" ::: "memory");
        delay_us(10000);

        /* HEACPHY_RST assert */
        h[0x4007] = 0x01U;
        __asm__ volatile ("fence" ::: "memory");

        /* TSTCLR + I2CM slave address */
        h[0x3001] = 0x20U;
        __asm__ volatile ("fence" ::: "memory");
        delay_us(100);
        h[0x3020] = 0x69U;
        __asm__ volatile ("fence" ::: "memory");
        delay_us(100);
        h[0x3001] = 0x00U;
        __asm__ volatile ("fence" ::: "memory");
        delay_us(1000);

        /* Re-flush IH */
        h[0x0108] = 0xFFU;
        __asm__ volatile ("fence" ::: "memory");

        /* Second set of 6 PHY I2CM writes */
        hdmi_phy_i2cm_write(h, 0x06, 0x0001);
        hdmi_phy_i2cm_write(h, 0x10, 0x2080);
        hdmi_phy_i2cm_write(h, 0x11, 0x020A);
        hdmi_phy_i2cm_write(h, 0x19, 0x0007);
        hdmi_phy_i2cm_write(h, 0x0E, 0x01A0);
        hdmi_phy_i2cm_write(h, 0x09, 0x8088);
        __asm__ volatile ("fence" ::: "memory");

        /* Power on second time */
        h[0x3000] = 0x2EU;
        __asm__ volatile ("fence" ::: "memory");
    }

    /* Wait up to 1 s for TX_PHY_LOCK (total). */
    for (int i = 0; i < 1000; i++) {
        if (h[0x3004] & 0x01U) break;
        delay_us(1000);
    }

    uint32_t phystat = h[0x3004] & 0xFFU;

    /* Re-apply the active video path after PHY bring-up.
     * The Gen2 reset / TSTCLR / HEAC sequence runs after our earlier sampler,
     * packetizer, and FC writes. Upstream programs the video path after PHY
     * init, so rewrite the live path here in case the later PHY sequence
     * disturbed any of that state. */
    h[0x4001] = 0x00U;  /* MC_CLKDIS: all clocks enabled */
    h[0x4006] = 0x71U;  /* MC_LOCKONCLOCK */

    h[0x0200] = 0x01U;  /* TX_INVID0     */
    h[0x0201] = 0x07U;  /* TX_INSTUFFING */
    h[0x0202] = 0x00U;  /* TX_GYDATA0    */
    h[0x0203] = 0x00U;  /* TX_GYDATA1    */
    h[0x0204] = 0x00U;  /* TX_RCRDATA0   */
    h[0x0205] = 0x00U;  /* TX_RCRDATA1   */
    h[0x0206] = 0x00U;  /* TX_BCBDATA0   */
    h[0x0207] = 0x00U;  /* TX_BCBDATA1   */

    h[0x0801] = 0x40U;  /* VP_PR_CD */
    h[0x0802] = 0x27U;  /* VP_STUFF */
    h[0x0803] = 0x00U;  /* VP_REMAP */
    h[0x0804] = 0x47U;  /* VP_CONF  */
    h[0x0807] = 0xFFU;  /* VP_MASK  */
    __asm__ volatile ("fence" ::: "memory");

    hdmi_program_identity_csc(h);

    h[0x1000] = 0x78U;  /* FC_INVIDCONF     */
    h[0x1001] = 0x80U;  /* FC_INHACTV0      */
    h[0x1002] = 0x07U;  /* FC_INHACTV1      */
    h[0x1003] = 0x18U;  /* FC_INHBLANK0     */
    h[0x1004] = 0x01U;  /* FC_INHBLANK1     */
    h[0x1005] = 0x38U;  /* FC_INVACTV0      */
    h[0x1006] = 0x04U;  /* FC_INVACTV1      */
    h[0x1007] = 0x2DU;  /* FC_INVBLANK      */
    h[0x1008] = 0x58U;  /* FC_HSYNCINDELAY0 */
    h[0x1009] = 0x00U;  /* FC_HSYNCINDELAY1 */
    h[0x100A] = 0x2CU;  /* FC_HSYNCINWIDTH0 */
    h[0x100B] = 0x00U;  /* FC_HSYNCINWIDTH1 */
    h[0x100C] = 0x04U;  /* FC_VSYNCINDELAY  */
    h[0x100D] = 0x05U;  /* FC_VSYNCINWIDTH  */
    h[0x1011] = 0x0CU;  /* FC_CTRLDUR       */
    h[0x1012] = 0x20U;  /* FC_EXCTRLDUR     */
    h[0x1013] = 0x01U;  /* FC_EXCTRLSPAC    */
    h[0x1014] = 0x0BU;  /* FC_CH0PREAM      */
    h[0x1015] = 0x16U;  /* FC_CH1PREAM      */
    h[0x1016] = 0x21U;  /* FC_CH2PREAM      */
    h[0x1019] = 0x60U;  /* FC_AVICONF0      */
    h[0x101A] = 0x28U;  /* FC_AVICONF1      */
    h[0x101B] = 0x04U;  /* FC_AVICONF2      */
    h[0x101C] = 0x10U;  /* FC_AVIVID        */
    __asm__ volatile ("fence" ::: "memory");

    hdmi_program_hdcp_video_polarity(h);

    h[0x4002] = 0xFFU;  /* MC_SWRSTZ: release all */
    __asm__ volatile ("fence" ::: "memory");
    hdmi_clear_overflow(h);

    *diag0_out = (slave_rb             << 24) |   /* PHY_I2CM_SLAVE rb (0x69=good, 0x00=gated) */
                 (div_rb               << 16) |   /* PHY_I2CM_DIV   rb (0x0B=good, 0x00=gated) */
                 (ih_preop             <<  8) |   /* IH before first OPERATION (0=clean) */
                 (uint32_t)(i2cm_ok & 0xFFU);     /* number of successful writes (6=all) */
    *diag1_out = ((uint32_t)first_fail_reg << 16) |
                 ((uint32_t)phystat        <<  8) |
                 (uint32_t)first_fail_type;
}

/* ----------------------------------------------------------------
 * DC8200 display engine init (base 0xFFEF600000).
 *
 * Plane assignment (from dc_hw_planes[DC_REV_0] in vs_dc_hw.c):
 *   PRIMARY_PLANE_0 (offset=0x00) → display 0 = eDP
 *   PRIMARY_PLANE_1 (offset=0x04) → display 1 = HDMI  ← we use this
 *
 * Linux uses PRIMARY_PLANE_1 for HDMI.  Its secondary registers
 * (BLEND_CONFIG, SRC/DST_GLOBAL_COLOR, TOP_LEFT, BOTTOM_RIGHT) may
 * or may not be valid from a prior Linux session, so we write them
 * explicitly here.
 *
 * Key registers and their plane-1 addresses (base + offset 4):
 *   DC_FRAMEBUFFER_ADDRESS      0x1400 → 0x1404
 *   DC_FRAMEBUFFER_STRIDE       0x1408 → 0x140C
 *   DC_FRAMEBUFFER_SIZE         0x1810 → 0x1814
 *   DC_FRAMEBUFFER_CONFIG       0x1518 → 0x151C
 *   DC_FRAMEBUFFER_CONFIG_EX    0x1CC0 → 0x1CC4
 *   DC_FRAMEBUFFER_SCALE_CONFIG 0x1520 → 0x1524
 *   DC_FRAMEBUFFER_BLEND_CONFIG 0x2510 → 0x2514
 *   DC_FRAMEBUFFER_SRC_GLOBAL_COLOR 0x2500 → 0x2504
 *   DC_FRAMEBUFFER_DST_GLOBAL_COLOR 0x2508 → 0x250C
 *   DC_FRAMEBUFFER_TOP_LEFT     0x24D8 → 0x24DC
 *   DC_FRAMEBUFFER_BOTTOM_RIGHT 0x24E0 → 0x24E4
 *
 * Commit semantics follow upstream Verisilicon DRM:
 *   - CONFIG_EX BIT(13) enables the primary plane
 *   - CONFIG_EX BIT(19) selects display 0/1
 *   - CONFIG_EX BIT(12) is a one-shot COMMIT latch
 *   - BLEND_CONFIG BIT(1) disables blending so the primary plane is opaque
 * ---------------------------------------------------------------- */
static void dc8200_init(void)
{
    volatile uint32_t *dc = (volatile uint32_t *)0xFFEF600000ULL;

    /* The green-screen probe proved the live HDMI route is display 1 and the
     * DW-HDMI core is now consuming DC output correctly. Keep the green
     * display-1 background as a failure sentinel underneath the primary plane,
     * but program only plane 1 because upstream uses plane index 1 for
     * display 1 / HDMI. */

    /* Disable both planes so stale state cannot cover the new plane-1
     * commit. BIT(12) is commit, not a persistent shadow-enable bit. */
    dc[0x1CC0/4] = 0x00000000U;
    dc[0x1CC4/4] = 0x00000000U;
    __asm__ volatile ("fence" ::: "memory");

    /* Force both display blocks onto the DPI/HDMI output path. */
    dc[0x1CD0/4] &= ~(1U << 3);
    dc[0x1CD4/4] &= ~(1U << 3);
    __asm__ volatile ("fence" ::: "memory");

    /* Program both display timing generators for 1920x1080@60. */
    dc[0x1418/4] = 0x00001111U;
    dc[0x141C/4] = 0x00001111U;
    dc[0x14B8/4] = 5U;
    dc[0x14BC/4] = 5U;
    dc[0x1430/4] = 0x08980780U;
    dc[0x1434/4] = 0x08980780U;
    dc[0x1438/4] = 0x440207D8U;
    dc[0x143C/4] = 0x440207D8U;
    dc[0x1440/4] = 0x04650438U;
    dc[0x1444/4] = 0x04650438U;
    dc[0x1448/4] = 0x4220843CU;
    dc[0x144C/4] = 0x4220843CU;

    /* Distinct probe colors for each display block. */
    dc[0x1528/4] = RGB(0x00, 0x00, 0xFF);  /* display 0 background = blue  */
    dc[0x152C/4] = RGB(0x00, 0xFF, 0x00);  /* display 1 background = green */
    __asm__ volatile ("fence" ::: "memory");

    /* Plane 1 -> display 1 (HDMI): XRGB8888 framebuffer at low DRAM.
     * For DRM_FORMAT_XRGB8888, upstream uses:
     *   color format = X8R8G8B8 = 5
     *   swizzle      = ARGB    = 0
     * and writes BLEND_CONFIG = BIT(1) to disable blending. */
    dc[0x1404/4] = (uint32_t)(uintptr_t)FB_PHYS;     /* FRAMEBUFFER_ADDRESS      */
    dc[0x140C/4] = (uint32_t)(FB_WIDTH * 4U);        /* FRAMEBUFFER_STRIDE       */
    dc[0x1814/4] = (1080U << 15) | 1920U;            /* FRAMEBUFFER_SIZE         */
    dc[0x151C/4] = (5U << 26);                       /* FRAMEBUFFER_CONFIG       */
    dc[0x1524/4] = 0x00000030U;                      /* TH1520 1:1 scale path    */
    dc[0x2514/4] = 0x00000002U;                      /* BLEND_CONFIG disable     */
    dc[0x2504/4] = 0xFF000000U;                      /* SRC global alpha = 0xFF  */
    dc[0x250C/4] = 0xFF000000U;                      /* DST global alpha = 0xFF  */
    dc[0x24DC/4] = 0x00000000U;                      /* viewport top-left        */
    dc[0x24E4/4] = (1080U << 15) | 1920U;            /* viewport bottom-right    */
    dc[0x1CC4/4] = (1U << 19) | (1U << 13);          /* plane1 enable, display1  */
    dc[0x1CC4/4] |= (1U << 12);                      /* plane1 commit            */
    __asm__ volatile ("fence" ::: "memory");

    /* Start both display timing generators and clear sync/pipe-sync mode. */
    dc[0x1CCC/4] = (dc[0x1CCC/4] & ~((1U << 2) | (1U << 3))) |
                   (1U << 0) | (1U << 1);
    __asm__ volatile ("fence" ::: "memory");
}

/*
 * hdmi_hello_world
 *
 * Full bare-metal display init + "Hello World" render.
 *
 * Scratch (md.l 0x05000000 22):
 *   [0] aa000001 — entered
 *   [1] aa000002 — clocks enabled
 *   [2] aa000003 — framebuffer painted + dcache flushed
 *   [3] aa000004 — DW-HDMI init done
 *   [4] aa000005 — DC8200 init + commit done
 *   [5] aa000006 — entered steady-state hold loop
 *   [6] scratch[6]: [31:24]=SLAVE_rb [23:16]=DIV_rb [15:8]=IH_preop [7:0]=i2cm_ok
 *       0x690B0006 = all good (0x69 slave, 0x0B div, 6 writes)
 *   [7] scratch[7]: [23:16]=first_fail_reg [15:8]=PHY_STAT0 [7:0]=fail_type
 *       0x0000F300 = TX_PHY_LOCK=1 → video should appear
 *   [8] scratch[8]: [23:16]=MC_CLKDIS_rb [15:8]=IH_5us_after_OP [7:0]=IH_after_50ms
 *       0x000002xx = I2CM clocked, IH fired fast (0x02=done)
 *   [9] scratch[9]: DPU0 PLL STS (ap+0x80)
 *       BIT(8)=DPU0_LOCK, BIT(9)=DPU1_LOCK — expect both 1
 *   [10] scratch[10]: DPU0 PLL CFG0 (ap+0x40)
 *       expect 0x01206301 if PLL write succeeded
 *   [11] scratch[11]: DPU0 PLL CFG1 (ap+0x44)
 *       BIT(30)=BYPASS, BIT(29)=RST — expect both 0
 *   [12] scratch[12]: DPU0_PLL_DIV_CLK (ap+0x1E8)
 *       bits[7:0]=divider(8), bit[8]=sync_en(1)
 *   [13] scratch[13]: DPU1 PLL CFG0 (ap+0x50)
 *       expect 0x01206301
 *   [14] scratch[14]: DPU1 PLL CFG1 (ap+0x54)
 *       BIT(30)=BYPASS, BIT(29)=RST — expect both 0
 *   [15] scratch[15]: DPU1_PLL_DIV_CLK (ap+0x1EC)
 *       bits[7:0]=divider(8), bit[8]=sync_en(1)
 *   [16] First framebuffer pixel FB_PHYS[0] (after dcache flush)
 *       should be 0x00FFFFFF = white bar (confirms flush + DRAM write)
 *   [17] DC_FRAMEBUFFER_ADDRESS plane 1 (dc+0x1404)
 *       should be 0x04200000
 *   [18] DC_FRAMEBUFFER_CONFIG_EX plane 1 (dc+0x1CC4)
 *       should be 0x00082000 (enable=BIT(13), display_id=1=BIT(19))
 *   [19] DC_FRAMEBUFFER_CONFIG plane 1 (dc+0x151C)
 *       should be 0x14000000 (XRGB8888)
 *   [20] DC_DISPLAY_PANEL_START (dc+0x1CCC) readback after commit
 *       (hardware may auto-clear; value is informational)
 *   [21] DC_DISPLAY_PANEL_CONFIG display 1 (dc+0x141C)
 *       should be 0x00001111 (bit12=panel_enable)
 */
void hdmi_hello_world(void)
{
    volatile uint32_t *scratch = (volatile uint32_t *)0x05000000ULL;
    volatile uint32_t *dc_pre = (volatile uint32_t *)0xFFEF600000ULL;

    scratch[0] = 0xAA000001;
    __asm__ volatile ("fence" ::: "memory");

    /* Capture the display-engine state U-Boot left behind before we touch it.
     * If the visible red splash is being scanned from a different plane or
     * address than our current plane-1 setup, this readback identifies it. */
    {
        uint32_t pre_p0_addr  = dc_pre[0x1400/4];
        uint32_t pre_p0_cfgex = dc_pre[0x1CC0/4];
        uint32_t pre_p1_addr  = dc_pre[0x1404/4];
        uint32_t pre_p1_cfgex = dc_pre[0x1CC4/4];
        uint32_t pre_pstart   = dc_pre[0x1CCC/4];
        uint32_t pre_pcfg0    = dc_pre[0x1418/4];
        uint32_t pre_pcfg1    = dc_pre[0x141C/4];

        uart_puts_bare("[pre] p0_addr=");   uart_puthex(pre_p0_addr);
        uart_puts_bare(" p0_cfgex=");       uart_puthex(pre_p0_cfgex);
        uart_puts_bare(" p1_addr=");        uart_puthex(pre_p1_addr);
        uart_puts_bare(" p1_cfgex=");       uart_puthex(pre_p1_cfgex); uart_putc('\n');
        uart_puts_bare("[pre] pstart=");    uart_puthex(pre_pstart);
        uart_puts_bare(" pcfg0=");          uart_puthex(pre_pcfg0);
        uart_puts_bare(" pcfg1=");          uart_puthex(pre_pcfg1); uart_putc('\n');
    }

    /* 1. Re-enable display subsystem clocks. */
    vosys_clk_enable();
    delay_us(500);
    scratch[1] = 0xAA000002;
    __asm__ volatile ("fence" ::: "memory");

    /* 1b. Configure DPU0 and DPU1 PLLs for 148.5 MHz pixel clock (1080p60).
     *     Both PLLs are configured to ensure 148.5 MHz reaches the HDMI PHY:
     *     DPU0_PLL_DIV_CLK feeds the DC8200 display engine pixel clock;
     *     DPU1_PLL_DIV_CLK may feed the DW-HDMI pixel clock — configure both. */
    dpu0_pll_configure_1080p60();
    dpu1_pll_configure_1080p60();

    /* PLL diagnostic: read AP CLKGEN registers after both PLLs configured.
     *   scratch[9]  = PLL_STS (ap+0x80): BIT(8)=DPU0_LOCK, BIT(9)=DPU1_LOCK
     *   scratch[10] = DPU0_PLL_CFG0 (ap+0x40): expect 0x01206301
     *   scratch[11] = DPU0_PLL_CFG1 (ap+0x44): BIT(30)=BYPASS, BIT(29)=RST (want 0)
     *   scratch[12] = DPU0_PLL_DIV_CLK (ap+0x1E8): bits[7:0]=div(8), bit[8]=sync_en(1)
     *   scratch[13] = DPU1_PLL_CFG0 (ap+0x50): expect 0x01206301
     *   scratch[14] = DPU1_PLL_CFG1 (ap+0x54): BIT(30)=BYPASS, BIT(29)=RST (want 0)
     *   scratch[15] = DPU1_PLL_DIV_CLK (ap+0x1EC): bits[7:0]=div(8), bit[8]=sync_en(1) */
    {
        volatile uint32_t *ap = (volatile uint32_t *)0xFFEF010000ULL;
        scratch[9]  = ap[0x80/4];
        scratch[10] = ap[0x40/4];
        scratch[11] = ap[0x44/4];
        scratch[12] = ap[0x1E8/4];
        scratch[13] = ap[0x50/4];
        scratch[14] = ap[0x54/4];
        scratch[15] = ap[0x1EC/4];
    }

        /* 2. Paint a coordinate probe before display comes up.
         *    Each 240x270 cell has a unique A-H / 0-3 label plus marker bars,
         *    so one photo of the scrambled screen is enough to infer the DC8200
         *    fetch layout. */
        fb_layout_probe();
    __asm__ volatile ("fence" ::: "memory");

    /* Clean framebuffer cache lines to DRAM so the non-coherent DC8200 DMA
     * engine sees the final pixels. Linux uses th.dcache.cpa/th.sync.s for
     * T-Head CMOs; the earlier guessed whole-cache opcode was not a verified
     * writeback path and matches the observed loss of the most recently drawn
     * tail region. */
    thead_dcache_clean_range((uintptr_t)FB_PHYS, FB_SIZE_BYTES);

    scratch[2] = 0xAA000003;
    __asm__ volatile ("fence" ::: "memory");

    /* 3. Initialise DW-HDMI transmitter (clocks, FC, PHY). */
    uint32_t diag0, diag1, diag2;
    dw_hdmi_init(&diag0, &diag1, &diag2);
    scratch[3] = 0xAA000004;
    scratch[6] = diag0;  /* [31:24]=SLAVE_rb [23:16]=DIV_rb [15:8]=IH_preop [7:0]=i2cm_ok */
    scratch[7] = diag1;  /* [23:16]=first_fail_reg [15:8]=PHY_STAT0 [7:0]=fail_type */
    scratch[8] = diag2;  /* [23:16]=MC_CLKDIS_rb [15:8]=IH_fast [7:0]=IH_final */
    __asm__ volatile ("fence" ::: "memory");

    /* 4. Initialise DC8200 and commit framebuffer to scanout. */
    dc8200_init();
    scratch[4] = 0xAA000005;

    /* DC8200 post-init diagnostics (md.l 0x05000000 22):
     *   [16] First framebuffer pixel (should be 0x00FFFFFF = white bar)
     *   [17] Plane 1 FRAMEBUFFER_ADDRESS  (0x1404): should be 0x04200000
     *   [18] Plane 1 FRAMEBUFFER_CONFIG_EX (0x1CC4): should be 0x00082000
     *   [19] Plane 1 FRAMEBUFFER_CONFIG    (0x151C): should be 0x14000000
     *   [20] DC_DISPLAY_PANEL_START        (0x1CCC): BIT(1) should be set
     *   [21] DC_DISPLAY_PANEL_CONFIG d1    (0x141C): should be 0x00001111 */
    {
        volatile uint32_t *dc = (volatile uint32_t *)0xFFEF600000ULL;
        uint32_t fb0      = FB_PHYS[0];
        uint32_t p0_addr  = dc[0x1400/4];   /* plane 0 FB addr (should be 0/disabled) */
        uint32_t p0_cfgex = dc[0x1CC0/4];   /* plane 0 CONFIG_EX                      */
        uint32_t p1_addr  = dc[0x1404/4];   /* plane 1 FB addr (should be 0x04200000) */
        uint32_t p1_stride= dc[0x140C/4];   /* plane 1 FB stride                      */
        uint32_t p1_size  = dc[0x1814/4];   /* plane 1 FB size                        */
        uint32_t p1_cfgex = dc[0x1CC4/4];   /* plane 1 CONFIG_EX                      */
        uint32_t p1_cfg   = dc[0x151C/4];   /* plane 1 FB_CONFIG (format)             */
        uint32_t p1_scale = dc[0x1524/4];   /* plane 1 SCALE_CONFIG                   */
        uint32_t p1_blend = dc[0x2514/4];   /* plane 1 BLEND_CONFIG                   */
        uint32_t p1_srcga = dc[0x2504/4];   /* plane 1 SRC global alpha               */
        uint32_t p1_dstga = dc[0x250C/4];   /* plane 1 DST global alpha               */
        uint32_t p1_tl    = dc[0x24DC/4];   /* plane 1 viewport top-left              */
        uint32_t p1_br    = dc[0x24E4/4];   /* plane 1 viewport bottom-right          */
        uint32_t pstart   = dc[0x1CCC/4];   /* PANEL_START                            */
        uint32_t pcfg1    = dc[0x141C/4];   /* PANEL_CONFIG display 1                 */

        scratch[16] = fb0;
        scratch[17] = p1_addr;
        scratch[18] = p1_cfgex;
        scratch[19] = p1_cfg;
        scratch[20] = pstart;
        scratch[21] = pcfg1;

        uart_puts_bare("[dc] fb0=");    uart_puthex(fb0);
        uart_puts_bare(" p0_addr=");    uart_puthex(p0_addr);
        uart_puts_bare(" p0_cfgex=");   uart_puthex(p0_cfgex); uart_putc('\n');
        uart_puts_bare("[dc] p1_addr=");uart_puthex(p1_addr);
        uart_puts_bare(" p1_cfgex=");   uart_puthex(p1_cfgex);
        uart_puts_bare(" p1_cfg=");     uart_puthex(p1_cfg); uart_putc('\n');
        uart_puts_bare("[dc] p1_stride="); uart_puthex(p1_stride);
        uart_puts_bare(" p1_size=");      uart_puthex(p1_size);
        uart_puts_bare(" p1_scale=");     uart_puthex(p1_scale);
        uart_puts_bare(" p1_blend=");     uart_puthex(p1_blend); uart_putc('\n');
        uart_puts_bare("[dc] p1_srcga=");  uart_puthex(p1_srcga);
        uart_puts_bare(" p1_dstga=");      uart_puthex(p1_dstga);
        uart_puts_bare(" p1_tl=");         uart_puthex(p1_tl);
        uart_puts_bare(" p1_br=");         uart_puthex(p1_br); uart_putc('\n');
        uart_puts_bare("[dc] pstart="); uart_puthex(pstart);
        uart_puts_bare(" pcfg1=");      uart_puthex(pcfg1); uart_putc('\n');
        uart_puts_bare("[hdmi] phystat="); uart_puthex(diag1);
        uart_puts_bare(" i2cm=");          uart_puthex(diag0);
        uart_puts_bare(" ih=");            uart_puthex(diag2); uart_putc('\n');

        uart_puts_bare("[hdmi-dump] 0xFFEF540000 8\n");
        uart_dump_mmio32(0xFFEF540000ULL, 8);
        uart_puts_bare("[hdmi-dump] 0xFFEF540400 2\n");
        uart_dump_mmio32(0xFFEF540400ULL, 2);
        uart_puts_bare("[hdmi-dump] 0xFFEF544000 10\n");
        uart_dump_mmio32(0xFFEF544000ULL, 10);
    }
    __asm__ volatile ("fence" ::: "memory");

    scratch[5] = 0xAA000006;
    __asm__ volatile ("fence" ::: "memory");

    uart_puts_bare("[hold] scanout active; reset board to return\n");

    /* Keep ownership of the display engine after the first frame commit.
     *
     * The current diagnostics show our framebuffer contents and DC8200
     * registers are correct while this function is running. Returning to
     * U-Boot is therefore the cheapest remaining explanation for the red
     * splash: U-Boot regains control immediately after `go` returns and can
     * restore its own framebuffer before the monitor visibly presents our
     * frame.
     *
     * Hold here so scanout stays under bare-metal control. Reset or power
     * cycle the board to return to U-Boot after this probe. */
    while (1)
        __asm__ volatile ("nop");
}
