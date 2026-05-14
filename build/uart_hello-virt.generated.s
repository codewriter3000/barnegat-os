.text
.globl calynda_unit_hdmi_hello_world
calynda_unit_hdmi_hello_world:

    li a0, 0
    ret
.globl calynda_unit_run
calynda_unit_run:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -32
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd t1, -24(s0)
    call calynda_unit_hdmi_hello_world
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
.globl calynda_unit_boot
calynda_unit_boot:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -32
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd t1, -24(s0)
    call calynda_unit_run
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
.section .note.GNU-stack,"",@progbits
