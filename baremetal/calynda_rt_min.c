#include <stdint.h>

/* Calynda string object layout (riscv64):
 *   +0  : uint32_t tag
 *   +4  : uint32_t pad
 *   +8  : int64_t  length
 *   +16 : const char *chars  (pointer to null-terminated byte array)
 */
typedef struct {
    uint32_t    tag;
    uint32_t    pad;
    int64_t     length;
    const char *chars;
} CalyndaString;

/* msg.length  —  a0=obj, a1=field_name (always "length" in current codegen) */
int64_t __calynda_rt_member_load(const CalyndaString *obj, const char *field)
{
    (void)field;
    return obj->length;
}

/* msg[index]  —  a0=obj, a1=index */
int64_t __calynda_rt_index_load(const CalyndaString *obj, int64_t index)
{
    return (uint8_t)obj->chars[index];
}

/* store(ptr, value, size)  —  a0=ptr, a1=value, a2=size_in_bytes */
void __calynda_store_sized(void *ptr, int64_t value, int64_t size)
{
    if (size == 1)
        *(volatile uint8_t  *)ptr = (uint8_t) value;
    else if (size == 2)
        *(volatile uint16_t *)ptr = (uint16_t)value;
    else if (size == 4)
        *(volatile uint32_t *)ptr = (uint32_t)value;
    else
        *(volatile uint64_t *)ptr = (uint64_t)value;
}
