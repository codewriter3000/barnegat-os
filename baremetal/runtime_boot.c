#include "runtime.h"

#include <stddef.h>
#include <stdint.h>

#ifndef CALYNDA_BRINGUP_DEBUG
#define CALYNDA_BRINGUP_DEBUG 0
#endif

#define CALYNDA_RT_BOOT_HEAP_CAPACITY (64u * 1024u)

#define TH1520_SCRATCH_BASE 0x05000000ULL
#define TH1520_UART0 0xFFE7014000ULL
#define TH1520_DEBUG_SCRATCH_BASE 0x05001000ULL
#define BOOT_DEBUG_RING_CAPACITY 64u
#define BOOT_DEBUG_BUDGET_LIMIT 256

static unsigned char BOOT_HEAP[CALYNDA_RT_BOOT_HEAP_CAPACITY];
static size_t BOOT_HEAP_USED = 0;
static CalyndaRtNlrSlot BOOT_NLR_SLOTS[CALYNDA_RT_NLR_MAX_DEPTH];
static int BOOT_NLR_DEPTH = -1;
static uint32_t BOOT_DEBUG_INDEX = 0;
static int BOOT_DEBUG_BUDGET = BOOT_DEBUG_BUDGET_LIMIT;

extern CalyndaRtWord calynda_unit___mir_module_init(void);
extern CalyndaRtWord calynda_unit_run(void);

static void frt_scratch_write32(size_t index, uint32_t value) {
#ifdef MACHINE_TH1520
    volatile uint32_t *scratch = (volatile uint32_t *)(uintptr_t)TH1520_SCRATCH_BASE;

    scratch[index] = value;
    __calynda_rt_fence();
#else
    (void)index;
    (void)value;
#endif
}

static void frt_uart_putc(char ch) {
#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    volatile uint32_t *uart = (volatile uint32_t *)(uintptr_t)TH1520_UART0;

    while ((uart[5] & 0x20U) == 0U) {
    }
    uart[0] = (uint32_t)(unsigned char)ch;
#else
    (void)ch;
#endif
}

static void frt_uart_puthex64(uint64_t value) {
#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    static const char HEX[] = "0123456789ABCDEF";
    int shift;

    for (shift = 60; shift >= 0; shift -= 4) {
        frt_uart_putc(HEX[(value >> shift) & 0xFU]);
    }
#else
    (void)value;
#endif
}

static void frt_uart_puthex4(uint32_t value) {
#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    static const char HEX[] = "0123456789ABCDEF";

    frt_uart_putc(HEX[value & 0xFU]);
#else
    (void)value;
#endif
}

static int frt_debug_take_slot(void) {
#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    if (BOOT_DEBUG_BUDGET <= 0) {
        return 0;
    }

    BOOT_DEBUG_BUDGET -= 1;
    return 1;
#else
    return 0;
#endif
}

static void frt_debug_store(CalyndaRtWord tag, CalyndaRtWord value) {
#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    volatile uint64_t *scratch = (volatile uint64_t *)(uintptr_t)TH1520_DEBUG_SCRATCH_BASE;
    uint32_t slot = BOOT_DEBUG_INDEX % BOOT_DEBUG_RING_CAPACITY;

    scratch[slot * 2] = (uint64_t)tag;
    scratch[slot * 2 + 1] = (uint64_t)value;
    BOOT_DEBUG_INDEX = (slot + 1) % BOOT_DEBUG_RING_CAPACITY;
#else
    (void)tag;
    (void)value;
#endif
}

void __calynda_rt_debug_word(CalyndaRtWord tag, CalyndaRtWord value) {
    if (!frt_debug_take_slot()) {
        return;
    }

    frt_debug_store(tag, value);
    frt_uart_putc('D');
    frt_uart_putc((char)tag);
    frt_uart_puthex64((uint64_t)value);
    frt_uart_putc(';');
}

void __calynda_rt_debug_pair(CalyndaRtWord tag,
                             CalyndaRtWord left,
                             CalyndaRtWord right) {
    if (!frt_debug_take_slot()) {
        return;
    }

    frt_debug_store((tag << 8) | (CalyndaRtWord)'L', left);
    frt_debug_store((tag << 8) | (CalyndaRtWord)'R', right);
    frt_uart_putc('P');
    frt_uart_putc((char)tag);
    frt_uart_puthex64((uint64_t)left);
    frt_uart_putc(',');
    frt_uart_puthex64((uint64_t)right);
    frt_uart_putc(';');
}

static _Noreturn void frt_fail(void) {
    uintptr_t caller = (uintptr_t)__builtin_return_address(0);

#ifdef MACHINE_TH1520
    frt_scratch_write32(4u, 0xDEAD0002u);
    frt_scratch_write32(5u, (uint32_t)caller);
    frt_scratch_write32(6u, (uint32_t)(caller >> 32));
#endif

#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    frt_uart_putc('!');
    frt_uart_puthex64((uint64_t)caller);
#else
    (void)caller;
#endif
    __builtin_trap();
    for (;;) {
    }
}

CalyndaRtWord __calynda_rt_boot_probe_c(void) {
    CalyndaRtWord result;

#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    frt_scratch_write32(12u, 0xAAFE0001u);
#endif

#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    frt_uart_putc('F');
#endif
    calynda_unit___mir_module_init();

#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    frt_scratch_write32(13u, 0xAAFE0002u);
    frt_scratch_write32(14u, 0xAAFE0003u);
#endif

#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    frt_uart_putc('G');
#endif
    result = calynda_unit_run();

#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    frt_scratch_write32(15u, 0xAAFE0004u);
#endif

#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    frt_uart_putc('H');
#endif
    return result;
}

static size_t frt_align_up(size_t value, size_t alignment) {
    size_t mask = alignment - 1;

    return (value + mask) & ~mask;
}

static void *frt_alloc_bytes(size_t size) {
    size_t aligned_size = frt_align_up(size == 0 ? 1 : size, sizeof(CalyndaRtWord));
    size_t offset = frt_align_up(BOOT_HEAP_USED, sizeof(CalyndaRtWord));
    size_t i;
    unsigned char *memory;

    if (offset > sizeof(BOOT_HEAP) || aligned_size > sizeof(BOOT_HEAP) - offset) {
        frt_fail();
    }

    memory = &BOOT_HEAP[offset];
    BOOT_HEAP_USED = offset + aligned_size;
    for (i = 0; i < aligned_size; i++) {
        memory[i] = 0;
    }
    return memory;
}

static CalyndaRtWord frt_word_from_signed(long long value) {
    return (CalyndaRtWord)(int64_t)value;
}

static long long frt_signed_from_word(CalyndaRtWord value) {
    return (long long)(int64_t)value;
}

static const CalyndaRtObjectHeader *frt_as_object(CalyndaRtWord word) {
    const CalyndaRtObjectHeader *header = (const CalyndaRtObjectHeader *)(uintptr_t)word;

    if (!header || header->magic != CALYNDA_RT_OBJECT_MAGIC) {
        return NULL;
    }
    return header;
}

void __calynda_rt_debug_object(CalyndaRtWord tag, CalyndaRtWord value) {
    const CalyndaRtObjectHeader *header;

    if (!frt_debug_take_slot()) {
        return;
    }

    header = frt_as_object(value);
    frt_debug_store(tag, value);
    frt_uart_putc('O');
    frt_uart_putc((char)tag);
    if (!header) {
        frt_uart_putc('V');
        frt_uart_puthex64((uint64_t)value);
        frt_uart_putc(';');
        return;
    }

    frt_uart_putc('K');
    frt_uart_puthex64((uint64_t)header->kind);
    frt_uart_putc('V');
    frt_uart_puthex64((uint64_t)value);
    frt_uart_putc(';');
}

static const CalyndaRtArray *frt_require_array(CalyndaRtWord target) {
    const CalyndaRtObjectHeader *header = frt_as_object(target);

    if (!header || header->kind != CALYNDA_RT_OBJECT_ARRAY) {
        frt_fail();
    }
    return (const CalyndaRtArray *)(const void *)header;
}

static CalyndaRtArray *frt_require_mut_array(CalyndaRtWord target) {
    return (CalyndaRtArray *)(void *)frt_require_array(target);
}

static int frt_is_boot_heap_word(CalyndaRtWord value);

static const CalyndaRtObjectHeader *frt_require_string(CalyndaRtWord target) {
    const CalyndaRtObjectHeader *header = frt_as_object(target);

    if (!header || header->kind != CALYNDA_RT_OBJECT_STRING) {
        frt_fail();
    }
    return header;
}

typedef struct {
    CalyndaRtObjectHeader header;
    uintptr_t             reserved;
    size_t                count;
    CalyndaRtWord        *elements;
} CalyndaRtStaticArray;

typedef struct {
    CalyndaRtObjectHeader header;
    uintptr_t             reserved;
    size_t                length;
    char                 *bytes;
} CalyndaRtStaticString;

static int frt_array_is_dynamic(const CalyndaRtObjectHeader *header) {
    return frt_is_boot_heap_word((CalyndaRtWord)(uintptr_t)header);
}

static int frt_string_is_dynamic(const CalyndaRtObjectHeader *header) {
    return frt_is_boot_heap_word((CalyndaRtWord)(uintptr_t)header);
}

static size_t frt_string_length(const CalyndaRtObjectHeader *header) {
    if (frt_string_is_dynamic(header)) {
        return ((const CalyndaRtString *)(const void *)header)->length;
    }

    return ((const CalyndaRtStaticString *)(const void *)header)->length;
}

static const char *frt_string_bytes(const CalyndaRtObjectHeader *header) {
    if (frt_string_is_dynamic(header)) {
        return ((const CalyndaRtString *)(const void *)header)->bytes;
    }

    return ((const CalyndaRtStaticString *)(const void *)header)->bytes;
}

static size_t frt_array_count(const CalyndaRtObjectHeader *header) {
    if (frt_array_is_dynamic(header)) {
        return ((const CalyndaRtArray *)(const void *)header)->count;
    }

    return ((const CalyndaRtStaticArray *)(const void *)header)->count;
}

static const CalyndaRtWord *frt_array_elements(const CalyndaRtObjectHeader *header) {
    if (frt_array_is_dynamic(header)) {
        return ((const CalyndaRtArray *)(const void *)header)->elements;
    }

    return ((const CalyndaRtStaticArray *)(const void *)header)->elements;
}

static CalyndaRtWord *frt_array_elements_mut(const CalyndaRtObjectHeader *header) {
    if (!frt_array_is_dynamic(header)) {
        frt_fail();
    }

    return ((CalyndaRtArray *)(void *)header)->elements;
}

static CalyndaRtArray *frt_new_array(size_t count, const CalyndaRtWord *elements);
static CalyndaRtHeteroArray *frt_new_hetero_array(const CalyndaRtTypeDescriptor *type_desc,
                                                  size_t count,
                                                  const CalyndaRtWord *elements);

CalyndaRtWord __calynda_rt_cast_value(CalyndaRtWord source,
                                      CalyndaRtTypeTag target_type_tag) {
    const CalyndaRtObjectHeader *header;

    switch (target_type_tag) {
    case CALYNDA_RT_TYPE_VOID:
        return 0;
    case CALYNDA_RT_TYPE_BOOL:
        return source ? (CalyndaRtWord)1 : (CalyndaRtWord)0;
    case CALYNDA_RT_TYPE_INT32:
        return (CalyndaRtWord)(int64_t)(int32_t)source;
    case CALYNDA_RT_TYPE_INT64:
    case CALYNDA_RT_TYPE_RAW_WORD:
        return source;
    case CALYNDA_RT_TYPE_STRING:
        header = frt_as_object(source);
        if (!header || header->kind != CALYNDA_RT_OBJECT_STRING) {
            frt_fail();
        }
        return source;
    case CALYNDA_RT_TYPE_ARRAY:
        header = frt_as_object(source);
        if (!header || header->kind != CALYNDA_RT_OBJECT_ARRAY) {
            frt_fail();
        }
        return source;
    case CALYNDA_RT_TYPE_CLOSURE:
        header = frt_as_object(source);
        if (!header || header->kind != CALYNDA_RT_OBJECT_CLOSURE) {
            frt_fail();
        }
        return source;
    case CALYNDA_RT_TYPE_EXTERNAL:
        header = frt_as_object(source);
        if (!header || (header->kind != CALYNDA_RT_OBJECT_PACKAGE &&
                        header->kind != CALYNDA_RT_OBJECT_EXTERN_CALLABLE)) {
            frt_fail();
        }
        return source;
    case CALYNDA_RT_TYPE_UNION:
        header = frt_as_object(source);
        if (!header || header->kind != CALYNDA_RT_OBJECT_UNION) {
            frt_fail();
        }
        return source;
    case CALYNDA_RT_TYPE_HETERO_ARRAY:
        header = frt_as_object(source);
        if (!header || header->kind != CALYNDA_RT_OBJECT_HETERO_ARRAY) {
            frt_fail();
        }
        return source;
    default:
        frt_fail();
    }
}

static char *frt_copy_bytes(const char *source, size_t length) {
    char *bytes = (char *)frt_alloc_bytes(length + 1);
    size_t i;

    for (i = 0; i < length; i++) {
        bytes[i] = source[i];
    }
    bytes[length] = '\0';
    return bytes;
}

static CalyndaRtWord *frt_copy_words(const CalyndaRtWord *source, size_t count) {
    CalyndaRtWord *copy;
    size_t i;

    if (count == 0) {
        return NULL;
    }

    copy = (CalyndaRtWord *)frt_alloc_bytes(count * sizeof(*copy));
    for (i = 0; i < count; i++) {
        copy[i] = source[i];
    }
    return copy;
}

static CalyndaRtWord frt_load_bytes(const unsigned char *source, size_t size) {
    CalyndaRtWord result = 0;
    unsigned char *result_bytes = (unsigned char *)&result;
    size_t i;

    for (i = 0; i < size && i < sizeof(result); i++) {
        result_bytes[i] = source[i];
    }

    return result;
}

static void frt_store_bytes(unsigned char *target,
                            CalyndaRtWord value,
                            size_t size) {
    const unsigned char *value_bytes = (const unsigned char *)&value;
    size_t i;

    for (i = 0; i < size && i < sizeof(value); i++) {
        target[i] = value_bytes[i];
    }
}

static CalyndaRtWord frt_mmio_load_bytes(const volatile unsigned char *source,
                                         size_t size) {
    CalyndaRtWord result = 0;
    unsigned char *result_bytes = (unsigned char *)&result;
    size_t i;

    switch (size) {
    case 1:
        return (CalyndaRtWord)*(const volatile uint8_t *)(const volatile void *)source;
    case 2:
        return (CalyndaRtWord)*(const volatile uint16_t *)(const volatile void *)source;
    case 4:
        return (CalyndaRtWord)*(const volatile uint32_t *)(const volatile void *)source;
    case 8:
        return (CalyndaRtWord)*(const volatile uint64_t *)(const volatile void *)source;
    default:
        break;
    }

    for (i = 0; i < size && i < sizeof(result); i++) {
        result_bytes[i] = source[i];
    }

    return result;
}

static void frt_mmio_store_bytes(volatile unsigned char *target,
                                 CalyndaRtWord value,
                                 size_t size) {
    const unsigned char *value_bytes = (const unsigned char *)&value;
    size_t i;

    switch (size) {
    case 1:
        *(volatile uint8_t *)(volatile void *)target = (uint8_t)value;
        return;
    case 2:
        *(volatile uint16_t *)(volatile void *)target = (uint16_t)value;
        return;
    case 4:
        *(volatile uint32_t *)(volatile void *)target = (uint32_t)value;
        return;
    case 8:
        *(volatile uint64_t *)(volatile void *)target = (uint64_t)value;
        return;
    default:
        break;
    }

    for (i = 0; i < size && i < sizeof(value); i++) {
        target[i] = value_bytes[i];
    }
}

#ifdef MACHINE_TH1520
#define FRT_FB_BASE 0x04200000ULL
#define FRT_FB_BACK_BUFFER_BASE 0x04A00000ULL
#define FRT_FB_WIDTH 1920
#define FRT_FB_HEIGHT 1080
#define FRT_FB_SIZE_BYTES 0x007E9000ULL
#define FRT_THEAD_CMO_STRIDE 32ULL
#define FRT_SCREEN_OBJECT_KIND_RECT 0
#define FRT_SCREEN_OBJECT_KIND_TEXT 1
#define FRT_SCREEN_TEXT_SCALE 4
#define FRT_SCREEN_TEXT_CHAR_ADVANCE 24
#define FRT_SCREEN_TEXT_HEIGHT 32

typedef struct {
    int32_t  x;
    int32_t  y;
    int32_t  width;
    int32_t  height;
    int32_t  vx;
    int32_t  vy;
    uint32_t color;
} FrtScreenDemoObject;

typedef struct {
    int32_t x0;
    int32_t y0;
    int32_t x1;
    int32_t y1;
} FrtDirtyRect;

typedef struct {
    int32_t      kind;
    int32_t      x;
    int32_t      y;
    int32_t      width;
    int32_t      height;
    int32_t      vx;
    int32_t      vy;
    uint32_t     color;
    CalyndaRtWord payload;
} FrtScreenObject;

static void frt_fb_rect_to(uint64_t base,
                           int32_t x0,
                           int32_t y0,
                           int32_t x1,
                           int32_t y1,
                           uint32_t color) {
    volatile uint32_t *fb = (volatile uint32_t *)(uintptr_t)base;
    int32_t y;

    for (y = y0; y <= y1; y += 1) {
        int32_t x;
        volatile uint32_t *row = fb + (size_t)y * FRT_FB_WIDTH;

        for (x = x0; x <= x1; x += 1) {
            row[x] = color;
        }
    }
}

static void frt_fb_rect(int32_t x0,
                        int32_t y0,
                        int32_t x1,
                        int32_t y1,
                        uint32_t color) {
    frt_fb_rect_to(FRT_FB_BASE, x0, y0, x1, y1, color);
}

static void frt_fb_fill_to(uint64_t base, uint32_t color) {
    frt_fb_rect_to(base, 0, 0, FRT_FB_WIDTH - 1, FRT_FB_HEIGHT - 1, color);
}

static void frt_fb_copy_rect(uint64_t dst_base,
                             uint64_t src_base,
                             int32_t x0,
                             int32_t y0,
                             int32_t x1,
                             int32_t y1) {
    volatile uint32_t *dst = (volatile uint32_t *)(uintptr_t)dst_base;
    volatile uint32_t *src = (volatile uint32_t *)(uintptr_t)src_base;
    int32_t y;

    for (y = y0; y <= y1; y += 1) {
        int32_t x;
        volatile uint32_t *dst_row = dst + (size_t)y * FRT_FB_WIDTH;
        volatile uint32_t *src_row = src + (size_t)y * FRT_FB_WIDTH;

        for (x = x0; x <= x1; x += 1) {
            dst_row[x] = src_row[x];
        }
    }
}

static void frt_fb_border(int32_t x0,
                          int32_t y0,
                          int32_t x1,
                          int32_t y1,
                          uint32_t color,
                          int32_t thick) {
    frt_fb_rect(x0, y0, x1, y0 + thick - 1, color);
    frt_fb_rect(x0, y1 - thick + 1, x1, y1, color);
    frt_fb_rect(x0, y0, x0 + thick - 1, y1, color);
    frt_fb_rect(x1 - thick + 1, y0, x1, y1, color);
}

static void frt_fb_draw_row_markers(int32_t x0,
                                    int32_t x1,
                                    int32_t y0,
                                    int32_t row) {
    int32_t marker;

    for (marker = 0; marker <= row; marker += 1) {
        int32_t my = y0 + 18 + marker * 16;

        frt_fb_rect(x0 + 18, my, x1 - 18, my + 7, 0);
    }
}

static void frt_fb_draw_col_markers(int32_t x0,
                                    int32_t y0,
                                    int32_t y1,
                                    int32_t col) {
    int32_t marker;

    for (marker = 0; marker <= col; marker += 1) {
        int32_t mx = x0 + 18 + marker * 16;

        frt_fb_rect(mx, y0 + 72, mx + 7, y1 - 18, 0);
    }
}

static void frt_cache_clean_range(uint64_t start_addr, uint64_t size) {
    uint64_t line = start_addr & ~(FRT_THEAD_CMO_STRIDE - 1u);
    uint64_t end = start_addr + size;

    while (line < end) {
        __calynda_rt_cache_clean((CalyndaRtWord)line);
        line += FRT_THEAD_CMO_STRIDE;
    }

    __calynda_rt_cache_final();
}

static void frt_cache_clean_rect(uint64_t base,
                                 int32_t x0,
                                 int32_t y0,
                                 int32_t x1,
                                 int32_t y1) {
    int32_t y;

    for (y = y0; y <= y1; y += 1) {
        uint64_t start = base + (((uint64_t)(uint32_t)y * (uint64_t)FRT_FB_WIDTH) + (uint64_t)(uint32_t)x0) * sizeof(uint32_t);
        uint64_t size = (uint64_t)(uint32_t)(x1 - x0 + 1) * sizeof(uint32_t);

        frt_cache_clean_range(start, size);
    }
}

static void frt_delay_us(uint32_t us) {
    volatile uint32_t ticks = us * 1000u;

    while (ticks != 0u) {
        ticks -= 1u;
        __asm__ volatile("nop");
    }
}

static int32_t frt_min_i32(int32_t left, int32_t right) {
    return left < right ? left : right;
}

static int32_t frt_max_i32(int32_t left, int32_t right) {
    return left > right ? left : right;
}

static void frt_screen_demo_unpack(CalyndaRtWord object_word,
                                   FrtScreenDemoObject *object) {
    const CalyndaRtObjectHeader *header = frt_as_object(object_word);
    const CalyndaRtWord *elements;

    if (!header || header->kind != CALYNDA_RT_OBJECT_ARRAY || frt_array_count(header) < 8u) {
        frt_fail();
    }

    elements = frt_array_elements(header);
    object->x = (int32_t)frt_signed_from_word(elements[1]);
    object->y = (int32_t)frt_signed_from_word(elements[2]);
    object->width = (int32_t)frt_signed_from_word(elements[3]);
    object->height = (int32_t)frt_signed_from_word(elements[4]);
    object->vx = (int32_t)frt_signed_from_word(elements[5]);
    object->vy = (int32_t)frt_signed_from_word(elements[6]);
    object->color = (uint32_t)elements[7];
}

static void frt_screen_demo_draw_to(uint64_t base,
                                    const FrtScreenDemoObject *object,
                                    uint32_t color) {
    frt_fb_rect_to(base,
                   object->x,
                   object->y,
                   object->x + object->width - 1,
                   object->y + object->height - 1,
                   color);
}

static void frt_screen_demo_draw(const FrtScreenDemoObject *object,
                                 uint32_t color) {
    frt_screen_demo_draw_to(FRT_FB_BASE, object, color);
}

static void frt_screen_demo_step(FrtScreenDemoObject *object) {
    int32_t max_x = FRT_FB_WIDTH - object->width;
    int32_t max_y = FRT_FB_HEIGHT - object->height;
    int32_t next_x = object->x + object->vx;
    int32_t next_y = object->y + object->vy;

    if (next_x < 0 || next_x > max_x) {
        object->vx = -object->vx;
        next_x = object->x + object->vx;
    }
    if (next_y < 0 || next_y > max_y) {
        object->vy = -object->vy;
        next_y = object->y + object->vy;
    }

    if (next_x < 0) {
        next_x = 0;
    }
    if (next_x > max_x) {
        next_x = max_x;
    }
    if (next_y < 0) {
        next_y = 0;
    }
    if (next_y > max_y) {
        next_y = max_y;
    }

    object->x = next_x;
    object->y = next_y;
}

static void frt_screen_demo_copy(FrtScreenDemoObject *dst,
                                 const FrtScreenDemoObject *src) {
    dst->x = src->x;
    dst->y = src->y;
    dst->width = src->width;
    dst->height = src->height;
    dst->vx = src->vx;
    dst->vy = src->vy;
    dst->color = src->color;
}

static void frt_screen_demo_dirty_rect(const FrtScreenDemoObject *before,
                                       const FrtScreenDemoObject *after,
                                       FrtDirtyRect *dirty) {
    dirty->x0 = frt_min_i32(before->x, after->x);
    dirty->y0 = frt_min_i32(before->y, after->y);
    dirty->x1 = frt_max_i32(before->x + before->width - 1,
                            after->x + after->width - 1);
    dirty->y1 = frt_max_i32(before->y + before->height - 1,
                            after->y + after->height - 1);
}

static void frt_screen_demo_present_dirty(const FrtDirtyRect *dirty) {
    frt_fb_copy_rect(FRT_FB_BASE,
                     FRT_FB_BACK_BUFFER_BASE,
                     dirty->x0,
                     dirty->y0,
                     dirty->x1,
                     dirty->y1);
    frt_cache_clean_rect(FRT_FB_BASE,
                         dirty->x0,
                         dirty->y0,
                         dirty->x1,
                         dirty->y1);
}

static void frt_screen_draw_text_to(uint64_t base,
                                    int32_t x,
                                    int32_t y,
                                    const CalyndaRtObjectHeader *text,
                                    uint32_t color);
static void frt_screen_object_unpack(CalyndaRtWord object_word,
                                     FrtScreenObject *object);
void __calynda_rt_screen_demo_hold(CalyndaRtWord scene_word);

static void frt_screen_draw_object_to(uint64_t base,
                                      const FrtScreenObject *object) {
    if (object->kind == FRT_SCREEN_OBJECT_KIND_RECT) {
        frt_fb_rect_to(base,
                       object->x,
                       object->y,
                       object->x + object->width - 1,
                       object->y + object->height - 1,
                       object->color);
        return;
    }
    if (object->kind == FRT_SCREEN_OBJECT_KIND_TEXT) {
        frt_screen_draw_text_to(base,
                                object->x,
                                object->y,
                                frt_require_string(object->payload),
                                object->color);
    }
}

static void frt_screen_clear_object_to(uint64_t base,
                                       const FrtScreenObject *object,
                                       uint32_t color) {
    frt_fb_rect_to(base,
                   object->x,
                   object->y,
                   object->x + object->width - 1,
                   object->y + object->height - 1,
                   color);
}

static void frt_screen_object_step(FrtScreenObject *object) {
    int32_t max_x = FRT_FB_WIDTH - object->width;
    int32_t max_y = FRT_FB_HEIGHT - object->height;
    int32_t next_x = object->x + object->vx;
    int32_t next_y = object->y + object->vy;

    if (next_x < 0 || next_x > max_x) {
        object->vx = -object->vx;
        next_x = object->x + object->vx;
    }
    if (next_y < 0 || next_y > max_y) {
        object->vy = -object->vy;
        next_y = object->y + object->vy;
    }

    if (next_x < 0) {
        next_x = 0;
    }
    if (next_x > max_x) {
        next_x = max_x;
    }
    if (next_y < 0) {
        next_y = 0;
    }
    if (next_y > max_y) {
        next_y = max_y;
    }

    object->x = next_x;
    object->y = next_y;
}

static void frt_screen_object_copy(FrtScreenObject *dst,
                                   const FrtScreenObject *src) {
    dst->kind = src->kind;
    dst->x = src->x;
    dst->y = src->y;
    dst->width = src->width;
    dst->height = src->height;
    dst->vx = src->vx;
    dst->vy = src->vy;
    dst->color = src->color;
    dst->payload = src->payload;
}

static size_t frt_screen_scene_count(const CalyndaRtObjectHeader *header) {
    if (!header) {
        frt_fail();
    }
    if (header->kind == CALYNDA_RT_OBJECT_ARRAY) {
        return frt_array_count(header);
    }
    if (header->kind == CALYNDA_RT_OBJECT_HETERO_ARRAY) {
        return ((const CalyndaRtHeteroArray *)(const void *)header)->count;
    }
    frt_fail();
}

static const CalyndaRtWord *frt_screen_scene_elements(const CalyndaRtObjectHeader *header) {
    if (!header) {
        frt_fail();
    }
    if (header->kind == CALYNDA_RT_OBJECT_ARRAY) {
        return frt_array_elements(header);
    }
    if (header->kind == CALYNDA_RT_OBJECT_HETERO_ARRAY) {
        return ((const CalyndaRtHeteroArray *)(const void *)header)->elements;
    }
    frt_fail();
}

static int frt_screen_scene_word_is_object(CalyndaRtWord word) {
    const CalyndaRtObjectHeader *header = frt_as_object(word);
    size_t count;
    const CalyndaRtWord *elements;

    if (!header) {
        return 0;
    }

    if (header->kind != CALYNDA_RT_OBJECT_ARRAY &&
        header->kind != CALYNDA_RT_OBJECT_HETERO_ARRAY) {
        return 0;
    }

    count = frt_screen_scene_count(header);
    if (count < 8u) {
        return 0;
    }

    elements = frt_screen_scene_elements(header);
    return frt_as_object(elements[0]) == NULL;
}

static size_t frt_screen_scene_total_count_from_word(CalyndaRtWord word) {
    const CalyndaRtObjectHeader *header = frt_as_object(word);
    const CalyndaRtWord *elements;
    size_t count;
    size_t index;
    size_t total = 0;

    if (!header) {
        frt_fail();
    }

    if (frt_screen_scene_word_is_object(word)) {
        return 1u;
    }

    count = frt_screen_scene_count(header);
    elements = frt_screen_scene_elements(header);
    for (index = 0; index < count; index += 1) {
        total += frt_screen_scene_total_count_from_word(elements[index]);
    }
    return total;
}

static size_t frt_screen_scene_unpack_from_word(CalyndaRtWord word,
                                                FrtScreenObject *objects,
                                                size_t object_index) {
    const CalyndaRtObjectHeader *header = frt_as_object(word);
    const CalyndaRtWord *elements;
    size_t count;
    size_t index;

    if (!header) {
        frt_fail();
    }

    if (frt_screen_scene_word_is_object(word)) {
        frt_screen_object_unpack(word, &objects[object_index]);
        return object_index + 1u;
    }

    count = frt_screen_scene_count(header);
    elements = frt_screen_scene_elements(header);
    for (index = 0; index < count; index += 1) {
        object_index = frt_screen_scene_unpack_from_word(elements[index],
                                                         objects,
                                                         object_index);
    }
    return object_index;
}

static void frt_screen_object_dirty_rect(const FrtScreenObject *before,
                                         const FrtScreenObject *after,
                                         FrtDirtyRect *dirty) {
    dirty->x0 = frt_min_i32(before->x, after->x);
    dirty->y0 = frt_min_i32(before->y, after->y);
    dirty->x1 = frt_max_i32(before->x + before->width - 1,
                            after->x + after->width - 1);
    dirty->y1 = frt_max_i32(before->y + before->height - 1,
                            after->y + after->height - 1);
}

static void frt_screen_demo_present_full(void) {
    frt_fb_copy_rect(FRT_FB_BASE,
                     FRT_FB_BACK_BUFFER_BASE,
                     0,
                     0,
                     FRT_FB_WIDTH - 1,
                     FRT_FB_HEIGHT - 1);
    frt_cache_clean_range(FRT_FB_BASE, FRT_FB_SIZE_BYTES);
}

void __calynda_rt_screen_demo_hold(CalyndaRtWord scene_word) {
    static const uint32_t BACKGROUND = 0x0010141Cu;
    static const uint32_t FRAME_DELAY_US = 833u; // 2500 = 20 FPS
    size_t count = frt_screen_scene_total_count_from_word(scene_word);
    FrtScreenObject *objects = (FrtScreenObject *)frt_alloc_bytes(count * sizeof(*objects));
    FrtScreenObject *previous = (FrtScreenObject *)frt_alloc_bytes(count * sizeof(*previous));
    FrtDirtyRect *dirty = (FrtDirtyRect *)frt_alloc_bytes(count * sizeof(*dirty));
    size_t index;

    frt_screen_scene_unpack_from_word(scene_word, objects, 0u);

    frt_fb_fill_to(FRT_FB_BACK_BUFFER_BASE, BACKGROUND);
    for (index = 0; index < count; index += 1) {
        frt_screen_draw_object_to(FRT_FB_BACK_BUFFER_BASE, &objects[index]);
    }
    frt_screen_demo_present_full();

    for (;;) {
        for (index = 0; index < count; index += 1) {
            frt_screen_object_copy(&previous[index], &objects[index]);
            frt_screen_clear_object_to(FRT_FB_BACK_BUFFER_BASE, &previous[index], BACKGROUND);
        }

        for (index = 0; index < count; index += 1) {
            frt_screen_object_step(&objects[index]);
            frt_screen_draw_object_to(FRT_FB_BACK_BUFFER_BASE, &objects[index]);
            frt_screen_object_dirty_rect(&previous[index], &objects[index], &dirty[index]);
        }

        for (index = 0; index < count; index += 1) {
            frt_screen_demo_present_dirty(&dirty[index]);
        }
        frt_delay_us(FRAME_DELAY_US);
    }
}

static void frt_draw_glyph_to(uint64_t base,
                              int32_t px,
                              int32_t py,
                              const uint8_t glyph[7],
                              int32_t scale,
                              uint32_t color) {
    int32_t row_index;

    for (row_index = 0; row_index < 7; row_index += 1) {
        uint8_t row_bits = glyph[row_index];
        int32_t col_index;

        for (col_index = 0; col_index < 5; col_index += 1) {
            if ((row_bits & (uint8_t)(1u << (4 - col_index))) == 0u) {
                continue;
            }
            frt_fb_rect_to(base,
                           px + col_index * scale,
                           py + row_index * scale,
                           px + (col_index + 1) * scale - 1,
                           py + (row_index + 1) * scale - 1,
                           color);
        }
    }
}

static void frt_draw_probe_glyph(int32_t px,
                                 int32_t py,
                                 const uint8_t glyph[7],
                                 int32_t scale,
                                 uint32_t color) {
    frt_draw_glyph_to(FRT_FB_BASE, px, py, glyph, scale, color);
}
#endif

void __calynda_rt_scratch_mark(CalyndaRtWord index_word, CalyndaRtWord value_word) {
#if defined(MACHINE_TH1520) && CALYNDA_BRINGUP_DEBUG
    uint32_t index = (uint32_t)frt_signed_from_word(index_word);

    frt_scratch_write32((size_t)index, (uint32_t)value_word);
#else
    (void)index_word;
    (void)value_word;
#endif
}

void __calynda_rt_cache_clean_range(CalyndaRtWord start_word, CalyndaRtWord size_word) {
#ifdef MACHINE_TH1520
    frt_cache_clean_range((uint64_t)start_word, (uint64_t)size_word);
#else
    (void)start_word;
    (void)size_word;
#endif
}

void __calynda_rt_hdmi_program_identity_csc(void) {
#ifdef MACHINE_TH1520
    volatile uint32_t *h = (volatile uint32_t *)(uintptr_t)0xFFEF540000ULL;
    static const uint16_t csc[3][4] = {
        {0x2000, 0x0000, 0x0000, 0x0000},
        {0x0000, 0x2000, 0x0000, 0x0000},
        {0x0000, 0x0000, 0x2000, 0x0000},
    };
    static const uint16_t msb_base[3] = {0x4102, 0x410A, 0x4112};
    static const uint16_t lsb_base[3] = {0x4103, 0x410B, 0x4113};
    int row;

    for (row = 0; row < 3; row += 1) {
        int col;

        for (col = 0; col < 4; col += 1) {
            uint16_t coeff = csc[row][col];

            h[msb_base[row] + col * 2] = (uint32_t)((coeff >> 8) & 0xFFu);
            h[lsb_base[row] + col * 2] = (uint32_t)(coeff & 0xFFu);
        }
    }

    h[0x4100] = 0x00u;
    h[0x4101] = 0x01u;
    h[0x4004] = 0x00u;
    __calynda_rt_fence();
#endif
}

void __calynda_rt_hdmi_clear_overflow(void) {
#ifdef MACHINE_TH1520
    volatile uint32_t *h = (volatile uint32_t *)(uintptr_t)0xFFEF540000ULL;
    uint32_t invidconf = h[0x1000] & 0xFFu;
    int index;

    h[0x4002] = 0xFDu;
    __calynda_rt_fence();
    for (index = 0; index < 4; index += 1) {
        h[0x1000] = invidconf;
    }
    h[0x4002] = 0xFFu;
    __calynda_rt_fence();
#endif
}

static const uint8_t *frt_screen_text_glyph(unsigned char ch) {
#ifdef MACHINE_TH1520
    static const uint8_t LETTERS[26][7] = {
        {0x0E, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11},
        {0x1E, 0x11, 0x11, 0x1E, 0x11, 0x11, 0x1E},
        {0x0F, 0x10, 0x10, 0x10, 0x10, 0x10, 0x0F},
        {0x1E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x1E},
        {0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x1F},
        {0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x10},
        {0x0F, 0x10, 0x10, 0x17, 0x11, 0x11, 0x0F},
        {0x11, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11},
        {0x0E, 0x04, 0x04, 0x04, 0x04, 0x04, 0x0E},
        {0x01, 0x01, 0x01, 0x01, 0x11, 0x11, 0x0E},
        {0x11, 0x12, 0x14, 0x18, 0x14, 0x12, 0x11},
        {0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x1F},
        {0x11, 0x1B, 0x15, 0x15, 0x11, 0x11, 0x11},
        {0x11, 0x11, 0x19, 0x15, 0x13, 0x11, 0x11},
        {0x0E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E},
        {0x1E, 0x11, 0x11, 0x1E, 0x10, 0x10, 0x10},
        {0x0E, 0x11, 0x11, 0x11, 0x15, 0x12, 0x0D},
        {0x1E, 0x11, 0x11, 0x1E, 0x14, 0x12, 0x11},
        {0x0F, 0x10, 0x10, 0x0E, 0x01, 0x01, 0x1E},
        {0x1F, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04},
        {0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E},
        {0x11, 0x11, 0x11, 0x11, 0x11, 0x0A, 0x04},
        {0x11, 0x11, 0x11, 0x15, 0x15, 0x15, 0x0A},
        {0x11, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x11},
        {0x11, 0x11, 0x0A, 0x04, 0x04, 0x04, 0x04},
        {0x1F, 0x01, 0x02, 0x04, 0x08, 0x10, 0x1F},
    };
    static const uint8_t DIGITS[10][7] = {
        {0x0E, 0x11, 0x13, 0x15, 0x19, 0x11, 0x0E},
        {0x04, 0x0C, 0x04, 0x04, 0x04, 0x04, 0x0E},
        {0x0E, 0x11, 0x01, 0x02, 0x04, 0x08, 0x1F},
        {0x1E, 0x01, 0x01, 0x0E, 0x01, 0x01, 0x1E},
        {0x02, 0x06, 0x0A, 0x12, 0x1F, 0x02, 0x02},
        {0x1F, 0x10, 0x10, 0x1E, 0x01, 0x01, 0x1E},
        {0x0E, 0x10, 0x10, 0x1E, 0x11, 0x11, 0x0E},
        {0x1F, 0x01, 0x02, 0x04, 0x08, 0x08, 0x08},
        {0x0E, 0x11, 0x11, 0x0E, 0x11, 0x11, 0x0E},
        {0x0E, 0x11, 0x11, 0x0F, 0x01, 0x01, 0x0E},
    };
    static const uint8_t SPACE[7] = {0, 0, 0, 0, 0, 0, 0};
    static const uint8_t QUESTION[7] = {0x0E, 0x11, 0x01, 0x02, 0x04, 0x00, 0x04};
    static const uint8_t EXCLAMATION[7] = {0x04, 0x04, 0x04, 0x04, 0x04, 0x00, 0x04};
    static const uint8_t PERIOD[7] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C};
    static const uint8_t COMMA[7] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x08};
    static const uint8_t COLON[7] = {0x00, 0x0C, 0x0C, 0x00, 0x0C, 0x0C, 0x00};
    static const uint8_t SEMICOLON[7] = {0x00, 0x0C, 0x0C, 0x00, 0x0C, 0x08, 0x00};
    static const uint8_t DASH[7] = {0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00};
    static const uint8_t PLUS[7] = {0x00, 0x04, 0x04, 0x1F, 0x04, 0x04, 0x00};
    static const uint8_t SLASH[7] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x00, 0x00};
    static const uint8_t LPAREN[7] = {0x02, 0x04, 0x08, 0x08, 0x08, 0x04, 0x02};
    static const uint8_t RPAREN[7] = {0x08, 0x04, 0x02, 0x02, 0x02, 0x04, 0x08};
    static const uint8_t UNDERSCORE[7] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F};

    if (ch >= 'a' && ch <= 'z') {
        ch = (unsigned char)(ch - ('a' - 'A'));
    }
    if (ch >= 'A' && ch <= 'Z') {
        return LETTERS[ch - 'A'];
    }
    if (ch >= '0' && ch <= '9') {
        return DIGITS[ch - '0'];
    }

    switch (ch) {
    case ' ':
        return SPACE;
    case '!':
        return EXCLAMATION;
    case '.':
        return PERIOD;
    case ',':
        return COMMA;
    case ':':
        return COLON;
    case ';':
        return SEMICOLON;
    case '-':
        return DASH;
    case '+':
        return PLUS;
    case '/':
        return SLASH;
    case '(':
        return LPAREN;
    case ')':
        return RPAREN;
    case '_':
        return UNDERSCORE;
    default:
        return QUESTION;
    }
#else
    (void)ch;
    return NULL;
#endif
}

static void frt_screen_draw_text_to(uint64_t base,
                                    int32_t x,
                                    int32_t y,
                                    const CalyndaRtObjectHeader *text,
                                    uint32_t color) {
#ifdef MACHINE_TH1520
    const char *bytes;
    size_t length;
    size_t index;

    if (!text) {
        return;
    }

    length = frt_string_length(text);
    bytes = frt_string_bytes(text);

    for (index = 0; index < length; index += 1) {
        const uint8_t *glyph = frt_screen_text_glyph((unsigned char)bytes[index]);

        if (!glyph) {
            continue;
        }

        frt_draw_glyph_to(base,
                          x + (int32_t)index * FRT_SCREEN_TEXT_CHAR_ADVANCE,
                          y + 2,
                          glyph,
                          FRT_SCREEN_TEXT_SCALE,
                          color);
    }
#else
    (void)base;
    (void)x;
    (void)y;
    (void)text;
    (void)color;
#endif
}

static void frt_screen_object_unpack(CalyndaRtWord object_word,
                                     FrtScreenObject *object) {
    const CalyndaRtObjectHeader *header = frt_as_object(object_word);
    const CalyndaRtWord *elements;
    size_t count;

    if (!header || header->kind != CALYNDA_RT_OBJECT_ARRAY) {
        frt_fail();
    }

    count = frt_array_count(header);
    if (count < 8u) {
        frt_fail();
    }

    elements = frt_array_elements(header);
    object->kind = (int32_t)frt_signed_from_word(elements[0]);
    object->x = (int32_t)frt_signed_from_word(elements[1]);
    object->y = (int32_t)frt_signed_from_word(elements[2]);
    object->width = (int32_t)frt_signed_from_word(elements[3]);
    object->height = (int32_t)frt_signed_from_word(elements[4]);
    object->vx = (int32_t)frt_signed_from_word(elements[5]);
    object->vy = (int32_t)frt_signed_from_word(elements[6]);
    object->color = (uint32_t)elements[7];
    object->payload = count > 8u ? elements[8] : (CalyndaRtWord)0;
}

void __calynda_rt_screen_draw_object(CalyndaRtWord object_word) {
#ifdef MACHINE_TH1520
    FrtScreenObject object;

    frt_screen_object_unpack(object_word, &object);
    frt_screen_draw_object_to(FRT_FB_BASE, &object);
#else
    (void)object_word;
#endif
}

void __calynda_rt_screen_clear_object(CalyndaRtWord object_word,
                                      CalyndaRtWord color_word) {
#ifdef MACHINE_TH1520
    FrtScreenObject object;

    frt_screen_object_unpack(object_word, &object);
    frt_fb_rect_to(FRT_FB_BASE,
                   object.x,
                   object.y,
                   object.x + object.width - 1,
                   object.y + object.height - 1,
                   (uint32_t)color_word);
#else
    (void)object_word;
    (void)color_word;
#endif
}

CalyndaRtWord __calynda_rt_screen_make_text(CalyndaRtWord x_word,
                                           CalyndaRtWord y_word,
                                           CalyndaRtWord vx_word,
                                           CalyndaRtWord vy_word,
                                           CalyndaRtWord color_word,
                                           CalyndaRtWord text_word) {
    const CalyndaRtObjectHeader *text = frt_require_string(text_word);
    CalyndaRtWord elements[9];
    size_t text_length = frt_string_length(text);
    int32_t width = text_length == 0u ? 1 : (int32_t)text_length * FRT_SCREEN_TEXT_CHAR_ADVANCE;

    elements[0] = (CalyndaRtWord)FRT_SCREEN_OBJECT_KIND_TEXT;
    elements[1] = x_word;
    elements[2] = y_word;
    elements[3] = frt_word_from_signed((long long)width);
    elements[4] = frt_word_from_signed((long long)FRT_SCREEN_TEXT_HEIGHT);
    elements[5] = vx_word;
    elements[6] = vy_word;
    elements[7] = color_word;
    elements[8] = text_word;
    return (CalyndaRtWord)(uintptr_t)frt_new_array(9u, elements);
}

void __calynda_rt_fb_border(CalyndaRtWord x0_word,
                            CalyndaRtWord y0_word,
                            CalyndaRtWord x1_word,
                            CalyndaRtWord y1_word,
                            CalyndaRtWord color_word,
                            CalyndaRtWord thick_word) {
#ifdef MACHINE_TH1520
    frt_fb_border((int32_t)frt_signed_from_word(x0_word),
                  (int32_t)frt_signed_from_word(y0_word),
                  (int32_t)frt_signed_from_word(x1_word),
                  (int32_t)frt_signed_from_word(y1_word),
                  (uint32_t)color_word,
                  (int32_t)frt_signed_from_word(thick_word));
#else
    (void)x0_word;
    (void)y0_word;
    (void)x1_word;
    (void)y1_word;
    (void)color_word;
    (void)thick_word;
#endif
}

void __calynda_rt_fb_draw_row_markers(CalyndaRtWord x0_word,
                                      CalyndaRtWord x1_word,
                                      CalyndaRtWord y0_word,
                                      CalyndaRtWord row_word) {
#ifdef MACHINE_TH1520
    frt_fb_draw_row_markers((int32_t)frt_signed_from_word(x0_word),
                            (int32_t)frt_signed_from_word(x1_word),
                            (int32_t)frt_signed_from_word(y0_word),
                            (int32_t)frt_signed_from_word(row_word));
#else
    (void)x0_word;
    (void)x1_word;
    (void)y0_word;
    (void)row_word;
#endif
}

void __calynda_rt_fb_draw_col_markers(CalyndaRtWord x0_word,
                                      CalyndaRtWord y0_word,
                                      CalyndaRtWord y1_word,
                                      CalyndaRtWord col_word) {
#ifdef MACHINE_TH1520
    frt_fb_draw_col_markers((int32_t)frt_signed_from_word(x0_word),
                            (int32_t)frt_signed_from_word(y0_word),
                            (int32_t)frt_signed_from_word(y1_word),
                            (int32_t)frt_signed_from_word(col_word));
#else
    (void)x0_word;
    (void)y0_word;
    (void)y1_word;
    (void)col_word;
#endif
}

void __calynda_rt_draw_probe_label(CalyndaRtWord px_word,
                                   CalyndaRtWord py_word,
                                   CalyndaRtWord col_word,
                                   CalyndaRtWord row_word,
                                   CalyndaRtWord color_word) {
#ifdef MACHINE_TH1520
    static const uint8_t LETTERS[8][7] = {
        {0x0E, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11},
        {0x1E, 0x11, 0x11, 0x1E, 0x11, 0x11, 0x1E},
        {0x0F, 0x10, 0x10, 0x10, 0x10, 0x10, 0x0F},
        {0x1E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x1E},
        {0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x1F},
        {0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x10},
        {0x0F, 0x10, 0x10, 0x17, 0x11, 0x11, 0x0F},
        {0x11, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11},
    };
    static const uint8_t DIGITS[4][7] = {
        {0x0E, 0x11, 0x13, 0x15, 0x19, 0x11, 0x0E},
        {0x04, 0x0C, 0x04, 0x04, 0x04, 0x04, 0x0E},
        {0x0E, 0x11, 0x01, 0x02, 0x04, 0x08, 0x1F},
        {0x1E, 0x01, 0x01, 0x0E, 0x01, 0x01, 0x1E},
    };
    int32_t px = (int32_t)frt_signed_from_word(px_word);
    int32_t py = (int32_t)frt_signed_from_word(py_word);
    int32_t col = (int32_t)frt_signed_from_word(col_word);
    int32_t row = (int32_t)frt_signed_from_word(row_word);
    uint32_t color = (uint32_t)color_word;
    int32_t scale = 4;

    if (col < 0 || col >= 8 || row < 0 || row >= 4) {
        return;
    }

    frt_draw_probe_glyph(px, py + 2, LETTERS[col], scale, color);
    frt_draw_probe_glyph(px + 28, py + 2, DIGITS[row], scale, color);
#else
    (void)px_word;
    (void)py_word;
    (void)col_word;
    (void)row_word;
    (void)color_word;
#endif
}

static int frt_is_boot_heap_word(CalyndaRtWord value) {
    uintptr_t start = (uintptr_t)BOOT_HEAP;
    uintptr_t end = start + sizeof(BOOT_HEAP);
    uintptr_t pointer = (uintptr_t)value;

    return pointer >= start && pointer + sizeof(CalyndaRtWord) * 2u <= end;
}

static const CalyndaRtClosure *frt_require_closure(CalyndaRtWord callable) {
    const CalyndaRtObjectHeader *header = frt_as_object(callable);

    if (!header) {
        __calynda_rt_debug_pair((CalyndaRtWord)'x',
                                callable,
                                (CalyndaRtWord)(uintptr_t)__builtin_return_address(0));
        if (frt_is_boot_heap_word(callable)) {
            const CalyndaRtWord *words = (const CalyndaRtWord *)(uintptr_t)callable;

            __calynda_rt_debug_pair((CalyndaRtWord)'y', words[0], words[1]);
        }
        frt_uart_putc('V');
        frt_uart_puthex64((uint64_t)callable);
        frt_fail();
    }
    if (header->kind != CALYNDA_RT_OBJECT_CLOSURE) {
        __calynda_rt_debug_pair((CalyndaRtWord)'x',
                                callable,
                                (CalyndaRtWord)(uintptr_t)__builtin_return_address(0));
        frt_uart_putc('K');
        frt_uart_puthex64((uint64_t)header->kind);
        frt_uart_putc('V');
        frt_uart_puthex64((uint64_t)callable);
        frt_fail();
    }
    return (const CalyndaRtClosure *)(const void *)header;
}

static CalyndaRtArray *frt_new_array(size_t count, const CalyndaRtWord *elements) {
    CalyndaRtArray *array = (CalyndaRtArray *)frt_alloc_bytes(sizeof(*array));

    array->header.magic = CALYNDA_RT_OBJECT_MAGIC;
    array->header.kind = CALYNDA_RT_OBJECT_ARRAY;
    array->count = count;
    array->elements = frt_copy_words(elements, count);
    return array;
}

static CalyndaRtHeteroArray *frt_new_hetero_array(const CalyndaRtTypeDescriptor *type_desc,
                                                  size_t count,
                                                  const CalyndaRtWord *elements) {
    CalyndaRtHeteroArray *array = (CalyndaRtHeteroArray *)frt_alloc_bytes(sizeof(*array));

    array->header.magic = CALYNDA_RT_OBJECT_MAGIC;
    array->header.kind = CALYNDA_RT_OBJECT_HETERO_ARRAY;
    array->type_desc = type_desc;
    array->count = count;
    array->elements = frt_copy_words(elements, count);
    return array;
}

static CalyndaRtString *frt_new_string(const char *bytes, size_t length) {
    CalyndaRtString *string = (CalyndaRtString *)frt_alloc_bytes(sizeof(*string));

    string->header.magic = CALYNDA_RT_OBJECT_MAGIC;
    string->header.kind = CALYNDA_RT_OBJECT_STRING;
    string->length = length;
    string->bytes = frt_copy_bytes(bytes, length);
    return string;
}

static CalyndaRtClosure *frt_new_closure(CalyndaRtClosureEntry code_ptr,
                                         size_t capture_count,
                                         const CalyndaRtWord *captures) {
    CalyndaRtClosure *closure = (CalyndaRtClosure *)frt_alloc_bytes(sizeof(*closure));

    closure->header.magic = CALYNDA_RT_OBJECT_MAGIC;
    closure->header.kind = CALYNDA_RT_OBJECT_CLOSURE;
    closure->entry = code_ptr;
    closure->capture_count = capture_count;
    closure->captures = frt_copy_words(captures, capture_count);
    __calynda_rt_debug_pair((CalyndaRtWord)'c',
                            (CalyndaRtWord)(uintptr_t)closure,
                            (CalyndaRtWord)(uintptr_t)code_ptr);
    return closure;
}

CalyndaRtWord __calynda_rt_member_load(CalyndaRtWord target, const char *member) {
    const CalyndaRtObjectHeader *header = frt_as_object(target);

    if (!header || !member || member[0] != 'l' || member[1] != 'e' || member[2] != 'n' ||
        member[3] != 'g' || member[4] != 't' || member[5] != 'h' || member[6] != '\0') {
        frt_fail();
    }

    if (header->kind == CALYNDA_RT_OBJECT_STRING) {
        return frt_word_from_signed((long long)frt_string_length(header));
    }
    if (header->kind == CALYNDA_RT_OBJECT_ARRAY) {
        return frt_word_from_signed((long long)frt_array_count(header));
    }
    if (header->kind == CALYNDA_RT_OBJECT_HETERO_ARRAY) {
        return frt_word_from_signed((long long)((const CalyndaRtHeteroArray *)(const void *)header)->count);
    }

    frt_fail();
}

CalyndaRtWord __calynda_rt_index_load(CalyndaRtWord target, CalyndaRtWord index) {
    const CalyndaRtObjectHeader *header = frt_as_object(target);
    long long signed_index = frt_signed_from_word(index);
    size_t offset;

    if (!header || signed_index < 0) {
        frt_fail();
    }

    offset = (size_t)signed_index;
    if (header->kind == CALYNDA_RT_OBJECT_STRING) {
        size_t length = frt_string_length(header);
        const char *bytes = frt_string_bytes(header);

        if (offset >= length) {
            frt_fail();
        }
        return frt_word_from_signed((long long)(unsigned char)bytes[offset]);
    }

    if (header->kind == CALYNDA_RT_OBJECT_ARRAY) {
        size_t count = frt_array_count(header);

        if (offset >= count) {
            frt_fail();
        }
        return frt_array_elements(header)[offset];
    }
    if (header->kind == CALYNDA_RT_OBJECT_HETERO_ARRAY) {
        const CalyndaRtHeteroArray *array = (const CalyndaRtHeteroArray *)(const void *)header;

        if (offset >= array->count) {
            frt_fail();
        }
        return array->elements[offset];
    }

    frt_fail();
}

CalyndaRtWord __calynda_rt_array_literal(size_t element_count,
                                         const CalyndaRtWord *elements) {
    return (CalyndaRtWord)(uintptr_t)frt_new_array(element_count, elements);
}

CalyndaRtWord __calynda_rt_hetero_array_new(const CalyndaRtTypeDescriptor *type_desc,
                                            size_t element_count,
                                            const CalyndaRtWord *elements) {
    return (CalyndaRtWord)(uintptr_t)frt_new_hetero_array(type_desc, element_count, elements);
}

CalyndaRtTypeTag __calynda_rt_hetero_array_get_tag(CalyndaRtWord target,
                                                   CalyndaRtWord index) {
    const CalyndaRtObjectHeader *header = frt_as_object(target);
    long long signed_index = frt_signed_from_word(index);
    const CalyndaRtHeteroArray *array;
    size_t offset;

    if (!header || header->kind != CALYNDA_RT_OBJECT_HETERO_ARRAY || signed_index < 0) {
        frt_fail();
    }

    array = (const CalyndaRtHeteroArray *)(const void *)header;
    offset = (size_t)signed_index;
    if (offset >= array->count || !array->type_desc || !array->type_desc->generic_param_tags) {
        frt_fail();
    }

    return array->type_desc->generic_param_tags[offset];
}

CalyndaRtWord __calynda_rt_array_car(CalyndaRtWord target) {
    const CalyndaRtObjectHeader *header = frt_as_object(target);

    if (!header || header->kind != CALYNDA_RT_OBJECT_ARRAY || frt_array_count(header) == 0) {
        frt_fail();
    }
    return frt_array_elements(header)[0];
}

CalyndaRtWord __calynda_rt_array_cdr(CalyndaRtWord target) {
    const CalyndaRtObjectHeader *header = frt_as_object(target);
    size_t count;
    const CalyndaRtWord *elements;

    if (!header || header->kind != CALYNDA_RT_OBJECT_ARRAY) {
        frt_fail();
    }

    count = frt_array_count(header);
    elements = frt_array_elements(header);

    if (count == 0) {
        frt_fail();
    }
    return (CalyndaRtWord)(uintptr_t)frt_new_array(count - 1,
                                                    count > 1 ? elements + 1 : NULL);
}

CalyndaRtWord __calynda_rt_string_cdr(CalyndaRtWord target) {
    const CalyndaRtObjectHeader *string = frt_require_string(target);
    size_t length = frt_string_length(string);
    const char *bytes = frt_string_bytes(string);

    if (length == 0) {
        frt_fail();
    }
    return (CalyndaRtWord)(uintptr_t)frt_new_string(bytes + 1, length - 1);
}

void __calynda_rt_store_index(CalyndaRtWord target,
                              CalyndaRtWord index,
                              CalyndaRtWord value) {
    const CalyndaRtObjectHeader *header = frt_as_object(target);
    long long signed_index = frt_signed_from_word(index);
    size_t offset;

    if (!header || header->kind != CALYNDA_RT_OBJECT_ARRAY || signed_index < 0) {
        frt_fail();
    }

    offset = (size_t)signed_index;
    if (offset >= frt_array_count(header)) {
        frt_fail();
    }
    frt_array_elements_mut(header)[offset] = value;
}

CalyndaRtWord __calynda_rt_closure_new(CalyndaRtClosureEntry code_ptr,
                                       size_t capture_count,
                                       const CalyndaRtWord *captures) {
    return (CalyndaRtWord)(uintptr_t)frt_new_closure(code_ptr, capture_count, captures);
}

CalyndaRtWord calynda_rt_callable_dispatch(CalyndaRtWord callable,
                                           const CalyndaRtWord *arguments,
                                           size_t argument_count) {
    return __calynda_rt_call_callable(callable, argument_count, arguments);
}

CalyndaRtWord __calynda_rt_call_callable(CalyndaRtWord callable,
                                         size_t argument_count,
                                         const CalyndaRtWord *arguments) {
    const CalyndaRtClosure *closure = frt_require_closure(callable);

    return closure->entry(closure->captures,
                          closure->capture_count,
                          arguments,
                          argument_count);
}

CalyndaRtWord __calynda_rt_cell_alloc(CalyndaRtWord initial_value) {
    CalyndaRtWord *cell = (CalyndaRtWord *)frt_alloc_bytes(sizeof(*cell));

    *cell = initial_value;
    __calynda_rt_debug_pair((CalyndaRtWord)'m',
                            (CalyndaRtWord)(uintptr_t)cell,
                            initial_value);
    return (CalyndaRtWord)(uintptr_t)cell;
}

CalyndaRtWord __calynda_rt_cell_read(CalyndaRtWord cell) {
    return *(const CalyndaRtWord *)(uintptr_t)cell;
}

CalyndaRtWord __calynda_rt_cell_write(CalyndaRtWord cell, CalyndaRtWord value) {
    *(CalyndaRtWord *)(uintptr_t)cell = value;
    return value;
}

CalyndaRtNlrSlot *__calynda_rt_nlr_push(void) {
    if (BOOT_NLR_DEPTH + 1 >= CALYNDA_RT_NLR_MAX_DEPTH) {
        frt_fail();
    }

    BOOT_NLR_DEPTH += 1;
    BOOT_NLR_SLOTS[BOOT_NLR_DEPTH].pending = false;
    BOOT_NLR_SLOTS[BOOT_NLR_DEPTH].value = 0;
    return &BOOT_NLR_SLOTS[BOOT_NLR_DEPTH];
}

void __calynda_rt_nlr_invoke(CalyndaRtNlrSlot *slot, CalyndaRtWord value) {
    if (slot) {
        slot->pending = true;
        slot->value = value;
    }
}

CalyndaRtWord __calynda_rt_nlr_check_pop(CalyndaRtNlrSlot *slot) {
    bool pending = slot ? slot->pending : false;

    if (BOOT_NLR_DEPTH >= 0) {
        BOOT_NLR_DEPTH -= 1;
    }
    return pending ? (CalyndaRtWord)1 : (CalyndaRtWord)0;
}

CalyndaRtWord __calynda_rt_nlr_get_value(CalyndaRtNlrSlot *slot) {
    return slot ? slot->value : (CalyndaRtWord)0;
}

CalyndaRtWord __calynda_deref(CalyndaRtWord ptr) {
    return frt_load_bytes((const unsigned char *)(uintptr_t)ptr, sizeof(CalyndaRtWord));
}

CalyndaRtWord __calynda_deref_sized(CalyndaRtWord ptr, CalyndaRtWord size) {
    return frt_load_bytes((const unsigned char *)(uintptr_t)ptr, (size_t)size);
}

CalyndaRtWord __calynda_mmio_deref(CalyndaRtWord ptr) {
    return frt_mmio_load_bytes((const volatile unsigned char *)(uintptr_t)ptr,
                               sizeof(CalyndaRtWord));
}

CalyndaRtWord __calynda_mmio_deref_sized(CalyndaRtWord ptr, CalyndaRtWord size) {
    return frt_mmio_load_bytes((const volatile unsigned char *)(uintptr_t)ptr,
                               (size_t)size);
}

CalyndaRtWord __calynda_addr(CalyndaRtWord value) {
    return value;
}

CalyndaRtWord __calynda_offset(CalyndaRtWord ptr, CalyndaRtWord count) {
    return ptr + count * sizeof(CalyndaRtWord);
}

CalyndaRtWord __calynda_offset_stride(CalyndaRtWord ptr,
                                      CalyndaRtWord count,
                                      CalyndaRtWord stride) {
    return ptr + count * stride;
}

void __calynda_store(CalyndaRtWord ptr, CalyndaRtWord value) {
    frt_store_bytes((unsigned char *)(uintptr_t)ptr, value, sizeof(CalyndaRtWord));
}

void __calynda_mmio_store(CalyndaRtWord ptr, CalyndaRtWord value) {
    frt_mmio_store_bytes((volatile unsigned char *)(uintptr_t)ptr,
                         value,
                         sizeof(CalyndaRtWord));
}

void __calynda_store_sized(CalyndaRtWord ptr,
                           CalyndaRtWord value,
                           CalyndaRtWord size) {
    frt_store_bytes((unsigned char *)(uintptr_t)ptr, value, (size_t)size);
}

void __calynda_mmio_store_sized(CalyndaRtWord ptr,
                                CalyndaRtWord value,
                                CalyndaRtWord size) {
    frt_mmio_store_bytes((volatile unsigned char *)(uintptr_t)ptr,
                         value,
                         (size_t)size);
}

void __calynda_rt_fence(void) {
#if defined(__riscv)
    __asm__ volatile("fence" : : : "memory");
#else
    __atomic_thread_fence(__ATOMIC_SEQ_CST);
#endif
}

void __calynda_rt_cache_clean(CalyndaRtWord address) {
#if defined(__riscv)
    register uintptr_t raw_address __asm__("a0") = (uintptr_t)address;

    __asm__ volatile(".long 0x0295000b" : : "r"(raw_address) : "memory");
#else
    (void)address;
#endif
}

void __calynda_rt_cache_final(void) {
#if defined(__riscv)
    __asm__ volatile(".long 0x0190000b" : : : "memory");
#else
    __atomic_thread_fence(__ATOMIC_SEQ_CST);
#endif
}