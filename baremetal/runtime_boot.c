#include "runtime.h"

#include <stddef.h>
#include <stdint.h>

#define CALYNDA_RT_BOOT_HEAP_CAPACITY (64u * 1024u)

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

static void frt_uart_putc(char ch) {
#ifdef MACHINE_TH1520
    volatile uint32_t *uart = (volatile uint32_t *)(uintptr_t)TH1520_UART0;

    while ((uart[5] & 0x20U) == 0U) {
    }
    uart[0] = (uint32_t)(unsigned char)ch;
#else
    (void)ch;
#endif
}

static void frt_uart_puthex64(uint64_t value) {
#ifdef MACHINE_TH1520
    static const char HEX[] = "0123456789ABCDEF";
    int shift;

    for (shift = 60; shift >= 0; shift -= 4) {
        frt_uart_putc(HEX[(value >> shift) & 0xFU]);
    }
#else
    (void)value;
#endif
}

static int frt_debug_take_slot(void) {
#ifdef MACHINE_TH1520
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
#ifdef MACHINE_TH1520
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

    frt_uart_putc('!');
    frt_uart_puthex64((uint64_t)caller);
    __builtin_trap();
    for (;;) {
    }
}

CalyndaRtWord __calynda_rt_boot_probe_c(void) {
    CalyndaRtWord result;

    frt_uart_putc('F');
    calynda_unit___mir_module_init();
    frt_uart_putc('G');
    result = calynda_unit_run();
    frt_uart_putc('H');
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

static const CalyndaRtString *frt_require_string(CalyndaRtWord target) {
    const CalyndaRtObjectHeader *header = frt_as_object(target);

    if (!header || header->kind != CALYNDA_RT_OBJECT_STRING) {
        frt_fail();
    }
    return (const CalyndaRtString *)(const void *)header;
}

typedef struct {
    CalyndaRtObjectHeader header;
    uintptr_t             reserved;
    size_t                count;
    CalyndaRtWord        *elements;
} CalyndaRtStaticArray;

static int frt_array_is_dynamic(const CalyndaRtObjectHeader *header) {
    return frt_is_boot_heap_word((CalyndaRtWord)(uintptr_t)header);
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
        return frt_word_from_signed((long long)((const CalyndaRtString *)(const void *)header)->length);
    }
    if (header->kind == CALYNDA_RT_OBJECT_ARRAY) {
        return frt_word_from_signed((long long)frt_array_count(header));
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
        const CalyndaRtString *string = (const CalyndaRtString *)(const void *)header;

        if (offset >= string->length) {
            frt_fail();
        }
        return frt_word_from_signed((long long)(unsigned char)string->bytes[offset]);
    }

    if (header->kind == CALYNDA_RT_OBJECT_ARRAY) {
        size_t count = frt_array_count(header);

        if (offset >= count) {
            frt_fail();
        }
        return frt_array_elements(header)[offset];
    }

    frt_fail();
}

CalyndaRtWord __calynda_rt_array_literal(size_t element_count,
                                         const CalyndaRtWord *elements) {
    return (CalyndaRtWord)(uintptr_t)frt_new_array(element_count, elements);
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
    const CalyndaRtString *string = frt_require_string(target);

    if (string->length == 0) {
        frt_fail();
    }
    return (CalyndaRtWord)(uintptr_t)frt_new_string(string->bytes + 1, string->length - 1);
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