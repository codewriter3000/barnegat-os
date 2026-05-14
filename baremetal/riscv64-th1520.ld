ENTRY(_start_baremetal)

MEMORY
{
    /* TH1520: DDR starts at 0x00000000; 0x04000000 sits above OpenSBI/U-Boot */
    ram (rwx) : ORIGIN = 0x04000000, LENGTH = 128M
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
