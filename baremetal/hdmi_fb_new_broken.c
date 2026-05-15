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
 * NOTE: The DC8200 SE-MMU is DISABLED after the warm U-Boot handoff
 * (confirmed: SE_MMU_CONTROL BIT(0)=0).  We therefore use a single
 * 32-bit physical address (0x50000000) for both CPU writes and the
 * DC_FRAMEBUFFER_ADDRESS register — no IOMMU translation is used.
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

/* Framebuffer physical address in DRAM.
 *
 * The DC8200 SE-MMU (IOMMU) is DISABLED after the warm U-Boot handoff
 * (SE_MMU_CONTROL BIT(0) = 0, confirmed by scratch[23] = 0x00005720).
 * Linux tears down the IOMMU page tables during shutdown; they do NOT
 * survive the handoff.  With IOMMU off the DC8200 DMA uses the value
 * in DC_FRAMEBUFFER_ADDRESS as a raw physical address.
 *
 * We therefore pick a single <4GB physical address for the framebuffer:
 *   - CPU writes pixels to FB_ADDR (physical)
 *   - DC_FRAMEBUFFER_ADDRESS register gets the same value
 *   - No IOMMU translation involved
 *
 * 0x50000000 (1.25 GB): safely above our code at 0x04000000, within
 * the BeagleV-Ahead's 4 GB DRAM, and fits in the 32-bit register. */
#define FB_ADDR   0x04200000U   /* cold-boot framebuffer: 2 MB above binary base.
                               * Confirmed-valid DDR: 0x04000000 (code) and
                               * 0x05000000 (scratch) both work; 0x10000000 and
                               * 0x50000000 both cause AXI bus timeouts on cold
                               * boot (they are outside the accessible S-mode DDR
                               * window before the security/bus filters are set up
                               * by Linux).  This puts the 8 MB framebuffer at
                               * 0x04200000–0x04A00000, safely below scratch. */
/* Set at runtime in hdmi_hello_world() from dc[0x1400/4] (U-Boot's scanout address). */
static volatile uint32_t *FB_PHYS;

#define FB_WIDTH   1920
#define FB_HEIGHT  1080

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
 * Re-enable display-subsystem clock gates (DC8200 + HDMI TX).
 *
 * clk[0x074] and clk[0x078] ARE written here (restored).
 * These are the pixel-clock-select/enable registers.  U-Boot leaves
 * them at 0x7050; Linux sets them to 0x7130 when HDMI is active.
 * With 0x7050 the PHY MPLL gets no reference and TX_PHY_LOCK stays 0.
 * With 0x7130 (Linux-verified value) the MPLL receives 148.5 MHz and
 * locks correctly.  We previously removed these writes thinking they
 * were corrupting a divider, but that was a false diagnosis — the real
 * problem at the time was the MC_PHYRSTZ active-LOW polarity bug.
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
    clk[0x074/4] = 0x00007130U;  /* pixel clock select/enable (Linux value) */
    clk[0x078/4] = 0x00007130U;
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
 * The IH_I2CMPHY_STAT0 clear (W1C) must happen BEFORE the address/data
 * setup writes, not after triggering OPERATION.  After OPMODE_PLLCFG is
 * written the PHY MPLL starts up; subsequent I2CM transactions complete
 * in nanoseconds on the internal bus.  A post-OPERATION W1C arrives late
 * enough to wipe the DONE bit before the poll ever reads it → permanent
 * timeout on every write after the first.  Pre-OPERATION W1C is safe: any
 * stale SOFTRSTZ glitch will have fully settled well before we get here.
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
    /* W1C flush: clear stale bits from any previous transaction BEFORE
     * setting up the new one.  This must come first — clearing AFTER
     * OPERATION risks wiping the DONE bit of the current transaction on
     * fast MPLL-clocked writes (DONE can arrive in <10 ns). */
    h[0x0108] = 0xFFU;
    __asm__ volatile ("fence" ::: "memory");
    h[0x3021] = reg;                  /* PHY_I2CM_ADDRESS */
    h[0x3022] = (val >> 8) & 0xFFU;  /* PHY_I2CM_DATAO_1 (MSB) */
    h[0x3023] = val & 0xFFU;          /* PHY_I2CM_DATAO_0 (LSB) */
    h[0x3027] = 0x08U;               /* PHY_I2CM_INT:    DONE_POL=BIT(3), DONE_MASK=0 */
    h[0x3028] = 0x88U;               /* PHY_I2CM_CTLINT: NAK_POL=BIT(7)|ARB_POL=BIT(3) */
    __asm__ volatile ("fence" ::: "memory");
    h[0x3026] = 0x10U;               /* PHY_I2CM_OPERATION = write */
    __asm__ volatile ("fence" ::: "memory");
    /* Immediate sample: catches fast-path (MPLL running) where DONE fires
     * in nanoseconds and is already set before the first poll delay. */
    {
        uint32_t s = h[0x0108] & 0x03U;
        if (s) {
            h[0x0108] = s;
            if (s & 0x02U) return  1;
            if (s & 0x01U) return -1;
        }
    }
    /* Poll IH every 1 ms for up to 50 ms (50kHz I2C: ~640 µs per write). */
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

#define I2CM_ATTEMPTS       3
#define I2CM_RETRY_DELAY_US 200
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

/* ----------------------------------------------------------------
 * Minimal 16550-compatible UART TX for TH1520 UART0 (0xFFE7014000).
 * U-Boot uses this console UART; it is always accessible from S-mode.
 * Writes one character, waiting for the transmit-hold-register-empty
 * bit (LSR bit 5) before writing.  No init required: U-Boot already
 * configured the UART divisor and line control.
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

    /* Video Packetizer. */
    h[0x0801] = 0x40U;  /* VP_PR_CD */
    h[0x0802] = 0x27U;  /* VP_STUFF */
    h[0x0804] = 0x47U;  /* VP_CONF  */
    h[0x0807] = 0xFFU;  /* VP_MASK  */
    __asm__ volatile ("fence" ::: "memory");

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

    /* Step 2: MC_PHYRSTZ pulse — Gen2 PHY is ACTIVE-HIGH reset.
     * Linux dw_hdmi_phy_gen2_reset(): ASSERT=0x01 (in reset), DEASSERT=0x00 (running).
     * Gen1 is active-LOW; Gen2 (TH1520) is active-HIGH. */
    h[0x4005] = 0x01U;  /* MC_PHYRSTZ: ASSERT   (active-HIGH: 1 = in reset) */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(200);
    h[0x4005] = 0x00U;  /* MC_PHYRSTZ: DEASSERT (active-HIGH: 0 = running)  */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(50000);    /* 50 ms: PHY digital logic (incl. I2C slave) stabilises */

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

    /* Step 5: I2CM controller setup AFTER TSTCLR (so TSTCLR can't reset them).
     *
     * MC_SWRSTZ (written above) resets the I2CM master to all zeros including
     * HCNT/LCNT, so we must reprogram timing here.
     *
     * DIV=0x0B: bit[3]=1 → fast speed mode (uses FS_HCNT/LCNT),
     *           bits[2:0]=3 → reference = pclk / 2^4 = 148.5MHz/16 = 9.28MHz.
     * FS_HCNT=53, FS_LCNT=127 → SCL = 9.28MHz / 180 ≈ 51.5 kHz.
     * At ~50 kHz a 16-bit write completes in ~640 µs.
     *
     * Correct register offsets (confirmed from Linux dw-hdmi.h):
     *   0x302B/0x302C = SS_SCL_HCNT_1/0    0x302D/0x302E = SS_SCL_LCNT_1/0
     *   0x302F/0x3030 = FS_SCL_HCNT_1/0    0x3031/0x3032 = FS_SCL_LCNT_1/0
     *   0x3033        = SDA_HOLD
     * (No gap between SOFTRSTZ at 0x302A and SS_HCNT_1 at 0x302B.) */
    h[0x3029] = 0x0BU;  /* PHY_I2CM_DIV: fast mode (bit[3]=1), pre-div 3 */
    h[0x302A] = 0x00U;  /* PHY_I2CM_SOFTRSTZ: assert */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(100);
    h[0x302A] = 0x01U;  /* PHY_I2CM_SOFTRSTZ: release */
    __asm__ volatile ("fence" ::: "memory");
    delay_us(100);
    h[0x302B] = 0x00U; h[0x302C] = 0x7FU;  /* SS_HCNT = 127 (unused in fast mode) */
    h[0x302D] = 0x00U; h[0x302E] = 0x7FU;  /* SS_LCNT = 127 (unused in fast mode) */
    h[0x302F] = 0x00U; h[0x3030] = 0x35U;  /* FS_HCNT = 53  → ~51.5 kHz SCL     */
    h[0x3031] = 0x00U; h[0x3032] = 0x7FU;  /* FS_LCNT = 127                       */
    h[0x3033] = 0x08U;                       /* SDA_HOLD = 8                        */
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
    uart_puts_bare("[phy] slave="); uart_puthex(slave_rb);
    uart_puts_bare(" div="); uart_puthex(div_rb); uart_putc('\n');

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
    /* Fire the first PHY config write (OPMODE_PLLCFG 0x06 = 0x0001)
     * and sample IH at 5 µs for diagnostic purposes only.
     * The W1C flush must happen AFTER triggering OPERATION because
     * the SOFTRSTZ resonance can re-assert IH bits in the window
     * between the pre-OPERATION flush and the OPERATION write itself. */
    uint32_t ih_fast = 0;
    uint32_t ih_final = 0;
    {
        uint8_t  ra = 0x06; uint16_t va = 0x0001;  /* OPMODE_PLLCFG */
        h[0x3021] = ra;
        h[0x3022] = (va >> 8) & 0xFFU;
        h[0x3023] = va & 0xFFU;
        h[0x3027] = 0x08U;  /* DONE_POL=BIT(3), DONE_MASK=0 */
        h[0x3028] = 0x88U;  /* NAK_POL=BIT(7)|ARB_POL=BIT(3) */
        __asm__ volatile ("fence" ::: "memory");
        h[0x3026] = 0x10U;  /* trigger OPERATION */
        __asm__ volatile ("fence" ::: "memory");
        h[0x0108] = 0xFFU;  /* W1C flush AFTER OPERATION to clear pre-existing glitch */
        __asm__ volatile ("fence" ::: "memory");
        delay_us(5);        /* ~5 µs: sample IH */
        ih_fast = h[0x0108] & 0x03U;
        /* Poll for final outcome — do NOT consume the bit; let i2cm_ok logic read it. */
        for (int t = 0; t < 20; t++) {
            delay_us(200);
            uint32_t s = h[0x0108] & 0x03U;
            if (s) { ih_final = s; break; }
        }
        if (ih_final) { h[0x0108] = (uint8_t)ih_final; }  /* W1C consume */
    }
    uart_puts_bare("[phy] ih_fast="); uart_puthex(ih_fast);
    uart_puts_bare(" ih_final="); uart_puthex(ih_final); uart_putc('\n');
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

    /* Wait up to 50 ms for TX_PHY_LOCK after first iteration. */
    for (int i = 0; i < 50; i++) {
        if (h[0x3004] & 0x01U) break;
        delay_us(1000);
    }
    uart_puts_bare("[phy] lock1="); uart_puthex(h[0x3004] & 0xFFU); uart_putc('\n');

    /* Linux runs hdmi_phy_configure() TWICE ("HDMI Phy spec says to do the
     * phy initialization sequence twice").  If not locked after first pass,
     * do a second power-off → HEACPHY_RST → I2CM writes → power-on cycle. */
    if (!(h[0x3004] & 0x01U)) {
        /* Second iteration: power off */
        h[0x3000] = 0x36U;  /* PDDQ=1, TXPWRON=0 */
        __asm__ volatile ("fence" ::: "memory");
        delay_us(5000);

        /* MC_PHYRSTZ assert/deassert (Gen2: active-HIGH) */
        h[0x4005] = 0x01U;  /* ASSERT   (1 = in reset) */
        __asm__ volatile ("fence" ::: "memory");
        delay_us(200);
        h[0x4005] = 0x00U;  /* DEASSERT (0 = running)  */
        __asm__ volatile ("fence" ::: "memory");
        delay_us(5000);

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

    /* Wait up to 100 ms for TX_PHY_LOCK (second pass). */
    for (int i = 0; i < 100; i++) {
        if (h[0x3004] & 0x01U) break;
        delay_us(1000);
    }

    uint32_t phystat = h[0x3004] & 0xFFU;
    uart_puts_bare("[phy] phystat="); uart_puthex(phystat);
    uart_puts_bare(" i2cm_ok="); uart_puthex((uint32_t)(i2cm_ok & 0xFFU));
    uart_puts_bare(" mc_clkdis="); uart_puthex(mc_clkdis_rb); uart_putc('\n');
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
 * Uses PRIMARY_PLANE_0 (base register offsets, no +4 variant).
 *
 * The DC8200 SE-MMU (IOMMU) is DISABLED after the warm U-Boot handoff
 * (SE_MMU_CONTROL BIT(0)=0, confirmed by scratch[23]=0x00005720).
 * DC_FRAMEBUFFER_ADDRESS therefore takes a raw physical address.
 * FB_ADDR = 0x50000000 is used for both CPU pixel writes and the
 * register value — no IOMMU translation involved.
 *
 * BLEND_PIXEL_NONE (0x3548) bypasses per-pixel alpha so our XRGB8888
 * pixels (alpha=0x00) are not treated as transparent.
 *
 * PANEL_CONFIG is read-modify-write |= BIT(12) to avoid disturbing
 * bits that gate the HDMI output clock.
 * ---------------------------------------------------------------- */
/*
 * dc8200_init — configure the DC8200 display engine for 1920×1080@60 HDMI.
 *
 * Always does a full pipeline setup regardless of cold/warm boot.
 * Disables shadow mode first so all register writes take effect immediately
 * (avoids the shadow-register trap where writes go to a shadow copy that only
 * commits on the next VSYNC — which never arrives if the display isn't running).
 *
 * U-Boot's failed LCD-panel probe may have left DC8200 routing its output to
 * display 0 (DSI/LCD).  We always switch to display_id=1 (HDMI) and re-arm
 * the timing generator so the DW-HDMI PHY has a reference pixel clock to lock.
 */
static void dc8200_init(int cold_boot)
{
    (void)cold_boot;   /* always full pipeline setup */
    volatile uint32_t *dc = (volatile uint32_t *)0xFFEF600000ULL;

    /* Disable plane 1, clear leftover state. */
    dc[0x1CC4/4] = 0U;           /* plane 1: fully disabled */
    dc[0x1814/4] = 0U;           /* clear mystery register */
    dc[0x1CD4/4] &= ~(1U << 3); /* DP_CONFIG display 1: clear DP-mode bit */
    __asm__ volatile ("fence" ::: "memory");

    /* Disable shadow: all subsequent writes hit active registers immediately.
     * Without this, writes go to shadow and only commit on the next VSYNC. */
    dc[0x1CC0/4] &= ~(1U << 12);
    __asm__ volatile ("fence" ::: "memory");

    dc[0x1400/4] = (uint32_t)(uintptr_t)FB_PHYS; /* framebuffer PA          */
    dc[0x1408/4] = 0x00001E00U;        /* DC_FRAMEBUFFER_STRIDE = 7680     */
    dc[0x1810/4] = (1080U << 15) | 1920U; /* DC_FRAMEBUFFER_SIZE           */

    dc[0x1518/4] = (5U << 26);         /* FORMAT_X8R8G8B8                  */
    dc[0x1520/4] = 0x33U;              /* SCALE_CONFIG: H+V scaler enabled */

    dc[0x2510/4] = 0x3548U;            /* BLEND_CONFIG = PIXEL_NONE        */
    dc[0x2500/4] = 0xFF000000U;        /* SRC global alpha = 0xFF          */
    dc[0x2508/4] = 0xFF000000U;        /* DST global alpha = 0xFF          */

    dc[0x24D8/4] = 0x00000000U;        /* viewport top-left  (0,0)         */
    dc[0x24E0/4] = (1080U << 15) | 1920U; /* viewport bottom-right         */

    /* Enable plane 0, display_id=1 (HDMI), shadow still off. */
    dc[0x1CC0/4] = (1U << 19) | (1U << 13);
    __asm__ volatile ("fence" ::: "memory");

    /* Display 1 pipeline timing (1920×1080@60 Hz, captured from Linux). */
    dc[0x14BC/4] = 5U;             /* DPI_CONFIG: RGB888_1X24           */
    dc[0x1434/4] = 0x08980780U;   /* H: total=2200, active=1920        */
    dc[0x143C/4] = 0x440207D8U;   /* H_SYNC                            */
    dc[0x1444/4] = 0x04650438U;   /* V: total=1125, active=1080        */
    dc[0x144C/4] = 0x4220843CU;   /* V_SYNC                            */
    dc[0x152C/4] = 0x00000000U;   /* BG_COLOR display 1: black         */
    __asm__ volatile ("fence" ::: "memory");

    /* Enable display 1 output pipe. */
    dc[0x141C/4] |= (1U << 12);
    __asm__ volatile ("fence" ::: "memory");

    /* PANEL_START display 1: BIT(1)=start, clear BIT(3)=sync_mode. */
    dc[0x1CCC/4] = (dc[0x1CCC/4] & ~(1U << 3)) | (1U << 1);
    __asm__ volatile ("fence" ::: "memory");

    /* Re-enable shadow for future double-buffered updates. */
    dc[0x1CC0/4] |= (1U << 12);
    __asm__ volatile ("fence" ::: "memory");
}

/*
 * hdmi_hello_world — bare-metal display bring-up for the BeagleV-Ahead.
 *
 * Handles both cold boot (power-off reset) and warm boot (go after prior run).
 *
 * ---- Root cause of the cold-boot "reboot" crash --------------------------------
 *
 * On cold boot the DC8200 MMIO (0xFFEF600000) is clock-gated because U-Boot's
 * display driver disables the VOSYS domain clocks after the failed LCD-panel
 * probe ("LCD panel cannot be found : -121").  Reading a clock-gated MMIO
 * address on the C910 generates an imprecise bus error.  Crucially, this fault
 * is delivered as an M-mode trap (not delegated to S-mode via medeleg), so our
 * stvec handler at 0x05000010 is NEVER invoked.  OpenSBI's M-mode handler
 * handles the fault by resetting the hart → BROM re-executes → looks like a
 * hard reboot ("brom_ver 8" appears immediately after `go 0x04000000`).
 *
 * Because the C910's bus error is *imprecise* (the CPU posts MMIO writes/reads
 * and continues), the fault is not raised immediately.  It fires when the CPU
 * reaches the next fence instruction.  This is why the crash point shifts by
 * exactly one scratch slot when we add code between the triggering MMIO access
 * and the next fence().
 *
 * ---- The fix -------------------------------------------------------------------
 *
 * Never read DC8200 MMIO before we know the VOSYS domain is clocked.  Use a
 * DRAM magic cookie (scratch[22]+scratch[23]) for cold/warm boot detection
 * instead of reading dc[0x1400/4].  DRAM reads are always safe.
 *
 * For cold boot the correct enable sequence is:
 *   1. PLLs first  — provide a clock source for the VOSYS clock gates.
 *   2. vosys_clk_enable() — open the gates (PLLs now drive VOSYS domain).
 *   3. delay 1 ms  — allow the DC8200 APB to clock up and stabilise.
 *   4. Only THEN access DC8200 MMIO (inside dc8200_init).
 *
 * For warm boot the VOSYS domain is already running, so step 1 is skipped and
 * reading dc[0x1400/4] is safe.
 *
 * ---- Magic cookie lifecycle ---------------------------------------------------
 *
 * scratch[22] = 0xDEADBEEF  \  Written at the END of a successful run.
 * scratch[23] = 0xCAFEF00D  /  After a power-off reset, DDR training overwrites
 *                              DRAM with calibration patterns, so the pair will
 *                              NOT survive a true cold boot (1-in-2^64 chance).
 *
 * ---- Scratch diagnostics (md.l 0x05000000 24) --------------------------------
 *   [0]  0xAA000001 — entered
 *   [1]  0xAA000002 — boot path complete (PLLs/vosys done)
 *   [2]  fb_pa      — framebuffer PA (0x67000000=warm, 0x50000000=cold)
 *   [3]  0xAA000004 — pixels written + dcache flushed
 *   [4]  0xAA000005 — DC8200 init done  (trap handler: 0xDEAD0001 if S-mode fault)
 *   [5]  0xAA000006 — HDMI PHY done     (trap handler: sepc low 32b)
 *   [6]  diag0      — 0x690B0006=all good  (trap handler: sepc high 32b)
 *   [7]  diag1      — 0x0000F300=TX_PHY_LOCK=1
 *   [8]  diag2      — clock/IH probe
 *   [16] FB_PHYS[0] — 0x00FFFFFF=white bar (dcache flush OK)
 *   [17] dc[0x1400] — framebuffer address (should match scratch[2])
 *   [18] dc[0x1CC0] — CONFIG_EX plane 0
 *   [19] dc[0x2510] — BLEND_CONFIG (0x00003548=PIXEL_NONE)
 *   [20] dc[0x1CC4] — CONFIG_EX plane 1 (0=disabled)
 *   [21] cold_boot  — 1=cold, 0=warm
 *   [22] 0xDEADBEEF — warm-boot marker (written last, before spin)
 *   [23] 0xCAFEF00D — warm-boot marker (second word, reduces false-positive risk)
 */

void hdmi_hello_world(void)
{
    volatile uint32_t *scratch = (volatile uint32_t *)0x05000000ULL;
    volatile uint32_t *dc = (volatile uint32_t *)0xFFEF600000ULL;

    /* Cold vs warm boot: detected from DRAM magic cookie (no MMIO read). */
    int cold_boot = (scratch[22] != 0xDEADBEEFU ||
                     scratch[23] != 0xCAFEF00DU);

    scratch[0] = 0xAA000001;
    __asm__ volatile ("fence" ::: "memory");

    uart_puts_bare("\n[hdmi] cold_boot=");
    uart_putc('0' + (cold_boot & 1));
    uart_putc('\n');

    /* Enable VOSYS clocks.
     * Safe on warm boot (no-op).  On cold boot, U-Boot's 16ms splash attempt
     * already enabled VOSYS clocks before giving up on the LCD panel probe,
     * so this write is safe. */
    /* Enable VOSYS clock gates.
     * Print the pixel-clock-divider regs (0x074/0x078) before and after
     * so we can verify U-Boot's setting is preserved. */
    {
        volatile uint32_t *clk = (volatile uint32_t *)0xFFEF528000ULL;
        uart_puts_bare("[hdmi] pre-vosys clk[074]=");
        uart_puthex(clk[0x074/4]);
        uart_puts_bare(" clk[078]=");
        uart_puthex(clk[0x078/4]);
        uart_putc('\n');
    }
    uart_puts_bare("[hdmi] vosys_clk_enable\n");
    vosys_clk_enable();
    delay_us(50000);    /* 50 ms: allow pixel clock PLL to lock after clk[074] write */
    {
        volatile uint32_t *clk = (volatile uint32_t *)0xFFEF528000ULL;
        uart_puts_bare("[hdmi] post-vosys clk[074]=");
        uart_puthex(clk[0x074/4]);
        uart_puts_bare(" clk[078]=");
        uart_puthex(clk[0x078/4]);
        uart_putc('\n');
    }
    uart_puts_bare("[hdmi] vosys done\n");

    /* Framebuffer address. */
    uint32_t fb_pa;
    if (!cold_boot) {
        fb_pa = dc[0x1400/4];
        uart_puts_bare("[hdmi] warm fb_pa=");
        uart_puthex(fb_pa);
        uart_putc('\n');
        if (fb_pa < 0x1000U || fb_pa == 0xFFFFFFFFU)
            fb_pa = FB_ADDR;
    } else {
        fb_pa = FB_ADDR;
        uart_puts_bare("[hdmi] cold fb_pa=");
        uart_puthex(fb_pa);
        uart_putc('\n');
    }
    FB_PHYS = (volatile uint32_t *)(uintptr_t)fb_pa;
    scratch[1] = 0xAA000002;
    scratch[2] = fb_pa;
    scratch[21] = (uint32_t)cold_boot;
    __asm__ volatile ("fence" ::: "memory");

    /* Paint framebuffer. */
    uart_puts_bare("[hdmi] fb_colour_bars\n");
    scratch[24] = 0xAA000003;
    __asm__ volatile ("fence" ::: "memory");
    fb_colour_bars(0, FB_HEIGHT - 1);
    fb_rect(17 * 8 * 5 - 8,        12 * 8 * 5 - 8,
            (18 + 11) * 8 * 5 + 8, (13 + 1) * 8 * 5 + 8,
            RGB(0, 0, 0));
    fb_puts(18, 13, "Hello World", 5,
            RGB(0xFF, 0xFF, 0xFF), RGB(0, 0, 0), 0);
    scratch[25] = 0xAA00003B;
    __asm__ volatile ("fence" ::: "memory");
    uart_puts_bare("[hdmi] fb done\n");

    /* Flush D-cache → DRAM (DC8200 DMA is not cache-coherent). */
    __asm__ volatile (".word 0x0030000B" ::: "memory");  /* th.dcache.ciall */
    __asm__ volatile (".word 0x0190000B" ::: "memory");  /* th.sync.s */
    scratch[3] = 0xAA000004;
    __asm__ volatile ("fence" ::: "memory");
    uart_puts_bare("[hdmi] dcache flushed\n");

    /* DC8200. */
    uart_puts_bare("[hdmi] dc8200_init\n");
    dc8200_init(cold_boot);
    scratch[4] = 0xAA000005;
    __asm__ volatile ("fence" ::: "memory");
    uart_puts_bare("[hdmi] dc8200 done\n");

    /* Wait for DC8200 to start generating the pixel clock.
     * The PHY MPLL needs this reference to lock.  One full 60 Hz frame
     * takes 16.7 ms; wait 30 ms to ensure the clock is stable. */
    delay_us(30000);

    /* DW-HDMI PHY. */
    uart_puts_bare("[hdmi] dw_hdmi_init\n");
    uint32_t diag0, diag1, diag2;
    dw_hdmi_init(&diag0, &diag1, &diag2);
    scratch[5] = 0xAA000006;
    scratch[6] = diag0;
    scratch[7] = diag1;
    scratch[8] = diag2;
    __asm__ volatile ("fence" ::: "memory");
    uart_puts_bare("[hdmi] diag0="); uart_puthex(diag0);
    uart_puts_bare(" diag1="); uart_puthex(diag1);
    uart_puts_bare(" diag2="); uart_puthex(diag2);
    uart_putc('\n');

    /* Register snapshot. */
    scratch[16] = FB_PHYS[0];
    scratch[17] = dc[0x1400/4];
    scratch[18] = dc[0x1CC0/4];
    scratch[19] = dc[0x2510/4];
    scratch[20] = dc[0x1CC4/4];
    __asm__ volatile ("fence" ::: "memory");
    uart_puts_bare("[hdmi] FB[0]="); uart_puthex(scratch[16]);
    uart_puts_bare(" blend="); uart_puthex(scratch[19]);
    uart_putc('\n');

    /* Write magic cookie — marks this as a successful run for next boot. */
    scratch[22] = 0xDEADBEEFU;
    scratch[23] = 0xCAFEF00DU;
    __asm__ volatile ("fence" ::: "memory");

    uart_puts_bare("[hdmi] done. Reset board to return to U-Boot.\n");
    while (1)
        __asm__ volatile ("nop");
}
