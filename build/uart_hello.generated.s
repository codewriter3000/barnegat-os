.text
.globl calynda_unit_uart_putc
calynda_unit_uart_putc:

    li   t0, 0x10000000
    sb   a0, 0(t0)
    li   a0, 0
    ret
.globl calynda_unit_uart_emit_and_step
calynda_unit_uart_emit_and_step:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -80
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    ld a0, -24(s0)
    ld a1, -32(s0)
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    sd t4, -80(s0)
    call __calynda_rt_index_load
    ld t4, -80(s0)
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t1, a0
    sd t1, -40(s0)
    ld a0, -40(s0)
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    sd t4, -80(s0)
    call calynda_unit_uart_putc
    ld t4, -80(s0)
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t2, a0
    sd t2, -48(s0)
    ld t0, -32(s0)
    li s1, 1
    add t4, t0, s1
    ld a0, -24(s0)
    mv a1, t4
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    sd t4, -80(s0)
    call calynda_unit_uart_print_at
    ld t4, -80(s0)
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t3, a0
    mv a0, t3
    addi sp, sp, 80
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_uart_print_at
calynda_unit_uart_print_at:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    ld a0, -24(s0)
    la a1, .Lsym_0
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    call __calynda_rt_member_load
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t1, a0
    ld t0, -32(s0)
    slt t2, t0, t1
    bne t2, zero, .Lcalynda_unit_uart_print_at_bb1
    j .Lcalynda_unit_uart_print_at_bb2
.Lcalynda_unit_uart_print_at_bb1:
    ld a0, -24(s0)
    ld a1, -32(s0)
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    call calynda_unit_uart_emit_and_step
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t3, a0
    sd t3, -40(s0)
    j .Lcalynda_unit_uart_print_at_bb3
.Lcalynda_unit_uart_print_at_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_uart_print_at_bb3
.Lcalynda_unit_uart_print_at_bb3:
    ld a0, -40(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_uart_print
calynda_unit_uart_print:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -32
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    li a1, 0
    sd t1, -32(s0)
    call calynda_unit_uart_print_at
    ld t1, -32(s0)
    mv t1, a0
    mv a0, t1
    addi sp, sp, 32
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
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
    la a0, .Lstr_obj_1
    sd t1, -24(s0)
    call calynda_unit_uart_print
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
.section .rodata
.Lsym_0:
    .byte 108, 101, 110, 103, 116, 104, 0
.data
.Lstr_obj_1:
    .long 1129077060
    .long 0
    .quad 11
    .quad .Lstr_bytes_1
.Lstr_bytes_1:
    .byte 72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 0
.section .note.GNU-stack,"",@progbits
