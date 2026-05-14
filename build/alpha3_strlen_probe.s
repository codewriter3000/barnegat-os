.text
.globl calynda_unit_print
calynda_unit_print:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    la a1, .Lsym_0
    sd t1, -40(s0)
    call __calynda_rt_member_load
    ld t1, -40(s0)
    mv t1, a0
    sd t1, -32(s0)
    li a0, 0
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_boot
calynda_unit_boot:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -32
    sd t0, -24(s0)
    sd s1, -32(s0)
    la a0, .Lstr_obj_1
    sd t1, -24(s0)
    call calynda_unit_print
    ld t1, -24(s0)
    mv t1, a0
    mv a0, t1
    addi sp, sp, 32
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl _start
_start:
    li s0, 0
    li ra, 0
    li s11, 0
    call calynda_unit_boot
1:
    j 1b
.section .rodata
.Lsym_0:
    .byte 108, 101, 110, 103, 116, 104, 0
.data
.Lstr_obj_1:
    .long 1129077060
    .long 0
    .quad 2
    .quad .Lstr_bytes_1
.Lstr_bytes_1:
    .byte 104, 105, 0
.section .note.GNU-stack,"",@progbits
