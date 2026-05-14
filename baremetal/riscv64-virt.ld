ENTRY(_start_baremetal)

MEMORY
{
    ram (rwx) : ORIGIN = 0x80000000, LENGTH = 128M
}

SECTIONS
{
    . = ORIGIN(ram);

    .text : ALIGN(16)
    {
        KEEP(*(.text.start))
        *(.text .text.*)
    } > ram

    .rodata : ALIGN(16)
    {
        *(.rodata .rodata.*)
    } > ram

    .data : ALIGN(16)
    {
        *(.data .data.*)
    } > ram

    .bss : ALIGN(16)
    {
        __bss_start = .;
        *(.bss .bss.*)
        *(COMMON)
        __bss_end = .;
    } > ram

    . = ALIGN(16);
    __stack_bottom = .;
    . = . + 64K;
    __stack_top = .;

    /DISCARD/ :
    {
        *(.note.GNU-stack)
        *(.comment)
    }
}