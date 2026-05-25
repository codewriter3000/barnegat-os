.text
.section .text.calynda_unit_if,"ax"
.globl calynda_unit_if
calynda_unit_if:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    ld t6, -24(s0)
    bne t6, zero, .Lcalynda_unit_if_bb1
    j .Lcalynda_unit_if_bb2
.Lcalynda_unit_if_bb1:
    ld a0, -32(s0)
    li a1, 0
    li a2, 0
    sd t1, -56(s0)
    sd t2, -64(s0)
    call __calynda_rt_call_callable
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t1, a0
    sd t1, -48(s0)
    j .Lcalynda_unit_if_bb3
.Lcalynda_unit_if_bb2:
    ld a0, -40(s0)
    li a1, 0
    li a2, 0
    sd t1, -56(s0)
    sd t2, -64(s0)
    call __calynda_rt_call_callable
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t2, a0
    sd t2, -48(s0)
    j .Lcalynda_unit_if_bb3
.Lcalynda_unit_if_bb3:
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_while_nlr0,"ax"
.globl calynda_unit_while_nlr0
calynda_unit_while_nlr0:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld t0, 16(s11)
    sd t0, -40(s0)
    ld a0, -32(s0)
    li a1, 0
    li a2, 0
    sd t1, -48(s0)
    call __calynda_rt_call_callable
    ld t1, -48(s0)
    mv t1, a0
    ld a0, -40(s0)
    ld a1, -32(s0)
    sd t1, -48(s0)
    call calynda_unit_while
    ld t1, -48(s0)
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_while_lambda1,"ax"
.globl calynda_unit_while_lambda1
calynda_unit_while_lambda1:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -16
    sd t0, -24(s0)
    sd s1, -32(s0)
    addi sp, sp, 16
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_while,"ax"
.globl calynda_unit_while
calynda_unit_while:
    addi sp, sp, -48
    sd ra, 40(sp)
    sd s0, 32(sp)
    addi s0, sp, 48
    sd a0, 24(sp)
    sd a1, 16(sp)
.Lcalynda_iter_while_loop:
    ld a0, 24(sp)
    li a1, 0
    li a2, 0
    call __calynda_rt_call_callable
    beqz a0, .Lcalynda_iter_while_done
    ld a0, 16(sp)
    li a1, 0
    li a2, 0
    call __calynda_rt_call_callable
    j .Lcalynda_iter_while_loop
.Lcalynda_iter_while_done:
    li a0, 0
    ld s0, 32(sp)
    ld ra, 40(sp)
    addi sp, sp, 48
    ret
.section .text.calynda_unit_RGB,"ax"
.globl calynda_unit_RGB
calynda_unit_RGB:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    ld t0, -24(s0)
    li s1, 16
    sll t1, t0, s1
    ld t0, -32(s0)
    li s1, 8
    sll t2, t0, s1
    or t3, t1, t2
    ld s1, -40(s0)
    or t4, t3, s1
    mv a0, t4
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_fb_write_pixel,"ax"
.globl calynda_unit_fb_write_pixel
calynda_unit_fb_write_pixel:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -80
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    li t0, 0x04200000
    sd t0, -48(s0)
    ld t0, -32(s0)
    li s1, 1920
    mul t2, t0, s1
    ld s1, -24(s0)
    add t3, t2, s1
    ld a0, -48(s0)
    mv a1, t3
    li a2, 4
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    call __calynda_offset_stride
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t1, a0
    mv a0, t1
    ld a1, -40(s0)
    li a2, 4
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    call __calynda_mmio_store_sized
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    addi sp, sp, 80
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_fb_rect_span_lambda2,"ax"
.globl calynda_unit_fb_rect_span_lambda2
calynda_unit_fb_rect_span_lambda2:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -24(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    call __calynda_rt_cell_read
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    ld s1, -32(s0)
    slt t2, t1, s1
    mv a0, t2
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_fb_rect_span_nlr3,"ax"
.globl calynda_unit_fb_rect_span_nlr3
calynda_unit_fb_rect_span_nlr3:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -80
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld t0, 16(s11)
    sd t0, -40(s0)
    ld t0, 24(s11)
    sd t0, -48(s0)
    ld a0, -32(s0)
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    call __calynda_rt_cell_read
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t1, a0
    mv a0, t1
    ld a1, -40(s0)
    ld a2, -48(s0)
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    call calynda_unit_fb_write_pixel
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    ld a0, -32(s0)
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    call __calynda_rt_cell_read
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t2, a0
    li s1, 1
    add t3, t2, s1
    ld a0, -32(s0)
    mv a1, t3
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    call __calynda_rt_cell_write
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    addi sp, sp, 80
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_fb_rect_span,"ax"
.globl calynda_unit_fb_rect_span
calynda_unit_fb_rect_span:
    li t4, 0x04200000
    li t5, 1920
    mul t0, a2, t5
    add t0, t0, a0
    mv t1, a0
.Lcalynda_fb_rect_span_loop:
    bge t1, a1, .Lcalynda_fb_rect_span_done
    slli t2, t0, 2
    add t3, t4, t2
    sw a3, 0(t3)
    addi t1, t1, 1
    addi t0, t0, 1
    j .Lcalynda_fb_rect_span_loop
.Lcalynda_fb_rect_span_done:
    li a0, 0
    ret
.section .text.calynda_unit_fb_rect_lambda4,"ax"
.globl calynda_unit_fb_rect_lambda4
calynda_unit_fb_rect_lambda4:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -24(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    ld a0, -32(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    slt t3, t1, t2
    mv a0, t3
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_fb_rect_nlr5,"ax"
.globl calynda_unit_fb_rect_nlr5
calynda_unit_fb_rect_nlr5:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -96
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld t0, 16(s11)
    sd t0, -40(s0)
    ld t0, 24(s11)
    sd t0, -48(s0)
    ld t0, 32(s11)
    sd t0, -56(s0)
    ld a0, -40(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    call __calynda_rt_cell_read
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t1, a0
    ld a0, -48(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    call __calynda_rt_cell_read
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t2, a0
    ld a0, -32(s0)
    mv a1, t1
    mv a2, t2
    ld a3, -56(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    call calynda_unit_fb_rect_span
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    ld a0, -48(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    call __calynda_rt_cell_read
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t3, a0
    li s1, 1
    add t4, t3, s1
    ld a0, -48(s0)
    mv a1, t4
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    call __calynda_rt_cell_write
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    addi sp, sp, 96
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_fb_rect,"ax"
.globl calynda_unit_fb_rect
calynda_unit_fb_rect:
    mv t0, a1
    li t6, 0x04200000
.Lcalynda_fb_rect_y_loop:
    blt a3, t0, .Lcalynda_fb_rect_done
    li t1, 1920
    mul t2, t0, t1
    add t2, t2, a0
    mv t3, a0
.Lcalynda_fb_rect_x_loop:
    blt a2, t3, .Lcalynda_fb_rect_next_row
    slli t4, t2, 2
    add t5, t6, t4
    sw a4, 0(t5)
    addi t3, t3, 1
    addi t2, t2, 1
    j .Lcalynda_fb_rect_x_loop
.Lcalynda_fb_rect_next_row:
    addi t0, t0, 1
    j .Lcalynda_fb_rect_y_loop
.Lcalynda_fb_rect_done:
    li a0, 0
    ret
.section .text.calynda_unit_fb_fill,"ax"
.globl calynda_unit_fb_fill
calynda_unit_fb_fill:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    li s1, 1
    la t1, calynda_global_FB_WIDTH
    ld t1, 0(t1)
    sub t1, t1, s1
    li s1, 1
    la t2, calynda_global_FB_HEIGHT
    ld t2, 0(t2)
    sub t2, t2, s1
    li a0, 0
    li a1, 0
    mv a2, t1
    mv a3, t2
    ld a4, -24(s0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    call calynda_unit_fb_rect
    ld t2, -40(s0)
    ld t1, -32(s0)
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_thead_dcache_clean_range_lambda6,"ax"
.globl calynda_unit_thead_dcache_clean_range_lambda6
calynda_unit_thead_dcache_clean_range_lambda6:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -24(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    ld a0, -32(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    sltu t3, t1, t2
    mv a0, t3
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_thead_dcache_clean_range_nlr7,"ax"
.globl calynda_unit_thead_dcache_clean_range_nlr7
calynda_unit_thead_dcache_clean_range_nlr7:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -32(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    mv a0, t1
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cache_clean
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    ld a0, -32(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    la t3, calynda_global_THEAD_CMO_STRIDE
    ld t3, 0(t3)
    add t3, t2, t3
    ld a0, -32(s0)
    mv a1, t3
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_write
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_thead_dcache_clean_range,"ax"
.globl calynda_unit_thead_dcache_clean_range
calynda_unit_thead_dcache_clean_range:
    addi sp, sp, -16
    sd ra, 8(sp)
    call __calynda_rt_cache_clean_range
    li a0, 0
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_make_rect,"ax"
.globl calynda_unit_screen_make_rect
calynda_unit_screen_make_rect:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -160
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    sd a3, -48(s0)
    sd a4, -56(s0)
    sd a5, -64(s0)
    sd a6, -72(s0)
    li t0, 0
    sd t0, -144(s0)
    ld t0, -24(s0)
    sd t0, -136(s0)
    ld t0, -32(s0)
    sd t0, -128(s0)
    ld t0, -40(s0)
    sd t0, -120(s0)
    ld t0, -48(s0)
    sd t0, -112(s0)
    ld t0, -56(s0)
    sd t0, -104(s0)
    ld t0, -64(s0)
    sd t0, -96(s0)
    ld t0, -72(s0)
    sd t0, -88(s0)
    li t0, 0
    sd t0, -80(s0)
    li a0, 9
    addi a1, s0, -144
    sd t1, -152(s0)
    call __calynda_rt_array_literal
    ld t1, -152(s0)
    mv t1, a0
    mv a0, t1
    addi sp, sp, 160
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_text_width,"ax"
.globl calynda_unit_screen_text_width
calynda_unit_screen_text_width:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    la a1, .Lsym_0
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_rt_member_load
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    li s1, 0
    sub t2, t1, s1
    seqz t2, t2
    bne t2, zero, .Lcalynda_unit_screen_text_width_bb1
    j .Lcalynda_unit_screen_text_width_bb2
.Lcalynda_unit_screen_text_width_bb1:
    li t0, 1
    sd t0, -32(s0)
    j .Lcalynda_unit_screen_text_width_bb3
.Lcalynda_unit_screen_text_width_bb2:
    ld a0, -24(s0)
    la a1, .Lsym_0
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_rt_member_load
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t3, a0
    la t4, calynda_global_SCREEN_TEXT_CHAR_ADVANCE
    ld t4, 0(t4)
    mul t4, t3, t4
    sd t4, -32(s0)
    j .Lcalynda_unit_screen_text_width_bb3
.Lcalynda_unit_screen_text_width_bb3:
    ld a0, -32(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_make_text,"ax"
.globl calynda_unit_screen_make_text
calynda_unit_screen_make_text:
    addi sp, sp, -16
    sd ra, 8(sp)
    call __calynda_rt_screen_make_text
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_object_x,"ax"
.globl calynda_unit_screen_object_x
calynda_unit_screen_object_x:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    li a1, 1
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_index_load
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t2, a0
    mv a0, t2
    li a1, 2
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_cast_value
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t1, a0
    mv a0, t1
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_object_y,"ax"
.globl calynda_unit_screen_object_y
calynda_unit_screen_object_y:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    li a1, 2
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_index_load
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t2, a0
    mv a0, t2
    li a1, 2
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_cast_value
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t1, a0
    mv a0, t1
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_object_width,"ax"
.globl calynda_unit_screen_object_width
calynda_unit_screen_object_width:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    li a1, 3
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_index_load
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t2, a0
    mv a0, t2
    li a1, 2
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_cast_value
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t1, a0
    mv a0, t1
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_object_height,"ax"
.globl calynda_unit_screen_object_height
calynda_unit_screen_object_height:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    li a1, 4
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_index_load
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t2, a0
    mv a0, t2
    li a1, 2
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_cast_value
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t1, a0
    mv a0, t1
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_object_color,"ax"
.globl calynda_unit_screen_object_color
calynda_unit_screen_object_color:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    li a1, 7
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_index_load
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t2, a0
    mv a0, t2
    li a1, 8
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_cast_value
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t1, a0
    mv a0, t1
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_draw_object,"ax"
.globl calynda_unit_screen_draw_object
calynda_unit_screen_draw_object:
    addi sp, sp, -16
    sd ra, 8(sp)
    call __calynda_rt_screen_draw_object
    li a0, 0
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_delay_us,"ax"
.globl calynda_unit_delay_us
calynda_unit_delay_us:

    li t0, 1000
    mul t0, a0, t0
1:
    beqz t0, 2f
    addi t0, t0, -1
    nop
    j 1b
2:
    li a0, 0
    ret
.section .text.calynda_unit_dpu0_pll_configure_1080p60_lambda40,"ax"
.globl calynda_unit_dpu0_pll_configure_1080p60_lambda40
calynda_unit_dpu0_pll_configure_1080p60_lambda40:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -112
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -24(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_rt_cell_read
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t1, a0
    li s1, 200
    slt t2, t1, s1
    bne t2, zero, .Lcalynda_unit_dpu0_pll_configure_1080p60_lambda40_bb1
    j .Lcalynda_unit_dpu0_pll_configure_1080p60_lambda40_bb2
.Lcalynda_unit_dpu0_pll_configure_1080p60_lambda40_bb1:
    li s1, 4
    li t0, 0x80
    div t5, t0, s1
    ld a0, -32(s0)
    mv a1, t5
    li a2, 4
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_offset_stride
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t4, a0
    mv a0, t4
    li a1, 4
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_mmio_deref_sized
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t3, a0
    li s1, 8
    li t0, 1
    sll t6, t0, s1
    and t0, t3, t6
    sd t0, -48(s0)
    ld t0, -48(s0)
    li s1, 0
    sub t0, t0, s1
    seqz t0, t0
    sd t0, -56(s0)
    ld t0, -56(s0)
    sd t0, -40(s0)
    j .Lcalynda_unit_dpu0_pll_configure_1080p60_lambda40_bb3
.Lcalynda_unit_dpu0_pll_configure_1080p60_lambda40_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_dpu0_pll_configure_1080p60_lambda40_bb3
.Lcalynda_unit_dpu0_pll_configure_1080p60_lambda40_bb3:
    ld a0, -40(s0)
    addi sp, sp, 112
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dpu0_pll_configure_1080p60_nlr41,"ax"
.globl calynda_unit_dpu0_pll_configure_1080p60_nlr41
calynda_unit_dpu0_pll_configure_1080p60_nlr41:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    li a0, 1
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call calynda_unit_delay_us
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    ld a0, -32(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    li s1, 1
    add t3, t2, s1
    ld a0, -32(s0)
    mv a1, t3
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_write
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dpu0_pll_configure_1080p60,"ax"
.globl calynda_unit_dpu0_pll_configure_1080p60
calynda_unit_dpu0_pll_configure_1080p60:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -496
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t0, 0xFFEF010000
    sd t0, -24(s0)
    li s1, 4
    li t0, 0x44
    div t3, t0, s1
    ld a0, -24(s0)
    mv a1, t3
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t2, a0
    mv a0, t2
    li a1, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_deref_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t1, a0
    sd t1, -32(s0)
    li s1, 29
    li t0, 1
    sll t4, t0, s1
    ld t0, -32(s0)
    or t5, t0, t4
    sd t5, -32(s0)
    li s1, 4
    li t0, 0x44
    div t0, t0, s1
    sd t0, -64(s0)
    ld a0, -24(s0)
    ld a1, -64(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t6, a0
    mv a0, t6
    ld a1, -32(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li s1, 4
    li t0, 0x40
    div t0, t0, s1
    sd t0, -80(s0)
    ld a0, -24(s0)
    ld a1, -80(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -72(s0)
    li s1, 0
    li t0, 1
    sll t0, t0, s1
    sd t0, -88(s0)
    li s1, 8
    li t0, 99
    sll t0, t0, s1
    sd t0, -96(s0)
    ld t0, -88(s0)
    ld s1, -96(s0)
    or t0, t0, s1
    sd t0, -104(s0)
    li s1, 20
    li t0, 2
    sll t0, t0, s1
    sd t0, -112(s0)
    ld t0, -104(s0)
    ld s1, -112(s0)
    or t0, t0, s1
    sd t0, -120(s0)
    li s1, 24
    li t0, 1
    sll t0, t0, s1
    sd t0, -128(s0)
    ld t0, -120(s0)
    ld s1, -128(s0)
    or t0, t0, s1
    sd t0, -136(s0)
    ld a0, -72(s0)
    ld a1, -136(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li a0, 3
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_delay_us
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -144(s0)
    li s1, 4
    li t0, 0x44
    div t0, t0, s1
    sd t0, -168(s0)
    ld a0, -24(s0)
    ld a1, -168(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -160(s0)
    ld a0, -160(s0)
    li a1, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_deref_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld t0, -152(s0)
    sd t0, -32(s0)
    li s1, 29
    li t0, 1
    sll t0, t0, s1
    sd t0, -184(s0)
    ld t0, -184(s0)
    not t0, t0
    sd t0, -176(s0)
    ld t0, -32(s0)
    ld s1, -176(s0)
    and t0, t0, s1
    sd t0, -192(s0)
    ld t0, -192(s0)
    sd t0, -32(s0)
    li s1, 30
    li t0, 1
    sll t0, t0, s1
    sd t0, -208(s0)
    ld t0, -208(s0)
    not t0, t0
    sd t0, -200(s0)
    ld t0, -32(s0)
    ld s1, -200(s0)
    and t0, t0, s1
    sd t0, -216(s0)
    ld t0, -216(s0)
    sd t0, -32(s0)
    li s1, 4
    li t0, 0x44
    div t0, t0, s1
    sd t0, -232(s0)
    ld a0, -24(s0)
    ld a1, -232(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -224(s0)
    ld a0, -224(s0)
    ld a1, -32(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li a0, 0
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_cell_alloc
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -240(s0)
    ld t0, -240(s0)
    sd t0, -40(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_nlr_push
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -248(s0)
    ld t0, -248(s0)
    sd t0, -48(s0)
    ld t0, -40(s0)
    sd t0, -448(s0)
    ld t0, -24(s0)
    sd t0, -440(s0)
    addi a2, s0, -448
    la a0, calynda_closure_dpu0_pll_configure_1080p60_lambda40
    li a1, 2
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_closure_new
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -256(s0)
    ld t0, -48(s0)
    sd t0, -448(s0)
    ld t0, -40(s0)
    sd t0, -440(s0)
    addi a2, s0, -448
    la a0, calynda_closure_dpu0_pll_configure_1080p60_nlr41
    li a1, 2
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_closure_new
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -264(s0)
    ld a0, -256(s0)
    ld a1, -264(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_while
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    ld a0, -48(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -272(s0)
    ld t6, -272(s0)
    bne t6, zero, .Lcalynda_unit_dpu0_pll_configure_1080p60_bb1
    j .Lcalynda_unit_dpu0_pll_configure_1080p60_bb2
.Lcalynda_unit_dpu0_pll_configure_1080p60_bb1:
    addi sp, sp, 496
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_dpu0_pll_configure_1080p60_bb2:
    li a0, 30
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_delay_us
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -280(s0)
    li s1, 4
    li t0, 0x1E8
    div t0, t0, s1
    sd t0, -304(s0)
    ld a0, -24(s0)
    ld a1, -304(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -296(s0)
    ld a0, -296(s0)
    li a1, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_deref_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -288(s0)
    ld t0, -288(s0)
    sd t0, -56(s0)
    li s1, 8
    li t0, 1
    sll t0, t0, s1
    sd t0, -320(s0)
    ld t0, -320(s0)
    not t0, t0
    sd t0, -312(s0)
    ld t0, -56(s0)
    ld s1, -312(s0)
    and t0, t0, s1
    sd t0, -328(s0)
    ld t0, -328(s0)
    sd t0, -56(s0)
    li s1, 4
    li t0, 0x1E8
    div t0, t0, s1
    sd t0, -344(s0)
    ld a0, -24(s0)
    ld a1, -344(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -336(s0)
    ld a0, -336(s0)
    ld a1, -56(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li a0, 1
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_delay_us
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -352(s0)
    li t0, 0xFF
    not t0, t0
    sd t0, -360(s0)
    ld t0, -56(s0)
    ld s1, -360(s0)
    and t0, t0, s1
    sd t0, -368(s0)
    ld t0, -368(s0)
    sd t0, -56(s0)
    ld t0, -56(s0)
    li s1, 8
    or t0, t0, s1
    sd t0, -376(s0)
    ld t0, -376(s0)
    sd t0, -56(s0)
    li s1, 4
    li t0, 0x1E8
    div t0, t0, s1
    sd t0, -392(s0)
    ld a0, -24(s0)
    ld a1, -392(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -384(s0)
    ld a0, -384(s0)
    ld a1, -56(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li a0, 1
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_delay_us
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -400(s0)
    li s1, 8
    li t0, 1
    sll t0, t0, s1
    sd t0, -408(s0)
    ld t0, -56(s0)
    ld s1, -408(s0)
    or t0, t0, s1
    sd t0, -416(s0)
    ld t0, -416(s0)
    sd t0, -56(s0)
    li s1, 4
    li t0, 0x1E8
    div t0, t0, s1
    sd t0, -432(s0)
    ld a0, -24(s0)
    ld a1, -432(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -424(s0)
    ld a0, -424(s0)
    ld a1, -56(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    addi sp, sp, 496
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dpu1_pll_configure_1080p60_lambda42,"ax"
.globl calynda_unit_dpu1_pll_configure_1080p60_lambda42
calynda_unit_dpu1_pll_configure_1080p60_lambda42:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -112
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -24(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_rt_cell_read
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t1, a0
    li s1, 200
    slt t2, t1, s1
    bne t2, zero, .Lcalynda_unit_dpu1_pll_configure_1080p60_lambda42_bb1
    j .Lcalynda_unit_dpu1_pll_configure_1080p60_lambda42_bb2
.Lcalynda_unit_dpu1_pll_configure_1080p60_lambda42_bb1:
    li s1, 4
    li t0, 0x80
    div t5, t0, s1
    ld a0, -32(s0)
    mv a1, t5
    li a2, 4
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_offset_stride
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t4, a0
    mv a0, t4
    li a1, 4
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_mmio_deref_sized
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t3, a0
    li s1, 9
    li t0, 1
    sll t6, t0, s1
    and t0, t3, t6
    sd t0, -48(s0)
    ld t0, -48(s0)
    li s1, 0
    sub t0, t0, s1
    seqz t0, t0
    sd t0, -56(s0)
    ld t0, -56(s0)
    sd t0, -40(s0)
    j .Lcalynda_unit_dpu1_pll_configure_1080p60_lambda42_bb3
.Lcalynda_unit_dpu1_pll_configure_1080p60_lambda42_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_dpu1_pll_configure_1080p60_lambda42_bb3
.Lcalynda_unit_dpu1_pll_configure_1080p60_lambda42_bb3:
    ld a0, -40(s0)
    addi sp, sp, 112
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dpu1_pll_configure_1080p60_nlr43,"ax"
.globl calynda_unit_dpu1_pll_configure_1080p60_nlr43
calynda_unit_dpu1_pll_configure_1080p60_nlr43:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    li a0, 1
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call calynda_unit_delay_us
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    ld a0, -32(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    li s1, 1
    add t3, t2, s1
    ld a0, -32(s0)
    mv a1, t3
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_write
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dpu1_pll_configure_1080p60,"ax"
.globl calynda_unit_dpu1_pll_configure_1080p60
calynda_unit_dpu1_pll_configure_1080p60:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -496
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t0, 0xFFEF010000
    sd t0, -24(s0)
    li s1, 4
    li t0, 0x54
    div t3, t0, s1
    ld a0, -24(s0)
    mv a1, t3
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t2, a0
    mv a0, t2
    li a1, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_deref_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t1, a0
    sd t1, -32(s0)
    li s1, 29
    li t0, 1
    sll t4, t0, s1
    ld t0, -32(s0)
    or t5, t0, t4
    sd t5, -32(s0)
    li s1, 4
    li t0, 0x54
    div t0, t0, s1
    sd t0, -64(s0)
    ld a0, -24(s0)
    ld a1, -64(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t6, a0
    mv a0, t6
    ld a1, -32(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li s1, 4
    li t0, 0x50
    div t0, t0, s1
    sd t0, -80(s0)
    ld a0, -24(s0)
    ld a1, -80(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -72(s0)
    li s1, 0
    li t0, 1
    sll t0, t0, s1
    sd t0, -88(s0)
    li s1, 8
    li t0, 99
    sll t0, t0, s1
    sd t0, -96(s0)
    ld t0, -88(s0)
    ld s1, -96(s0)
    or t0, t0, s1
    sd t0, -104(s0)
    li s1, 20
    li t0, 2
    sll t0, t0, s1
    sd t0, -112(s0)
    ld t0, -104(s0)
    ld s1, -112(s0)
    or t0, t0, s1
    sd t0, -120(s0)
    li s1, 24
    li t0, 1
    sll t0, t0, s1
    sd t0, -128(s0)
    ld t0, -120(s0)
    ld s1, -128(s0)
    or t0, t0, s1
    sd t0, -136(s0)
    ld a0, -72(s0)
    ld a1, -136(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li a0, 3
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_delay_us
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -144(s0)
    li s1, 4
    li t0, 0x54
    div t0, t0, s1
    sd t0, -168(s0)
    ld a0, -24(s0)
    ld a1, -168(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -160(s0)
    ld a0, -160(s0)
    li a1, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_deref_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld t0, -152(s0)
    sd t0, -32(s0)
    li s1, 29
    li t0, 1
    sll t0, t0, s1
    sd t0, -184(s0)
    ld t0, -184(s0)
    not t0, t0
    sd t0, -176(s0)
    ld t0, -32(s0)
    ld s1, -176(s0)
    and t0, t0, s1
    sd t0, -192(s0)
    ld t0, -192(s0)
    sd t0, -32(s0)
    li s1, 30
    li t0, 1
    sll t0, t0, s1
    sd t0, -208(s0)
    ld t0, -208(s0)
    not t0, t0
    sd t0, -200(s0)
    ld t0, -32(s0)
    ld s1, -200(s0)
    and t0, t0, s1
    sd t0, -216(s0)
    ld t0, -216(s0)
    sd t0, -32(s0)
    li s1, 4
    li t0, 0x54
    div t0, t0, s1
    sd t0, -232(s0)
    ld a0, -24(s0)
    ld a1, -232(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -224(s0)
    ld a0, -224(s0)
    ld a1, -32(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li a0, 0
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_cell_alloc
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -240(s0)
    ld t0, -240(s0)
    sd t0, -40(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_nlr_push
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -248(s0)
    ld t0, -248(s0)
    sd t0, -48(s0)
    ld t0, -40(s0)
    sd t0, -448(s0)
    ld t0, -24(s0)
    sd t0, -440(s0)
    addi a2, s0, -448
    la a0, calynda_closure_dpu1_pll_configure_1080p60_lambda42
    li a1, 2
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_closure_new
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -256(s0)
    ld t0, -48(s0)
    sd t0, -448(s0)
    ld t0, -40(s0)
    sd t0, -440(s0)
    addi a2, s0, -448
    la a0, calynda_closure_dpu1_pll_configure_1080p60_nlr43
    li a1, 2
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_closure_new
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -264(s0)
    ld a0, -256(s0)
    ld a1, -264(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_while
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    ld a0, -48(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -272(s0)
    ld t6, -272(s0)
    bne t6, zero, .Lcalynda_unit_dpu1_pll_configure_1080p60_bb1
    j .Lcalynda_unit_dpu1_pll_configure_1080p60_bb2
.Lcalynda_unit_dpu1_pll_configure_1080p60_bb1:
    addi sp, sp, 496
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_dpu1_pll_configure_1080p60_bb2:
    li a0, 30
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_delay_us
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -280(s0)
    li s1, 4
    li t0, 0x1EC
    div t0, t0, s1
    sd t0, -304(s0)
    ld a0, -24(s0)
    ld a1, -304(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -296(s0)
    ld a0, -296(s0)
    li a1, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_deref_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -288(s0)
    ld t0, -288(s0)
    sd t0, -56(s0)
    li s1, 8
    li t0, 1
    sll t0, t0, s1
    sd t0, -320(s0)
    ld t0, -320(s0)
    not t0, t0
    sd t0, -312(s0)
    ld t0, -56(s0)
    ld s1, -312(s0)
    and t0, t0, s1
    sd t0, -328(s0)
    ld t0, -328(s0)
    sd t0, -56(s0)
    li s1, 4
    li t0, 0x1EC
    div t0, t0, s1
    sd t0, -344(s0)
    ld a0, -24(s0)
    ld a1, -344(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -336(s0)
    ld a0, -336(s0)
    ld a1, -56(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li a0, 1
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_delay_us
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -352(s0)
    li t0, 0xFF
    not t0, t0
    sd t0, -360(s0)
    ld t0, -56(s0)
    ld s1, -360(s0)
    and t0, t0, s1
    sd t0, -368(s0)
    ld t0, -368(s0)
    sd t0, -56(s0)
    ld t0, -56(s0)
    li s1, 8
    or t0, t0, s1
    sd t0, -376(s0)
    ld t0, -376(s0)
    sd t0, -56(s0)
    li s1, 4
    li t0, 0x1EC
    div t0, t0, s1
    sd t0, -392(s0)
    ld a0, -24(s0)
    ld a1, -392(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -384(s0)
    ld a0, -384(s0)
    ld a1, -56(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    li a0, 1
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call calynda_unit_delay_us
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -400(s0)
    li s1, 8
    li t0, 1
    sll t0, t0, s1
    sd t0, -408(s0)
    ld t0, -56(s0)
    ld s1, -408(s0)
    or t0, t0, s1
    sd t0, -416(s0)
    ld t0, -416(s0)
    sd t0, -56(s0)
    li s1, 4
    li t0, 0x1EC
    div t0, t0, s1
    sd t0, -432(s0)
    ld a0, -24(s0)
    ld a1, -432(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_offset_stride
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    mv t0, a0
    sd t0, -424(s0)
    ld a0, -424(s0)
    ld a1, -56(s0)
    li a2, 4
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_mmio_store_sized
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    sd t1, -456(s0)
    sd t2, -464(s0)
    sd t3, -472(s0)
    sd t4, -480(s0)
    sd t5, -488(s0)
    sd t6, -496(s0)
    call __calynda_rt_fence
    ld t6, -496(s0)
    ld t5, -488(s0)
    ld t4, -480(s0)
    ld t3, -472(s0)
    ld t2, -464(s0)
    ld t1, -456(s0)
    addi sp, sp, 496
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_vosys_clk_enable,"ax"
.globl calynda_unit_vosys_clk_enable
calynda_unit_vosys_clk_enable:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -304
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t0, 0xFFEF528000
    sd t0, -24(s0)
    li s1, 4
    li t0, 0x004
    div t2, t0, s1
    ld a0, -24(s0)
    mv a1, t2
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0x00000007
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x008
    div t4, t0, s1
    ld a0, -24(s0)
    mv a1, t4
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t3, a0
    mv a0, t3
    li a1, 0x00000001
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x00C
    div t6, t0, s1
    ld a0, -24(s0)
    mv a1, t6
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t5, a0
    mv a0, t5
    li a1, 0x00000001
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x014
    div t0, t0, s1
    sd t0, -40(s0)
    ld a0, -24(s0)
    ld a1, -40(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -32(s0)
    ld a0, -32(s0)
    li a1, 0x00000003
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x018
    div t0, t0, s1
    sd t0, -56(s0)
    ld a0, -24(s0)
    ld a1, -56(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -48(s0)
    ld a0, -48(s0)
    li a1, 0x00000003
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x020
    div t0, t0, s1
    sd t0, -72(s0)
    ld a0, -24(s0)
    ld a1, -72(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -64(s0)
    ld a0, -64(s0)
    li a1, 0x0000000F
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x050
    div t0, t0, s1
    sd t0, -88(s0)
    ld a0, -24(s0)
    ld a1, -88(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -80(s0)
    li a1, 0x7BFABFE5
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x054
    div t0, t0, s1
    sd t0, -104(s0)
    ld a0, -24(s0)
    ld a1, -104(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    li a1, 0x00000001
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x064
    div t0, t0, s1
    sd t0, -120(s0)
    ld a0, -24(s0)
    ld a1, -120(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -112(s0)
    ld a0, -112(s0)
    li a1, 0x00000014
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x070
    div t0, t0, s1
    sd t0, -136(s0)
    ld a0, -24(s0)
    ld a1, -136(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -128(s0)
    ld a0, -128(s0)
    li a1, 0x00000001
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x074
    div t0, t0, s1
    sd t0, -152(s0)
    ld a0, -24(s0)
    ld a1, -152(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -144(s0)
    ld a0, -144(s0)
    li a1, 0x00007130
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x078
    div t0, t0, s1
    sd t0, -168(s0)
    ld a0, -24(s0)
    ld a1, -168(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -160(s0)
    ld a0, -160(s0)
    li a1, 0x00007130
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x0A4
    div t0, t0, s1
    sd t0, -184(s0)
    ld a0, -24(s0)
    ld a1, -184(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -176(s0)
    ld a0, -176(s0)
    li a1, 0x000FF000
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x100
    div t0, t0, s1
    sd t0, -200(s0)
    ld a0, -24(s0)
    ld a1, -200(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -192(s0)
    ld a0, -192(s0)
    li a1, 0x00000001
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x108
    div t0, t0, s1
    sd t0, -216(s0)
    ld a0, -24(s0)
    ld a1, -216(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -208(s0)
    ld a0, -208(s0)
    li a1, 0x00000001
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x130
    div t0, t0, s1
    sd t0, -232(s0)
    ld a0, -24(s0)
    ld a1, -232(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -224(s0)
    ld a0, -224(s0)
    li a1, 0x00000001
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    li s1, 4
    li t0, 0x138
    div t0, t0, s1
    sd t0, -248(s0)
    ld a0, -24(s0)
    ld a1, -248(s0)
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_offset_stride
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    mv t0, a0
    sd t0, -240(s0)
    ld a0, -240(s0)
    li a1, 0x00000001
    li a2, 4
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_mmio_store_sized
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    sd t1, -256(s0)
    sd t2, -264(s0)
    sd t3, -272(s0)
    sd t4, -280(s0)
    sd t5, -288(s0)
    sd t6, -296(s0)
    call __calynda_rt_fence
    ld t6, -296(s0)
    ld t5, -288(s0)
    ld t4, -280(s0)
    ld t3, -272(s0)
    ld t2, -264(s0)
    ld t1, -256(s0)
    addi sp, sp, 304
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_forRange_lambda44,"ax"
.globl calynda_unit_forRange_lambda44
calynda_unit_forRange_lambda44:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld t0, 16(s11)
    sd t0, -40(s0)
    ld t0, -32(s0)
    sd t0, -48(s0)
    ld a0, -24(s0)
    li a1, 1
    addi a2, s0, -48
    sd t1, -56(s0)
    sd t2, -64(s0)
    call __calynda_rt_call_callable
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t1, a0
    ld t0, -32(s0)
    li s1, 1
    add t2, t0, s1
    mv a0, t2
    ld a1, -40(s0)
    ld a2, -24(s0)
    sd t1, -56(s0)
    sd t2, -64(s0)
    call calynda_unit_forRange
    ld t2, -64(s0)
    ld t1, -56(s0)
    li a0, 0
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_forRange,"ax"
.globl calynda_unit_forRange
calynda_unit_forRange:
    addi sp, sp, -40
    sd ra, 32(sp)
    sd s0, 24(sp)
    addi s0, sp, 40
    sd a0, 16(sp)
    sd a1, 8(sp)
    sd a2, 0(sp)
.Lcalynda_iter_forRange_loop:
    ld t0, 16(sp)
    ld t1, 8(sp)
    bge t0, t1, .Lcalynda_iter_forRange_done
    sd t0, -8(s0)
    ld a0, 0(sp)
    li a1, 1
    addi a2, s0, -8
    call __calynda_rt_call_callable
    ld t0, 16(sp)
    addi t0, t0, 1
    sd t0, 16(sp)
    j .Lcalynda_iter_forRange_loop
.Lcalynda_iter_forRange_done:
    li a0, 0
    ld s0, 24(sp)
    ld ra, 32(sp)
    addi sp, sp, 40
    ret
.section .text.calynda_unit_hdmi_phy_i2cm_write_once_lambda45,"ax"
.globl calynda_unit_hdmi_phy_i2cm_write_once_lambda45
calynda_unit_hdmi_phy_i2cm_write_once_lambda45:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -80
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -24(s0)
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    call __calynda_rt_cell_read
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t1, a0
    li s1, 50
    slt t2, t1, s1
    bne t2, zero, .Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda45_bb1
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda45_bb2
.Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda45_bb1:
    ld a0, -32(s0)
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    call __calynda_rt_cell_read
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t3, a0
    li s1, 0
    sub t4, t3, s1
    seqz t4, t4
    sd t4, -40(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda45_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda45_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda45_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda45_bb3:
    ld a0, -40(s0)
    addi sp, sp, 80
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47,"ax"
.globl calynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47
calynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -112
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld t0, 16(s11)
    sd t0, -40(s0)
    ld t0, 24(s11)
    sd t0, -48(s0)
    ld a0, -32(s0)
    li a1, 0x0108
    li a2, 4
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_offset_stride
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t1, a0
    ld a0, -40(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_rt_cell_read
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t2, a0
    mv a0, t1
    mv a1, t2
    li a2, 4
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_mmio_store_sized
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    ld a0, -40(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_rt_cell_read
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t3, a0
    li s1, 0x02
    and t4, t3, s1
    li s1, 0
    sub t5, t4, s1
    snez t5, t5
    bne t5, zero, .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47_bb1
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47_bb2
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47_bb1:
    li t0, 1
    sd t0, -56(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47_bb2:
    li t6, 1
    neg t6, t6
    sd t6, -56(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47_bb3:
    ld a0, -48(s0)
    ld a1, -56(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_rt_cell_write
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    addi sp, sp, 112
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_phy_i2cm_write_once_nlr46_lambda48,"ax"
.globl calynda_unit_hdmi_phy_i2cm_write_once_nlr46_lambda48
calynda_unit_hdmi_phy_i2cm_write_once_nlr46_lambda48:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld a0, -24(s0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_cell_read
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t1, a0
    li s1, 1
    add t2, t1, s1
    ld a0, -24(s0)
    mv a1, t2
    sd t1, -32(s0)
    sd t2, -40(s0)
    call __calynda_rt_cell_write
    ld t2, -40(s0)
    ld t1, -32(s0)
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_phy_i2cm_write_once_nlr46,"ax"
.globl calynda_unit_hdmi_phy_i2cm_write_once_nlr46
calynda_unit_hdmi_phy_i2cm_write_once_nlr46:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -192
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld t0, 16(s11)
    sd t0, -40(s0)
    ld t0, 24(s11)
    sd t0, -48(s0)
    li a0, 1000
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call calynda_unit_delay_us
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t1, a0
    ld a0, -32(s0)
    li a1, 0x0108
    li a2, 4
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_offset_stride
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t3, a0
    mv a0, t3
    li a1, 4
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_mmio_deref_sized
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t2, a0
    li s1, 0x03
    and t4, t2, s1
    mv a0, t4
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_rt_cell_alloc
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t5, a0
    sd t5, -56(s0)
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_rt_nlr_push
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t6, a0
    sd t6, -64(s0)
    ld a0, -56(s0)
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_rt_cell_read
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld t0, -72(s0)
    li s1, 0
    sub t0, t0, s1
    snez t0, t0
    sd t0, -80(s0)
    ld t0, -64(s0)
    sd t0, -144(s0)
    ld t0, -32(s0)
    sd t0, -136(s0)
    ld t0, -56(s0)
    sd t0, -128(s0)
    ld t0, -40(s0)
    sd t0, -120(s0)
    addi a2, s0, -144
    la a0, calynda_closure_hdmi_phy_i2cm_write_once_nlr46_nlr47
    li a1, 4
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_rt_closure_new
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld t0, -48(s0)
    sd t0, -144(s0)
    addi a2, s0, -144
    la a0, calynda_closure_hdmi_phy_i2cm_write_once_nlr46_lambda48
    li a1, 1
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_rt_closure_new
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -80(s0)
    ld a1, -88(s0)
    ld a2, -96(s0)
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call calynda_unit_if
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    ld a0, -64(s0)
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld t6, -104(s0)
    bne t6, zero, .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_bb1
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_bb2
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_bb1:
    ld a0, -64(s0)
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_rt_nlr_get_value
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    mv t0, a0
    sd t0, -112(s0)
    ld a0, -24(s0)
    ld a1, -112(s0)
    sd t1, -152(s0)
    sd t2, -160(s0)
    sd t3, -168(s0)
    sd t4, -176(s0)
    sd t5, -184(s0)
    sd t6, -192(s0)
    call __calynda_rt_nlr_invoke
    ld t6, -192(s0)
    ld t5, -184(s0)
    ld t4, -176(s0)
    ld t3, -168(s0)
    ld t2, -160(s0)
    ld t1, -152(s0)
    addi sp, sp, 192
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr46_bb2:
    addi sp, sp, 192
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_phy_i2cm_write_once,"ax"
.globl calynda_unit_hdmi_phy_i2cm_write_once
calynda_unit_hdmi_phy_i2cm_write_once:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -240
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    li t0, 0xFFEF540000
    sd t0, -40(s0)
    ld a0, -40(s0)
    li a1, 0x3021
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_offset_stride
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t1, a0
    mv a0, t1
    ld a1, -24(s0)
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_mmio_store_sized
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    ld a0, -40(s0)
    li a1, 0x3022
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_offset_stride
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t2, a0
    ld t0, -32(s0)
    li s1, 8
    srl t3, t0, s1
    li s1, 0xFF
    and t4, t3, s1
    mv a0, t2
    mv a1, t4
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_mmio_store_sized
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    ld a0, -40(s0)
    li a1, 0x3023
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_offset_stride
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t5, a0
    ld t0, -32(s0)
    li s1, 0xFF
    and t6, t0, s1
    mv a0, t5
    mv a1, t6
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_mmio_store_sized
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    ld a0, -40(s0)
    li a1, 0x0108
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_offset_stride
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld a0, -72(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_mmio_store_sized
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    ld a0, -40(s0)
    li a1, 0x3027
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_offset_stride
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -80(s0)
    li a1, 0x08
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_mmio_store_sized
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    ld a0, -40(s0)
    li a1, 0x3028
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_offset_stride
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld a0, -88(s0)
    li a1, 0x88
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_mmio_store_sized
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_fence
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    ld a0, -40(s0)
    li a1, 0x3026
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_offset_stride
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    li a1, 0x10
    li a2, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_mmio_store_sized
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_fence
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    li a0, 0
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_cell_alloc
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld t0, -104(s0)
    sd t0, -48(s0)
    li a0, 0
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_cell_alloc
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -112(s0)
    ld t0, -112(s0)
    sd t0, -56(s0)
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_nlr_push
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -120(s0)
    ld t0, -120(s0)
    sd t0, -64(s0)
    ld t0, -48(s0)
    sd t0, -192(s0)
    ld t0, -56(s0)
    sd t0, -184(s0)
    addi a2, s0, -192
    la a0, calynda_closure_hdmi_phy_i2cm_write_once_lambda45
    li a1, 2
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_closure_new
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -128(s0)
    ld t0, -64(s0)
    sd t0, -192(s0)
    ld t0, -40(s0)
    sd t0, -184(s0)
    ld t0, -56(s0)
    sd t0, -176(s0)
    ld t0, -48(s0)
    sd t0, -168(s0)
    addi a2, s0, -192
    la a0, calynda_closure_hdmi_phy_i2cm_write_once_nlr46
    li a1, 4
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_closure_new
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -136(s0)
    ld a0, -128(s0)
    ld a1, -136(s0)
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_117_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_117_loop
    call calynda_unit_while
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    ld a0, -64(s0)
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -144(s0)
    ld t6, -144(s0)
    bne t6, zero, .Lcalynda_unit_hdmi_phy_i2cm_write_once_bb1
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_bb2
.Lcalynda_unit_hdmi_phy_i2cm_write_once_bb1:
    ld a0, -64(s0)
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_nlr_get_value
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld a0, -152(s0)
    addi sp, sp, 240
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_hdmi_phy_i2cm_write_once_bb2:
    ld a0, -56(s0)
    sd t1, -200(s0)
    sd t2, -208(s0)
    sd t3, -216(s0)
    sd t4, -224(s0)
    sd t5, -232(s0)
    sd t6, -240(s0)
    call __calynda_rt_cell_read
    ld t6, -240(s0)
    ld t5, -232(s0)
    ld t4, -224(s0)
    ld t3, -216(s0)
    ld t2, -208(s0)
    ld t1, -200(s0)
    mv t0, a0
    sd t0, -160(s0)
    ld a0, -160(s0)
    addi sp, sp, 240
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_phy_i2cm_write_attempt_nlr49,"ax"
.globl calynda_unit_hdmi_phy_i2cm_write_attempt_nlr49
calynda_unit_hdmi_phy_i2cm_write_attempt_nlr49:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -32(s0)
    sd t1, -40(s0)
    call __calynda_rt_cell_read
    ld t1, -40(s0)
    mv t1, a0
    ld a0, -24(s0)
    mv a1, t1
    sd t1, -40(s0)
    call __calynda_rt_nlr_invoke
    ld t1, -40(s0)
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_phy_i2cm_write_attempt_lambda50,"ax"
.globl calynda_unit_hdmi_phy_i2cm_write_attempt_lambda50
calynda_unit_hdmi_phy_i2cm_write_attempt_lambda50:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -16
    sd t0, -24(s0)
    sd s1, -32(s0)
    addi sp, sp, 16
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_phy_i2cm_write_attempt,"ax"
.globl calynda_unit_hdmi_phy_i2cm_write_attempt
calynda_unit_hdmi_phy_i2cm_write_attempt:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -208
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb6
.Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb1:
    li t0, 1
    sd t0, -64(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb2:
    ld s1, -24(s0)
    li t0, 1
    slt t6, t0, s1
    xori t6, t6, 1
    sd t6, -64(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb3:
    ld t0, -56(s0)
    sd t0, -160(s0)
    ld t0, -48(s0)
    sd t0, -152(s0)
    addi a2, s0, -160
    la a0, calynda_closure_hdmi_phy_i2cm_write_attempt_nlr49
    li a1, 2
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_closure_new
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -96(s0)
    li a2, 0
    la a0, calynda_closure_hdmi_phy_i2cm_write_attempt_lambda50
    li a1, 0
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_closure_new
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld a0, -64(s0)
    ld a1, -96(s0)
    ld a2, -104(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_if
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    ld a0, -56(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -112(s0)
    ld t6, -112(s0)
    bne t6, zero, .Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb4
    j .Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb5
.Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb4:
    ld a0, -56(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_nlr_get_value
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -120(s0)
    ld a0, -120(s0)
    addi sp, sp, 208
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb5:
    li a0, 500
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_delay_us
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -128(s0)
    ld t0, -24(s0)
    li s1, 1
    sub t0, t0, s1
    sd t0, -144(s0)
    ld t0, -144(s0)
    sd t0, -72(s0)
    ld t0, -32(s0)
    sd t0, -80(s0)
    ld t0, -40(s0)
    sd t0, -88(s0)
    ld t0, -72(s0)
    sd t0, -24(s0)
    ld t0, -80(s0)
    sd t0, -32(s0)
    ld t0, -88(s0)
    sd t0, -40(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb6
.Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb6:
    ld a0, -32(s0)
    ld a1, -40(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_hdmi_phy_i2cm_write_once
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t1, a0
    mv a0, t1
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_cell_alloc
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t2, a0
    sd t2, -48(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_nlr_push
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t3, a0
    sd t3, -56(s0)
    ld a0, -48(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_cell_read
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t4, a0
    li s1, 1
    sub t5, t4, s1
    seqz t5, t5
    bne t5, zero, .Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb1
    j .Lcalynda_unit_hdmi_phy_i2cm_write_attempt_bb2
.section .text.calynda_unit_hdmi_phy_i2cm_write,"ax"
.globl calynda_unit_hdmi_phy_i2cm_write
calynda_unit_hdmi_phy_i2cm_write:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    li a0, 5
    ld a1, -24(s0)
    ld a2, -32(s0)
    sd t1, -40(s0)
    call calynda_unit_hdmi_phy_i2cm_write_attempt
    ld t1, -40(s0)
    mv t1, a0
    mv a0, t1
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_program_identity_csc_lambda51_lambda52,"ax"
.globl calynda_unit_hdmi_program_identity_csc_lambda51_lambda52
calynda_unit_hdmi_program_identity_csc_lambda51_lambda52:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -160
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    sd a0, -40(s0)
    la a0, calynda_global_HDMI_IDENTITY_CSC
    ld a0, 0(a0)
    ld a1, -24(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_index_load
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t2, a0
    mv a0, t2
    ld a1, -40(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_index_load
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t1, a0
    sd t1, -48(s0)
    la a0, calynda_global_HDMI_CSC_MSB_BASE
    ld a0, 0(a0)
    ld a1, -24(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_index_load
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t4, a0
    ld t0, -40(s0)
    li s1, 2
    mul t5, t0, s1
    add t6, t4, t5
    ld a0, -32(s0)
    mv a1, t6
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t3, a0
    ld t0, -48(s0)
    li s1, 8
    sra t0, t0, s1
    sd t0, -56(s0)
    ld t0, -56(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -64(s0)
    mv a0, t3
    ld a1, -64(s0)
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    la a0, calynda_global_HDMI_CSC_LSB_BASE
    ld a0, 0(a0)
    ld a1, -24(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_index_load
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld t0, -40(s0)
    li s1, 2
    mul t0, t0, s1
    sd t0, -88(s0)
    ld t0, -80(s0)
    ld s1, -88(s0)
    add t0, t0, s1
    sd t0, -96(s0)
    ld a0, -32(s0)
    ld a1, -96(s0)
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld t0, -48(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -104(s0)
    ld a0, -72(s0)
    ld a1, -104(s0)
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    addi sp, sp, 160
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_program_identity_csc_lambda51,"ax"
.globl calynda_unit_hdmi_program_identity_csc_lambda51
calynda_unit_hdmi_program_identity_csc_lambda51:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    sd a0, -32(s0)
    ld t0, -32(s0)
    sd t0, -48(s0)
    ld t0, -24(s0)
    sd t0, -40(s0)
    addi a2, s0, -48
    la a0, calynda_closure_hdmi_program_identity_csc_lambda51_lambda52
    li a1, 2
    sd t1, -56(s0)
    call __calynda_rt_closure_new
    ld t1, -56(s0)
    mv t1, a0
    li a0, 0
    li a1, 4
    mv a2, t1
    sd t1, -56(s0)
    call calynda_unit_forRange
    ld t1, -56(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_program_identity_csc,"ax"
.globl calynda_unit_hdmi_program_identity_csc
calynda_unit_hdmi_program_identity_csc:
    addi sp, sp, -16
    sd ra, 8(sp)
    call __calynda_rt_hdmi_program_identity_csc
    li a0, 0
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_clear_overflow_lambda53,"ax"
.globl calynda_unit_hdmi_clear_overflow_lambda53
calynda_unit_hdmi_clear_overflow_lambda53:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    sd a0, -40(s0)
    ld a0, -24(s0)
    li a1, 0x1000
    li a2, 4
    sd t1, -48(s0)
    sd t2, -56(s0)
    call __calynda_offset_stride
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t1, a0
    ld a0, -32(s0)
    sd t1, -48(s0)
    sd t2, -56(s0)
    call __calynda_rt_cell_read
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t2, a0
    mv a0, t1
    mv a1, t2
    li a2, 4
    sd t1, -48(s0)
    sd t2, -56(s0)
    call __calynda_mmio_store_sized
    ld t2, -56(s0)
    ld t1, -48(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_clear_overflow,"ax"
.globl calynda_unit_hdmi_clear_overflow
calynda_unit_hdmi_clear_overflow:
    addi sp, sp, -16
    sd ra, 8(sp)
    call __calynda_rt_hdmi_clear_overflow
    li a0, 0
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_program_hdcp_video_polarity,"ax"
.globl calynda_unit_hdmi_program_hdcp_video_polarity
calynda_unit_hdmi_program_hdcp_video_polarity:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t0, 0xFFEF540000
    sd t0, -24(s0)
    ld a0, -24(s0)
    li a1, 0x5000
    li a2, 4
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    call __calynda_offset_stride
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0x01
    li a2, 4
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    call __calynda_mmio_store_sized
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    ld a0, -24(s0)
    li a1, 0x5001
    li a2, 4
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    call __calynda_offset_stride
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t2, a0
    mv a0, t2
    li a1, 0x02
    li a2, 4
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    call __calynda_mmio_store_sized
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    ld a0, -24(s0)
    li a1, 0x5009
    li a2, 4
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    call __calynda_offset_stride
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t3, a0
    mv a0, t3
    li a1, 0x1A
    li a2, 4
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    call __calynda_mmio_store_sized
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    call __calynda_rt_fence
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_program_video_path,"ax"
.globl calynda_unit_hdmi_program_video_path
calynda_unit_hdmi_program_video_path:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -352
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    li a1, 0x4001
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0x00
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x4006
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t2, a0
    mv a0, t2
    li a1, 0x71
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_rt_fence
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    li a0, 100
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call calynda_unit_delay_us
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t3, a0
    ld a0, -24(s0)
    li a1, 0x0200
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t4, a0
    mv a0, t4
    li a1, 0x01
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0201
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t5, a0
    mv a0, t5
    li a1, 0x07
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0202
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t6, a0
    mv a0, t6
    li a1, 0x00
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0203
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -32(s0)
    ld a0, -32(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0204
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -40(s0)
    ld a0, -40(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0205
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -48(s0)
    ld a0, -48(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0206
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -56(s0)
    ld a0, -56(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0207
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -64(s0)
    ld a0, -64(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0801
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld a0, -72(s0)
    li a1, 0x40
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0802
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -80(s0)
    li a1, 0x27
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0804
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld a0, -88(s0)
    li a1, 0x47
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x0807
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_rt_fence
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_112_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_112_loop
    call calynda_unit_hdmi_program_identity_csc
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1000
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld a0, -104(s0)
    li a1, 0x78
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1001
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -112(s0)
    ld a0, -112(s0)
    li a1, 0x80
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1002
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -120(s0)
    ld a0, -120(s0)
    li a1, 0x07
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1003
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -128(s0)
    ld a0, -128(s0)
    li a1, 0x18
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1004
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -136(s0)
    ld a0, -136(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1005
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -144(s0)
    ld a0, -144(s0)
    li a1, 0x38
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1006
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld a0, -152(s0)
    li a1, 0x04
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1007
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -160(s0)
    ld a0, -160(s0)
    li a1, 0x2D
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1008
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -168(s0)
    ld a0, -168(s0)
    li a1, 0x58
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1009
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -176(s0)
    ld a0, -176(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x100A
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -184(s0)
    ld a0, -184(s0)
    li a1, 0x2C
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x100B
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -192(s0)
    ld a0, -192(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x100C
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -200(s0)
    ld a0, -200(s0)
    li a1, 0x04
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x100D
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -208(s0)
    ld a0, -208(s0)
    li a1, 0x05
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1011
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -216(s0)
    ld a0, -216(s0)
    li a1, 0x0C
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1012
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -224(s0)
    ld a0, -224(s0)
    li a1, 0x20
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1013
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -232(s0)
    ld a0, -232(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1014
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -240(s0)
    ld a0, -240(s0)
    li a1, 0x0B
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1015
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -248(s0)
    ld a0, -248(s0)
    li a1, 0x16
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1016
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -256(s0)
    ld a0, -256(s0)
    li a1, 0x21
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x1019
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -264(s0)
    ld a0, -264(s0)
    li a1, 0x60
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x101A
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -272(s0)
    ld a0, -272(s0)
    li a1, 0x28
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x101B
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -280(s0)
    ld a0, -280(s0)
    li a1, 0x04
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x101C
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -288(s0)
    ld a0, -288(s0)
    li a1, 0x10
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_rt_fence
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    ld a0, -24(s0)
    li a1, 0x4002
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_offset_stride
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -296(s0)
    ld a0, -296(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_mmio_store_sized
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call __calynda_rt_fence
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    li a0, 100
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    call calynda_unit_delay_us
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    mv t0, a0
    sd t0, -304(s0)
    sd t1, -312(s0)
    sd t2, -320(s0)
    sd t3, -328(s0)
    sd t4, -336(s0)
    sd t5, -344(s0)
    sd t6, -352(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_113_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_113_loop
    call calynda_unit_hdmi_clear_overflow
    ld t6, -352(s0)
    ld t5, -344(s0)
    ld t4, -336(s0)
    ld t3, -328(s0)
    ld t2, -320(s0)
    ld t1, -312(s0)
    addi sp, sp, 352
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_seed_phy_window,"ax"
.globl calynda_unit_hdmi_seed_phy_window
calynda_unit_hdmi_seed_phy_window:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -160
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    li a1, 0x3029
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0x0B
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x302A
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t2, a0
    mv a0, t2
    li a1, 0x00
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_fence
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    li a0, 100
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call calynda_unit_delay_us
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t3, a0
    ld a0, -24(s0)
    li a1, 0x302A
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t4, a0
    mv a0, t4
    li a1, 0x01
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_fence
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    li a0, 100
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call calynda_unit_delay_us
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t5, a0
    ld a0, -24(s0)
    li a1, 0x302B
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t6, a0
    mv a0, t6
    li a1, 0x00
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x302C
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -32(s0)
    ld a0, -32(s0)
    li a1, 0x7F
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x302D
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -40(s0)
    ld a0, -40(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x302E
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -48(s0)
    ld a0, -48(s0)
    li a1, 0x7F
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x302F
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -56(s0)
    ld a0, -56(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x3030
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -64(s0)
    ld a0, -64(s0)
    li a1, 0x35
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x3031
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld a0, -72(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x3032
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -80(s0)
    li a1, 0x7F
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x3033
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld a0, -88(s0)
    li a1, 0x08
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x3027
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    li a1, 0x08
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -24(s0)
    li a1, 0x3028
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_offset_stride
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld a0, -104(s0)
    li a1, 0x88
    li a2, 4
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_mmio_store_sized
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_fence
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    addi sp, sp, 160
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_program_video_path_final,"ax"
.globl calynda_unit_hdmi_program_video_path_final
calynda_unit_hdmi_program_video_path_final:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -352
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    ld a0, -24(s0)
    li a1, 0x4001
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x4006
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t2, a0
    mv a0, t2
    li a1, 0x71
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0200
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t3, a0
    mv a0, t3
    li a1, 0x01
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0201
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t4, a0
    mv a0, t4
    li a1, 0x07
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0202
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t5, a0
    mv a0, t5
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0203
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t6, a0
    mv a0, t6
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0204
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -32(s0)
    ld a0, -32(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0205
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -40(s0)
    ld a0, -40(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0206
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -48(s0)
    ld a0, -48(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0207
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -56(s0)
    ld a0, -56(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0801
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -64(s0)
    ld a0, -64(s0)
    li a1, 0x40
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0802
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld a0, -72(s0)
    li a1, 0x27
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0803
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -80(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0804
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld a0, -88(s0)
    li a1, 0x47
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x0807
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_rt_fence
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_114_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_114_loop
    call calynda_unit_hdmi_program_identity_csc
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1000
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld a0, -104(s0)
    li a1, 0x78
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1001
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -112(s0)
    ld a0, -112(s0)
    li a1, 0x80
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1002
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -120(s0)
    ld a0, -120(s0)
    li a1, 0x07
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1003
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -128(s0)
    ld a0, -128(s0)
    li a1, 0x18
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1004
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -136(s0)
    ld a0, -136(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1005
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -144(s0)
    ld a0, -144(s0)
    li a1, 0x38
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1006
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld a0, -152(s0)
    li a1, 0x04
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1007
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -160(s0)
    ld a0, -160(s0)
    li a1, 0x2D
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1008
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -168(s0)
    ld a0, -168(s0)
    li a1, 0x58
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1009
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -176(s0)
    ld a0, -176(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x100A
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -184(s0)
    ld a0, -184(s0)
    li a1, 0x2C
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x100B
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -192(s0)
    ld a0, -192(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x100C
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -200(s0)
    ld a0, -200(s0)
    li a1, 0x04
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x100D
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -208(s0)
    ld a0, -208(s0)
    li a1, 0x05
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1011
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -216(s0)
    ld a0, -216(s0)
    li a1, 0x0C
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1012
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -224(s0)
    ld a0, -224(s0)
    li a1, 0x20
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1013
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -232(s0)
    ld a0, -232(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1014
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -240(s0)
    ld a0, -240(s0)
    li a1, 0x0B
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1015
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -248(s0)
    ld a0, -248(s0)
    li a1, 0x16
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1016
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -256(s0)
    ld a0, -256(s0)
    li a1, 0x21
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x1019
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -264(s0)
    ld a0, -264(s0)
    li a1, 0x60
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x101A
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -272(s0)
    ld a0, -272(s0)
    li a1, 0x28
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x101B
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -280(s0)
    ld a0, -280(s0)
    li a1, 0x04
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x101C
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -288(s0)
    ld a0, -288(s0)
    li a1, 0x10
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_rt_fence
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_115_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_115_loop
    call calynda_unit_hdmi_program_hdcp_video_polarity
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    ld a0, -24(s0)
    li a1, 0x4002
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_offset_stride
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    mv t0, a0
    sd t0, -296(s0)
    ld a0, -296(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_mmio_store_sized
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    call __calynda_rt_fence
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    sd t1, -304(s0)
    sd t2, -312(s0)
    sd t3, -320(s0)
    sd t4, -328(s0)
    sd t5, -336(s0)
    sd t6, -344(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_116_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_116_loop
    call calynda_unit_hdmi_clear_overflow
    ld t6, -344(s0)
    ld t5, -336(s0)
    ld t4, -328(s0)
    ld t3, -320(s0)
    ld t2, -312(s0)
    ld t1, -304(s0)
    addi sp, sp, 352
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dw_hdmi_init_lambda54,"ax"
.globl calynda_unit_dw_hdmi_init_lambda54
calynda_unit_dw_hdmi_init_lambda54:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -96
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -24(s0)
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    sd t5, -80(s0)
    sd t6, -88(s0)
    call __calynda_rt_cell_read
    ld t6, -88(s0)
    ld t5, -80(s0)
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t1, a0
    li s1, 200
    slt t2, t1, s1
    bne t2, zero, .Lcalynda_unit_dw_hdmi_init_lambda54_bb1
    j .Lcalynda_unit_dw_hdmi_init_lambda54_bb2
.Lcalynda_unit_dw_hdmi_init_lambda54_bb1:
    ld a0, -32(s0)
    li a1, 0x3004
    li a2, 4
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    sd t5, -80(s0)
    sd t6, -88(s0)
    call __calynda_offset_stride
    ld t6, -88(s0)
    ld t5, -80(s0)
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t4, a0
    mv a0, t4
    li a1, 4
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    sd t5, -80(s0)
    sd t6, -88(s0)
    call __calynda_mmio_deref_sized
    ld t6, -88(s0)
    ld t5, -80(s0)
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t3, a0
    li s1, 0x01
    and t5, t3, s1
    li s1, 0
    sub t6, t5, s1
    seqz t6, t6
    sd t6, -40(s0)
    j .Lcalynda_unit_dw_hdmi_init_lambda54_bb3
.Lcalynda_unit_dw_hdmi_init_lambda54_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_dw_hdmi_init_lambda54_bb3
.Lcalynda_unit_dw_hdmi_init_lambda54_bb3:
    ld a0, -40(s0)
    addi sp, sp, 96
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dw_hdmi_init_nlr55,"ax"
.globl calynda_unit_dw_hdmi_init_nlr55
calynda_unit_dw_hdmi_init_nlr55:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    li a0, 1000
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call calynda_unit_delay_us
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    ld a0, -32(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    li s1, 1
    add t3, t2, s1
    ld a0, -32(s0)
    mv a1, t3
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_write
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dw_hdmi_init_nlr56,"ax"
.globl calynda_unit_dw_hdmi_init_nlr56
calynda_unit_dw_hdmi_init_nlr56:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -208
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -32(s0)
    li a1, 0x3000
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_offset_stride
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0x36
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_mmio_store_sized
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    li a0, 5000
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_delay_us
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t2, a0
    ld a0, -32(s0)
    li a1, 0x4005
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_offset_stride
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t3, a0
    mv a0, t3
    li a1, 0x01
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_mmio_store_sized
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    li a0, 200
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_delay_us
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t4, a0
    ld a0, -32(s0)
    li a1, 0x4005
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_offset_stride
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t5, a0
    mv a0, t5
    li a1, 0x00
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_mmio_store_sized
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    li a0, 10000
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_delay_us
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t6, a0
    ld a0, -32(s0)
    li a1, 0x4007
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_offset_stride
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -40(s0)
    ld a0, -40(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_mmio_store_sized
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    ld a0, -32(s0)
    li a1, 0x3001
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_offset_stride
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -48(s0)
    ld a0, -48(s0)
    li a1, 0x20
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_mmio_store_sized
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    li a0, 100
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_delay_us
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -56(s0)
    ld a0, -32(s0)
    li a1, 0x3020
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_offset_stride
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -64(s0)
    ld a0, -64(s0)
    li a1, 0x69
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_mmio_store_sized
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    li a0, 100
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_delay_us
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld a0, -32(s0)
    li a1, 0x3001
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_offset_stride
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -80(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_mmio_store_sized
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    li a0, 1000
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_delay_us
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld a0, -32(s0)
    li a1, 0x0108
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_offset_stride
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_mmio_store_sized
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    li a0, 0x06
    li a1, 0x0001
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -104(s0)
    li a0, 0x10
    li a1, 0x2080
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -112(s0)
    li a0, 0x11
    li a1, 0x020A
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -120(s0)
    li a0, 0x19
    li a1, 0x0007
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -128(s0)
    li a0, 0x0E
    li a1, 0x01A0
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -136(s0)
    li a0, 0x09
    li a1, 0x8088
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -144(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    li a0, 1000
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call calynda_unit_delay_us
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld a0, -32(s0)
    li a1, 0x3000
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_offset_stride
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    mv t0, a0
    sd t0, -160(s0)
    ld a0, -160(s0)
    li a1, 0x2E
    li a2, 4
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_mmio_store_sized
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    sd t1, -168(s0)
    sd t2, -176(s0)
    sd t3, -184(s0)
    sd t4, -192(s0)
    sd t5, -200(s0)
    sd t6, -208(s0)
    call __calynda_rt_fence
    ld t6, -208(s0)
    ld t5, -200(s0)
    ld t4, -192(s0)
    ld t3, -184(s0)
    ld t2, -176(s0)
    ld t1, -168(s0)
    addi sp, sp, 208
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dw_hdmi_init_lambda57,"ax"
.globl calynda_unit_dw_hdmi_init_lambda57
calynda_unit_dw_hdmi_init_lambda57:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -16
    sd t0, -24(s0)
    sd s1, -32(s0)
    addi sp, sp, 16
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dw_hdmi_init_lambda58,"ax"
.globl calynda_unit_dw_hdmi_init_lambda58
calynda_unit_dw_hdmi_init_lambda58:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -96
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -24(s0)
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    sd t5, -80(s0)
    sd t6, -88(s0)
    call __calynda_rt_cell_read
    ld t6, -88(s0)
    ld t5, -80(s0)
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t1, a0
    li s1, 1000
    slt t2, t1, s1
    bne t2, zero, .Lcalynda_unit_dw_hdmi_init_lambda58_bb1
    j .Lcalynda_unit_dw_hdmi_init_lambda58_bb2
.Lcalynda_unit_dw_hdmi_init_lambda58_bb1:
    ld a0, -32(s0)
    li a1, 0x3004
    li a2, 4
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    sd t5, -80(s0)
    sd t6, -88(s0)
    call __calynda_offset_stride
    ld t6, -88(s0)
    ld t5, -80(s0)
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t4, a0
    mv a0, t4
    li a1, 4
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    sd t5, -80(s0)
    sd t6, -88(s0)
    call __calynda_mmio_deref_sized
    ld t6, -88(s0)
    ld t5, -80(s0)
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t3, a0
    li s1, 0x01
    and t5, t3, s1
    li s1, 0
    sub t6, t5, s1
    seqz t6, t6
    sd t6, -40(s0)
    j .Lcalynda_unit_dw_hdmi_init_lambda58_bb3
.Lcalynda_unit_dw_hdmi_init_lambda58_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_dw_hdmi_init_lambda58_bb3
.Lcalynda_unit_dw_hdmi_init_lambda58_bb3:
    ld a0, -40(s0)
    addi sp, sp, 96
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dw_hdmi_init_nlr59,"ax"
.globl calynda_unit_dw_hdmi_init_nlr59
calynda_unit_dw_hdmi_init_nlr59:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    li a0, 1000
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call calynda_unit_delay_us
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    ld a0, -32(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    li s1, 1
    add t3, t2, s1
    ld a0, -32(s0)
    mv a1, t3
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_write
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dw_hdmi_init,"ax"
.globl calynda_unit_dw_hdmi_init
calynda_unit_dw_hdmi_init:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -608
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t0, 0xFFEF540000
    sd t0, -24(s0)
    ld a0, -24(s0)
    li a1, 0x0180
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x0181
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t2, a0
    mv a0, t2
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x0182
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t3, a0
    mv a0, t3
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x0183
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t4, a0
    mv a0, t4
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x0184
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t5, a0
    mv a0, t5
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x0185
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t6, a0
    mv a0, t6
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x0186
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -80(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x0187
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld a0, -88(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x0188
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x01FF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld a0, -104(s0)
    li a1, 0x03
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_119_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_119_loop
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_101_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_101_loop
    call calynda_unit_hdmi_program_video_path
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    li a0, 1000
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_delay_us
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -112(s0)
    ld a0, -24(s0)
    li a1, 0x3000
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -120(s0)
    ld a0, -120(s0)
    li a1, 0x36
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x4005
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -128(s0)
    ld a0, -128(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    li a0, 200
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_delay_us
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -136(s0)
    ld a0, -24(s0)
    li a1, 0x4005
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -144(s0)
    ld a0, -144(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    li a0, 50000
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_delay_us
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld a0, -24(s0)
    li a1, 0x4007
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -160(s0)
    ld a0, -160(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x3001
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -168(s0)
    ld a0, -168(s0)
    li a1, 0x20
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    li a0, 100
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_delay_us
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -176(s0)
    ld a0, -24(s0)
    li a1, 0x3020
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -184(s0)
    ld a0, -184(s0)
    li a1, 0x69
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    li a0, 100
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_delay_us
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -192(s0)
    ld a0, -24(s0)
    li a1, 0x3001
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -200(s0)
    ld a0, -200(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    li a0, 1000
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_delay_us
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -208(s0)
    ld a0, -24(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_102_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_102_loop
    call calynda_unit_hdmi_seed_phy_window
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    li a0, 1000
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_delay_us
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -216(s0)
    ld a0, -24(s0)
    li a1, 0x0108
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -224(s0)
    ld a0, -224(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -24(s0)
    li a1, 0x3020
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -240(s0)
    ld a0, -240(s0)
    li a1, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_deref_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -232(s0)
    ld t0, -232(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -248(s0)
    ld s1, -248(s0)
    la t0, calynda_global_hdmi_diag0
    sd s1, 0(t0)
    ld a0, -24(s0)
    li a1, 0x3029
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -264(s0)
    ld a0, -264(s0)
    li a1, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_deref_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -256(s0)
    ld t0, -256(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -272(s0)
    ld s1, -272(s0)
    la t0, calynda_global_hdmi_diag1
    sd s1, 0(t0)
    ld a0, -24(s0)
    li a1, 0x4001
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -288(s0)
    ld a0, -288(s0)
    li a1, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_deref_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -280(s0)
    ld t0, -280(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -296(s0)
    ld s1, -296(s0)
    la t0, calynda_global_hdmi_diag2
    sd s1, 0(t0)
    li a0, 0x06
    li a1, 0x0001
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_103_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_103_loop
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -304(s0)
    li a0, 0x10
    li a1, 0x2080
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_104_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_104_loop
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -312(s0)
    li a0, 0x11
    li a1, 0x020A
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_105_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_105_loop
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -320(s0)
    li a0, 0x19
    li a1, 0x0007
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_106_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_106_loop
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -328(s0)
    li a0, 0x0E
    li a1, 0x01A0
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_107_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_107_loop
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -336(s0)
    li a0, 0x09
    li a1, 0x8088
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_108_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_108_loop
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -344(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    li a0, 1000
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_delay_us
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -352(s0)
    ld a0, -24(s0)
    li a1, 0x3000
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -360(s0)
    ld a0, -360(s0)
    li a1, 0x2E
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_store_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_fence
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    li a0, 0
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_cell_alloc
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -368(s0)
    ld t0, -368(s0)
    sd t0, -32(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_nlr_push
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -376(s0)
    ld t0, -376(s0)
    sd t0, -40(s0)
    ld t0, -32(s0)
    sd t0, -552(s0)
    ld t0, -24(s0)
    sd t0, -544(s0)
    addi a2, s0, -552
    la a0, calynda_closure_dw_hdmi_init_lambda54
    li a1, 2
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_closure_new
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -384(s0)
    ld t0, -40(s0)
    sd t0, -552(s0)
    ld t0, -32(s0)
    sd t0, -544(s0)
    addi a2, s0, -552
    la a0, calynda_closure_dw_hdmi_init_nlr55
    li a1, 2
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_closure_new
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -392(s0)
    ld a0, -384(s0)
    ld a1, -392(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_109_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_109_loop
    call calynda_unit_while
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -40(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -400(s0)
    ld t6, -400(s0)
    bne t6, zero, .Lcalynda_unit_dw_hdmi_init_bb1
    j .Lcalynda_unit_dw_hdmi_init_bb2
.Lcalynda_unit_dw_hdmi_init_bb1:
    addi sp, sp, 608
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_dw_hdmi_init_bb2:
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_nlr_push
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -408(s0)
    ld t0, -408(s0)
    sd t0, -48(s0)
    ld a0, -24(s0)
    li a1, 0x3004
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -424(s0)
    ld a0, -424(s0)
    li a1, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_deref_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -416(s0)
    ld t0, -416(s0)
    li s1, 0x01
    and t0, t0, s1
    sd t0, -432(s0)
    ld t0, -432(s0)
    li s1, 0
    sub t0, t0, s1
    seqz t0, t0
    sd t0, -440(s0)
    ld t0, -48(s0)
    sd t0, -552(s0)
    ld t0, -24(s0)
    sd t0, -544(s0)
    addi a2, s0, -552
    la a0, calynda_closure_dw_hdmi_init_nlr56
    li a1, 2
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_closure_new
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -448(s0)
    li a2, 0
    la a0, calynda_closure_dw_hdmi_init_lambda57
    li a1, 0
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_closure_new
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -456(s0)
    ld a0, -440(s0)
    ld a1, -448(s0)
    ld a2, -456(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_if
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -48(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -464(s0)
    ld t6, -464(s0)
    bne t6, zero, .Lcalynda_unit_dw_hdmi_init_bb3
    j .Lcalynda_unit_dw_hdmi_init_bb4
.Lcalynda_unit_dw_hdmi_init_bb3:
    addi sp, sp, 608
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_dw_hdmi_init_bb4:
    li a0, 0
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_cell_alloc
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -472(s0)
    ld t0, -472(s0)
    sd t0, -56(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_nlr_push
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -480(s0)
    ld t0, -480(s0)
    sd t0, -64(s0)
    ld t0, -56(s0)
    sd t0, -552(s0)
    ld t0, -24(s0)
    sd t0, -544(s0)
    addi a2, s0, -552
    la a0, calynda_closure_dw_hdmi_init_lambda58
    li a1, 2
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_closure_new
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -488(s0)
    ld t0, -64(s0)
    sd t0, -552(s0)
    ld t0, -56(s0)
    sd t0, -544(s0)
    addi a2, s0, -552
    la a0, calynda_closure_dw_hdmi_init_nlr59
    li a1, 2
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_closure_new
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -496(s0)
    ld a0, -488(s0)
    ld a1, -496(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_110_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_110_loop
    call calynda_unit_while
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld a0, -64(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -504(s0)
    ld t6, -504(s0)
    bne t6, zero, .Lcalynda_unit_dw_hdmi_init_bb5
    j .Lcalynda_unit_dw_hdmi_init_bb6
.Lcalynda_unit_dw_hdmi_init_bb5:
    addi sp, sp, 608
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_dw_hdmi_init_bb6:
    ld a0, -24(s0)
    li a1, 0x3004
    li a2, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_offset_stride
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -520(s0)
    ld a0, -520(s0)
    li a1, 4
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call __calynda_mmio_deref_sized
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -512(s0)
    ld t0, -512(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -528(s0)
    ld t0, -528(s0)
    sd t0, -72(s0)
    li a0, 5000
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    call calynda_unit_delay_us
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    mv t0, a0
    sd t0, -536(s0)
    ld a0, -24(s0)
    sd t1, -560(s0)
    sd t2, -568(s0)
    sd t3, -576(s0)
    sd t4, -584(s0)
    sd t5, -592(s0)
    sd t6, -600(s0)
    li t5, 200000
.Lcalynda_hdmi_settle_111_loop:
    addi t5, t5, -1
    bnez t5, .Lcalynda_hdmi_settle_111_loop
    call calynda_unit_hdmi_program_video_path_final
    ld t6, -600(s0)
    ld t5, -592(s0)
    ld t4, -584(s0)
    ld t3, -576(s0)
    ld t2, -568(s0)
    ld t1, -560(s0)
    ld s1, -72(s0)
    la t0, calynda_global_hdmi_diag1
    sd s1, 0(t0)
    addi sp, sp, 608
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_dc8200_init,"ax"
.globl calynda_unit_dc8200_init
calynda_unit_dc8200_init:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -848
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t0, 0xFFEF600000
    sd t0, -24(s0)
    li s1, 4
    li t0, 0x1CC0
    div t2, t0, s1
    ld a0, -24(s0)
    mv a1, t2
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0x00000000
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1CC4
    div t4, t0, s1
    ld a0, -24(s0)
    mv a1, t4
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t3, a0
    mv a0, t3
    li a1, 0x00000000
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_rt_fence
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1CD0
    div t6, t0, s1
    ld a0, -24(s0)
    mv a1, t6
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t5, a0
    li s1, 4
    li t0, 0x1CD0
    div t0, t0, s1
    sd t0, -56(s0)
    ld a0, -24(s0)
    ld a1, -56(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -48(s0)
    ld a0, -48(s0)
    li a1, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_deref_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -40(s0)
    li s1, 3
    li t0, 1
    sll t0, t0, s1
    sd t0, -72(s0)
    ld t0, -72(s0)
    not t0, t0
    sd t0, -64(s0)
    ld t0, -40(s0)
    ld s1, -64(s0)
    and t0, t0, s1
    sd t0, -80(s0)
    mv a0, t5
    ld a1, -80(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1CD4
    div t0, t0, s1
    sd t0, -96(s0)
    ld a0, -24(s0)
    ld a1, -96(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -88(s0)
    li s1, 4
    li t0, 0x1CD4
    div t0, t0, s1
    sd t0, -120(s0)
    ld a0, -24(s0)
    ld a1, -120(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -112(s0)
    ld a0, -112(s0)
    li a1, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_deref_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -104(s0)
    li s1, 3
    li t0, 1
    sll t0, t0, s1
    sd t0, -136(s0)
    ld t0, -136(s0)
    not t0, t0
    sd t0, -128(s0)
    ld t0, -104(s0)
    ld s1, -128(s0)
    and t0, t0, s1
    sd t0, -144(s0)
    ld a0, -88(s0)
    ld a1, -144(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_rt_fence
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1418
    div t0, t0, s1
    sd t0, -160(s0)
    ld a0, -24(s0)
    ld a1, -160(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld a0, -152(s0)
    li a1, 0x00001111
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x141C
    div t0, t0, s1
    sd t0, -176(s0)
    ld a0, -24(s0)
    ld a1, -176(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -168(s0)
    ld a0, -168(s0)
    li a1, 0x00001111
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x14B8
    div t0, t0, s1
    sd t0, -192(s0)
    ld a0, -24(s0)
    ld a1, -192(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -184(s0)
    ld a0, -184(s0)
    li a1, 5
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x14BC
    div t0, t0, s1
    sd t0, -208(s0)
    ld a0, -24(s0)
    ld a1, -208(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -200(s0)
    ld a0, -200(s0)
    li a1, 5
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1430
    div t0, t0, s1
    sd t0, -224(s0)
    ld a0, -24(s0)
    ld a1, -224(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -216(s0)
    ld a0, -216(s0)
    li a1, 0x08980780
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1434
    div t0, t0, s1
    sd t0, -240(s0)
    ld a0, -24(s0)
    ld a1, -240(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -232(s0)
    ld a0, -232(s0)
    li a1, 0x08980780
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1438
    div t0, t0, s1
    sd t0, -256(s0)
    ld a0, -24(s0)
    ld a1, -256(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -248(s0)
    ld a0, -248(s0)
    li a1, 0x440207D8
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x143C
    div t0, t0, s1
    sd t0, -272(s0)
    ld a0, -24(s0)
    ld a1, -272(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -264(s0)
    ld a0, -264(s0)
    li a1, 0x440207D8
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1440
    div t0, t0, s1
    sd t0, -288(s0)
    ld a0, -24(s0)
    ld a1, -288(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -280(s0)
    ld a0, -280(s0)
    li a1, 0x04650438
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1444
    div t0, t0, s1
    sd t0, -304(s0)
    ld a0, -24(s0)
    ld a1, -304(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -296(s0)
    ld a0, -296(s0)
    li a1, 0x04650438
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1448
    div t0, t0, s1
    sd t0, -320(s0)
    ld a0, -24(s0)
    ld a1, -320(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -312(s0)
    ld a0, -312(s0)
    li a1, 0x4220843C
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x144C
    div t0, t0, s1
    sd t0, -336(s0)
    ld a0, -24(s0)
    ld a1, -336(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -328(s0)
    ld a0, -328(s0)
    li a1, 0x4220843C
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1528
    div t0, t0, s1
    sd t0, -352(s0)
    ld a0, -24(s0)
    ld a1, -352(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -344(s0)
    li a0, 0x00
    li a1, 0x00
    li a2, 0xFF
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call calynda_unit_RGB
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -360(s0)
    ld a0, -344(s0)
    ld a1, -360(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x152C
    div t0, t0, s1
    sd t0, -376(s0)
    ld a0, -24(s0)
    ld a1, -376(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -368(s0)
    li a0, 0x00
    li a1, 0xFF
    li a2, 0x00
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call calynda_unit_RGB
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -384(s0)
    ld a0, -368(s0)
    ld a1, -384(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_rt_fence
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1404
    div t0, t0, s1
    sd t0, -400(s0)
    ld a0, -24(s0)
    ld a1, -400(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -392(s0)
    ld a0, -392(s0)
    li a1, 0x04200000
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x140C
    div t0, t0, s1
    sd t0, -416(s0)
    ld a0, -24(s0)
    ld a1, -416(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -408(s0)
    ld a0, -408(s0)
    li a1, 0x00001E00
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1814
    div t0, t0, s1
    sd t0, -432(s0)
    ld a0, -24(s0)
    ld a1, -432(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -424(s0)
    li s1, 15
    li t0, 1080
    sll t0, t0, s1
    sd t0, -440(s0)
    ld t0, -440(s0)
    li s1, 1920
    or t0, t0, s1
    sd t0, -448(s0)
    ld a0, -424(s0)
    ld a1, -448(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x151C
    div t0, t0, s1
    sd t0, -464(s0)
    ld a0, -24(s0)
    ld a1, -464(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -456(s0)
    li s1, 26
    li t0, 5
    sll t0, t0, s1
    sd t0, -472(s0)
    ld a0, -456(s0)
    ld a1, -472(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1524
    div t0, t0, s1
    sd t0, -488(s0)
    ld a0, -24(s0)
    ld a1, -488(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -480(s0)
    ld a0, -480(s0)
    li a1, 0x00000030
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x2514
    div t0, t0, s1
    sd t0, -504(s0)
    ld a0, -24(s0)
    ld a1, -504(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -496(s0)
    ld a0, -496(s0)
    li a1, 0x00000002
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x2504
    div t0, t0, s1
    sd t0, -520(s0)
    ld a0, -24(s0)
    ld a1, -520(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -512(s0)
    ld a0, -512(s0)
    li a1, 0xFF000000
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x250C
    div t0, t0, s1
    sd t0, -536(s0)
    ld a0, -24(s0)
    ld a1, -536(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -528(s0)
    ld a0, -528(s0)
    li a1, 0xFF000000
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x24DC
    div t0, t0, s1
    sd t0, -552(s0)
    ld a0, -24(s0)
    ld a1, -552(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -544(s0)
    ld a0, -544(s0)
    li a1, 0x00000000
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x24E4
    div t0, t0, s1
    sd t0, -568(s0)
    ld a0, -24(s0)
    ld a1, -568(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -560(s0)
    li s1, 15
    li t0, 1080
    sll t0, t0, s1
    sd t0, -576(s0)
    ld t0, -576(s0)
    li s1, 1920
    or t0, t0, s1
    sd t0, -584(s0)
    ld a0, -560(s0)
    ld a1, -584(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1CC4
    div t0, t0, s1
    sd t0, -600(s0)
    ld a0, -24(s0)
    ld a1, -600(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -592(s0)
    li s1, 19
    li t0, 1
    sll t0, t0, s1
    sd t0, -608(s0)
    li s1, 13
    li t0, 1
    sll t0, t0, s1
    sd t0, -616(s0)
    ld t0, -608(s0)
    ld s1, -616(s0)
    or t0, t0, s1
    sd t0, -624(s0)
    ld a0, -592(s0)
    ld a1, -624(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1CC4
    div t0, t0, s1
    sd t0, -640(s0)
    ld a0, -24(s0)
    ld a1, -640(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -632(s0)
    li s1, 4
    li t0, 0x1CC4
    div t0, t0, s1
    sd t0, -664(s0)
    ld a0, -24(s0)
    ld a1, -664(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -656(s0)
    ld a0, -656(s0)
    li a1, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_deref_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -648(s0)
    li s1, 12
    li t0, 1
    sll t0, t0, s1
    sd t0, -672(s0)
    ld t0, -648(s0)
    ld s1, -672(s0)
    or t0, t0, s1
    sd t0, -680(s0)
    ld a0, -632(s0)
    ld a1, -680(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_rt_fence
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    li s1, 4
    li t0, 0x1CCC
    div t0, t0, s1
    sd t0, -704(s0)
    ld a0, -24(s0)
    ld a1, -704(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -696(s0)
    ld a0, -696(s0)
    li a1, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_deref_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -688(s0)
    ld t0, -688(s0)
    sd t0, -32(s0)
    li s1, 2
    li t0, 1
    sll t0, t0, s1
    sd t0, -720(s0)
    li s1, 3
    li t0, 1
    sll t0, t0, s1
    sd t0, -728(s0)
    ld t0, -720(s0)
    ld s1, -728(s0)
    or t0, t0, s1
    sd t0, -736(s0)
    ld t0, -736(s0)
    not t0, t0
    sd t0, -712(s0)
    ld t0, -32(s0)
    ld s1, -712(s0)
    and t0, t0, s1
    sd t0, -744(s0)
    li s1, 0
    li t0, 1
    sll t0, t0, s1
    sd t0, -752(s0)
    ld t0, -744(s0)
    ld s1, -752(s0)
    or t0, t0, s1
    sd t0, -760(s0)
    li s1, 1
    li t0, 1
    sll t0, t0, s1
    sd t0, -768(s0)
    ld t0, -760(s0)
    ld s1, -768(s0)
    or t0, t0, s1
    sd t0, -776(s0)
    ld t0, -776(s0)
    sd t0, -32(s0)
    li s1, 4
    li t0, 0x1CCC
    div t0, t0, s1
    sd t0, -792(s0)
    ld a0, -24(s0)
    ld a1, -792(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_offset_stride
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    mv t0, a0
    sd t0, -784(s0)
    ld a0, -784(s0)
    ld a1, -32(s0)
    li a2, 4
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_mmio_store_sized
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    sd t1, -800(s0)
    sd t2, -808(s0)
    sd t3, -816(s0)
    sd t4, -824(s0)
    sd t5, -832(s0)
    sd t6, -840(s0)
    call __calynda_rt_fence
    ld t6, -840(s0)
    ld t5, -832(s0)
    ld t4, -824(s0)
    ld t3, -816(s0)
    ld t2, -808(s0)
    ld t1, -800(s0)
    addi sp, sp, 848
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_forLinear_lambda64,"ax"
.globl calynda_unit_forLinear_lambda64
calynda_unit_forLinear_lambda64:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld a0, -24(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_cell_read
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    ld a0, -32(s0)
    la a1, .Lsym_0
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_member_load
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    slt t3, t1, t2
    mv a0, t3
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_forLinear_nlr65,"ax"
.globl calynda_unit_forLinear_nlr65
calynda_unit_forLinear_nlr65:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -96
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    ld t0, 8(s11)
    sd t0, -32(s0)
    ld t0, 16(s11)
    sd t0, -40(s0)
    ld t0, 24(s11)
    sd t0, -48(s0)
    ld a0, -48(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    call __calynda_rt_cell_read
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t3, a0
    ld a0, -40(s0)
    mv a1, t3
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    call __calynda_rt_index_load
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t2, a0
    sd t2, -56(s0)
    ld a0, -32(s0)
    li a1, 1
    addi a2, s0, -56
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    call __calynda_rt_call_callable
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t1, a0
    ld a0, -48(s0)
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    call __calynda_rt_cell_read
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t4, a0
    li s1, 1
    add t5, t4, s1
    ld a0, -48(s0)
    mv a1, t5
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    call __calynda_rt_cell_write
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    addi sp, sp, 96
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_forLinear,"ax"
.globl calynda_unit_forLinear
calynda_unit_forLinear:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -128
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    li a0, 0
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    call __calynda_rt_cell_alloc
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    mv t1, a0
    sd t1, -40(s0)
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    call __calynda_rt_nlr_push
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    mv t2, a0
    sd t2, -48(s0)
    ld t0, -40(s0)
    sd t0, -80(s0)
    ld t0, -24(s0)
    sd t0, -72(s0)
    addi a2, s0, -80
    la a0, calynda_closure_forLinear_lambda64
    li a1, 2
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    call __calynda_rt_closure_new
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    mv t3, a0
    ld t0, -48(s0)
    sd t0, -80(s0)
    ld t0, -32(s0)
    sd t0, -72(s0)
    ld t0, -24(s0)
    sd t0, -64(s0)
    ld t0, -40(s0)
    sd t0, -56(s0)
    addi a2, s0, -80
    la a0, calynda_closure_forLinear_nlr65
    li a1, 4
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    call __calynda_rt_closure_new
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    mv t4, a0
    mv a0, t3
    mv a1, t4
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    call calynda_unit_while
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    ld a0, -48(s0)
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    call __calynda_rt_nlr_check_pop
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    mv t5, a0
    bne t5, zero, .Lcalynda_unit_forLinear_bb1
    j .Lcalynda_unit_forLinear_bb2
.Lcalynda_unit_forLinear_bb1:
    addi sp, sp, 128
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_forLinear_bb2:
    addi sp, sp, 128
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hold_scanout,"ax"
.globl calynda_unit_hold_scanout
calynda_unit_hold_scanout:

1:
    nop
    j 1b
.section .text.calynda_unit_screen_demo_frame_nlr68_nlr69,"ax"
.globl calynda_unit_screen_demo_frame_nlr68_nlr69
calynda_unit_screen_demo_frame_nlr68_nlr69:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -32
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    sd a0, -32(s0)
    ld a0, -32(s0)
    call calynda_unit_screen_draw_object
    addi sp, sp, 32
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_demo_frame_nlr68,"ax"
.globl calynda_unit_screen_demo_frame_nlr68
calynda_unit_screen_demo_frame_nlr68:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -80
    sd t0, -24(s0)
    sd s1, -32(s0)
    ld t0, 0(s11)
    sd t0, -24(s0)
    sd a0, -32(s0)
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    sd t4, -80(s0)
    call __calynda_rt_nlr_push
    ld t4, -80(s0)
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t1, a0
    sd t1, -40(s0)
    ld t0, -40(s0)
    sd t0, -48(s0)
    addi a2, s0, -48
    la a0, calynda_closure_screen_demo_frame_nlr68_nlr69
    li a1, 1
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    sd t4, -80(s0)
    call __calynda_rt_closure_new
    ld t4, -80(s0)
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t2, a0
    ld a0, -32(s0)
    mv a1, t2
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    sd t4, -80(s0)
    call calynda_unit_forLinear
    ld t4, -80(s0)
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    ld a0, -40(s0)
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    sd t4, -80(s0)
    call __calynda_rt_nlr_check_pop
    ld t4, -80(s0)
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t3, a0
    bne t3, zero, .Lcalynda_unit_screen_demo_frame_nlr68_bb1
    j .Lcalynda_unit_screen_demo_frame_nlr68_bb2
.Lcalynda_unit_screen_demo_frame_nlr68_bb1:
    ld a0, -40(s0)
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    sd t4, -80(s0)
    call __calynda_rt_nlr_get_value
    ld t4, -80(s0)
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    mv t4, a0
    ld a0, -24(s0)
    mv a1, t4
    sd t1, -56(s0)
    sd t2, -64(s0)
    sd t3, -72(s0)
    sd t4, -80(s0)
    call __calynda_rt_nlr_invoke
    ld t4, -80(s0)
    ld t3, -72(s0)
    ld t2, -64(s0)
    ld t1, -56(s0)
    addi sp, sp, 80
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_screen_demo_frame_nlr68_bb2:
    addi sp, sp, 80
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_demo_frame,"ax"
.globl calynda_unit_screen_demo_frame
calynda_unit_screen_demo_frame:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -80
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    li a0, 0x00
    li a1, 0x00
    li a2, 0x00
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    call calynda_unit_RGB
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t1, a0
    mv a0, t1
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    call calynda_unit_fb_fill
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    call __calynda_rt_nlr_push
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t2, a0
    sd t2, -32(s0)
    ld t0, -32(s0)
    sd t0, -40(s0)
    addi a2, s0, -40
    la a0, calynda_closure_screen_demo_frame_nlr68
    li a1, 1
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    call __calynda_rt_closure_new
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t3, a0
    ld a0, -24(s0)
    mv a1, t3
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    call calynda_unit_forLinear
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    ld a0, -32(s0)
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    call __calynda_rt_nlr_check_pop
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    mv t4, a0
    bne t4, zero, .Lcalynda_unit_screen_demo_frame_bb1
    j .Lcalynda_unit_screen_demo_frame_bb2
.Lcalynda_unit_screen_demo_frame_bb1:
    addi sp, sp, 80
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_screen_demo_frame_bb2:
    li a0, 0x04200000
    li a1, 0x007E9000
    sd t1, -48(s0)
    sd t2, -56(s0)
    sd t3, -64(s0)
    sd t4, -72(s0)
    call calynda_unit_thead_dcache_clean_range
    ld t4, -72(s0)
    ld t3, -64(s0)
    ld t2, -56(s0)
    ld t1, -48(s0)
    addi sp, sp, 80
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_demo_hold,"ax"
.globl calynda_unit_screen_demo_hold
calynda_unit_screen_demo_hold:
    addi sp, sp, -16
    sd ra, 8(sp)
    call __calynda_rt_screen_demo_hold
    li a0, 0
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_screen_demo_heysyd,"ax"
.globl calynda_unit_screen_demo_heysyd
calynda_unit_screen_demo_heysyd:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    li t6, -2432
    add sp, sp, t6
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t2, 5
    neg t2, t2
    li t3, 5
    neg t3, t3
    li a0, 0x00
    li a1, 0x40
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t4, a0
    li a0, 24
    li a1, 48
    mv a2, t2
    mv a3, t3
    mv a4, t4
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t1, a0
    sd t1, -24(s0)
    li t6, 4
    neg t6, t6
    li t0, 5
    neg t0, t0
    sd t0, -512(s0)
    li a0, 0x00
    li a1, 0x40
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -520(s0)
    li a0, 196
    li a1, 48
    mv a2, t6
    ld a3, -512(s0)
    ld a4, -520(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t5, a0
    sd t5, -32(s0)
    li t0, 3
    neg t0, t0
    sd t0, -536(s0)
    li t0, 5
    neg t0, t0
    sd t0, -544(s0)
    li a0, 0x00
    li a1, 0x40
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -552(s0)
    li a0, 368
    li a1, 48
    ld a2, -536(s0)
    ld a3, -544(s0)
    ld a4, -552(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -528(s0)
    ld t0, -528(s0)
    sd t0, -40(s0)
    li t0, 2
    neg t0, t0
    sd t0, -568(s0)
    li t0, 5
    neg t0, t0
    sd t0, -576(s0)
    li a0, 0x00
    li a1, 0x80
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -584(s0)
    li a0, 540
    li a1, 48
    ld a2, -568(s0)
    ld a3, -576(s0)
    ld a4, -584(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -560(s0)
    ld t0, -560(s0)
    sd t0, -48(s0)
    li t0, 1
    neg t0, t0
    sd t0, -600(s0)
    li t0, 5
    neg t0, t0
    sd t0, -608(s0)
    li a0, 0x00
    li a1, 0x80
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -616(s0)
    li a0, 712
    li a1, 48
    ld a2, -600(s0)
    ld a3, -608(s0)
    ld a4, -616(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -592(s0)
    ld t0, -592(s0)
    sd t0, -56(s0)
    li t0, 5
    neg t0, t0
    sd t0, -632(s0)
    li a0, 0x00
    li a1, 0x80
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -640(s0)
    li a0, 884
    li a1, 48
    li a2, 1
    ld a3, -632(s0)
    ld a4, -640(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -624(s0)
    ld t0, -624(s0)
    sd t0, -64(s0)
    li t0, 5
    neg t0, t0
    sd t0, -656(s0)
    li a0, 0x00
    li a1, 0xC0
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -664(s0)
    li a0, 1056
    li a1, 48
    li a2, 2
    ld a3, -656(s0)
    ld a4, -664(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -648(s0)
    ld t0, -648(s0)
    sd t0, -72(s0)
    li t0, 5
    neg t0, t0
    sd t0, -680(s0)
    li a0, 0x00
    li a1, 0xC0
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -688(s0)
    li a0, 1228
    li a1, 48
    li a2, 3
    ld a3, -680(s0)
    ld a4, -688(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -672(s0)
    ld t0, -672(s0)
    sd t0, -80(s0)
    li t0, 5
    neg t0, t0
    sd t0, -704(s0)
    li a0, 0x00
    li a1, 0xC0
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -712(s0)
    li a0, 1400
    li a1, 48
    li a2, 4
    ld a3, -704(s0)
    ld a4, -712(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -696(s0)
    ld t0, -696(s0)
    sd t0, -88(s0)
    li t0, 5
    neg t0, t0
    sd t0, -728(s0)
    li a0, 0x00
    li a1, 0xFF
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -736(s0)
    li a0, 1572
    li a1, 48
    li a2, 5
    ld a3, -728(s0)
    ld a4, -736(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -720(s0)
    ld t0, -720(s0)
    sd t0, -96(s0)
    li t0, 5
    neg t0, t0
    sd t0, -752(s0)
    li t0, 3
    neg t0, t0
    sd t0, -760(s0)
    li a0, 0x00
    li a1, 0xFF
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -768(s0)
    li a0, 24
    li a1, 204
    ld a2, -752(s0)
    ld a3, -760(s0)
    ld a4, -768(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -744(s0)
    ld t0, -744(s0)
    sd t0, -104(s0)
    li t0, 4
    neg t0, t0
    sd t0, -784(s0)
    li t0, 3
    neg t0, t0
    sd t0, -792(s0)
    li a0, 0x00
    li a1, 0xFF
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -800(s0)
    li a0, 196
    li a1, 204
    ld a2, -784(s0)
    ld a3, -792(s0)
    ld a4, -800(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -776(s0)
    ld t0, -776(s0)
    sd t0, -112(s0)
    li t0, 3
    neg t0, t0
    sd t0, -816(s0)
    li t0, 3
    neg t0, t0
    sd t0, -824(s0)
    li a0, 0x40
    li a1, 0x00
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -832(s0)
    li a0, 368
    li a1, 204
    ld a2, -816(s0)
    ld a3, -824(s0)
    ld a4, -832(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -808(s0)
    ld t0, -808(s0)
    sd t0, -120(s0)
    li t0, 2
    neg t0, t0
    sd t0, -848(s0)
    li t0, 3
    neg t0, t0
    sd t0, -856(s0)
    li a0, 0x40
    li a1, 0x00
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -864(s0)
    li a0, 540
    li a1, 204
    ld a2, -848(s0)
    ld a3, -856(s0)
    ld a4, -864(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -840(s0)
    ld t0, -840(s0)
    sd t0, -128(s0)
    li t0, 1
    neg t0, t0
    sd t0, -880(s0)
    li t0, 3
    neg t0, t0
    sd t0, -888(s0)
    li a0, 0x40
    li a1, 0x00
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -896(s0)
    li a0, 712
    li a1, 204
    ld a2, -880(s0)
    ld a3, -888(s0)
    ld a4, -896(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -872(s0)
    ld t0, -872(s0)
    sd t0, -136(s0)
    li t0, 3
    neg t0, t0
    sd t0, -912(s0)
    li a0, 0x40
    li a1, 0x80
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -920(s0)
    li a0, 884
    li a1, 204
    li a2, 1
    ld a3, -912(s0)
    ld a4, -920(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -904(s0)
    ld t0, -904(s0)
    sd t0, -144(s0)
    li t0, 3
    neg t0, t0
    sd t0, -936(s0)
    li a0, 0x40
    li a1, 0x80
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -944(s0)
    li a0, 1056
    li a1, 204
    li a2, 2
    ld a3, -936(s0)
    ld a4, -944(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -928(s0)
    ld t0, -928(s0)
    sd t0, -152(s0)
    li t0, 3
    neg t0, t0
    sd t0, -960(s0)
    li a0, 0x40
    li a1, 0x80
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -968(s0)
    li a0, 1228
    li a1, 204
    li a2, 3
    ld a3, -960(s0)
    ld a4, -968(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -952(s0)
    ld t0, -952(s0)
    sd t0, -160(s0)
    li t0, 3
    neg t0, t0
    sd t0, -984(s0)
    li a0, 0x40
    li a1, 0xC0
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -992(s0)
    li a0, 1400
    li a1, 204
    li a2, 4
    ld a3, -984(s0)
    ld a4, -992(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -976(s0)
    ld t0, -976(s0)
    sd t0, -168(s0)
    li t0, 3
    neg t0, t0
    sd t0, -1008(s0)
    li a0, 0x40
    li a1, 0xC0
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1016(s0)
    li a0, 1572
    li a1, 204
    li a2, 5
    ld a3, -1008(s0)
    ld a4, -1016(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1000(s0)
    ld t0, -1000(s0)
    sd t0, -176(s0)
    li t0, 5
    neg t0, t0
    sd t0, -1032(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1040(s0)
    li a0, 0x40
    li a1, 0xC0
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1048(s0)
    li a0, 24
    li a1, 360
    ld a2, -1032(s0)
    ld a3, -1040(s0)
    ld a4, -1048(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1024(s0)
    ld t0, -1024(s0)
    sd t0, -184(s0)
    li t0, 4
    neg t0, t0
    sd t0, -1064(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1072(s0)
    li a0, 0x40
    li a1, 0xFF
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1080(s0)
    li a0, 196
    li a1, 360
    ld a2, -1064(s0)
    ld a3, -1072(s0)
    ld a4, -1080(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1056(s0)
    ld t0, -1056(s0)
    sd t0, -192(s0)
    li t0, 3
    neg t0, t0
    sd t0, -1096(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1104(s0)
    li a0, 0x40
    li a1, 0xFF
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1112(s0)
    li a0, 368
    li a1, 360
    ld a2, -1096(s0)
    ld a3, -1104(s0)
    ld a4, -1112(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1088(s0)
    ld t0, -1088(s0)
    sd t0, -200(s0)
    li t0, 2
    neg t0, t0
    sd t0, -1128(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1136(s0)
    li a0, 0x40
    li a1, 0xFF
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1144(s0)
    li a0, 540
    li a1, 360
    ld a2, -1128(s0)
    ld a3, -1136(s0)
    ld a4, -1144(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1120(s0)
    ld t0, -1120(s0)
    sd t0, -208(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1160(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1168(s0)
    li a0, 0x80
    li a1, 0x00
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1176(s0)
    li a0, 712
    li a1, 360
    ld a2, -1160(s0)
    ld a3, -1168(s0)
    ld a4, -1176(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1152(s0)
    ld t0, -1152(s0)
    sd t0, -216(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1192(s0)
    li a0, 0x80
    li a1, 0x00
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1200(s0)
    li a0, 884
    li a1, 360
    li a2, 1
    ld a3, -1192(s0)
    ld a4, -1200(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1184(s0)
    ld t0, -1184(s0)
    sd t0, -224(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1216(s0)
    li a0, 0x80
    li a1, 0x00
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1224(s0)
    li a0, 1056
    li a1, 360
    li a2, 2
    ld a3, -1216(s0)
    ld a4, -1224(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1208(s0)
    ld t0, -1208(s0)
    sd t0, -232(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1240(s0)
    li a0, 0x80
    li a1, 0x40
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1248(s0)
    li a0, 1228
    li a1, 360
    li a2, 3
    ld a3, -1240(s0)
    ld a4, -1248(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1232(s0)
    ld t0, -1232(s0)
    sd t0, -240(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1264(s0)
    li a0, 0x80
    li a1, 0x40
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1272(s0)
    li a0, 1400
    li a1, 360
    li a2, 4
    ld a3, -1264(s0)
    ld a4, -1272(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1256(s0)
    ld t0, -1256(s0)
    sd t0, -248(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1288(s0)
    li a0, 0x80
    li a1, 0x40
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1296(s0)
    li a0, 1572
    li a1, 360
    li a2, 5
    ld a3, -1288(s0)
    ld a4, -1296(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1280(s0)
    ld t0, -1280(s0)
    sd t0, -256(s0)
    li t0, 5
    neg t0, t0
    sd t0, -1312(s0)
    li a0, 0x80
    li a1, 0xC0
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1320(s0)
    li a0, 24
    li a1, 516
    ld a2, -1312(s0)
    li a3, 1
    ld a4, -1320(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1304(s0)
    ld t0, -1304(s0)
    sd t0, -264(s0)
    li t0, 4
    neg t0, t0
    sd t0, -1336(s0)
    li a0, 0x80
    li a1, 0xC0
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1344(s0)
    li a0, 196
    li a1, 516
    ld a2, -1336(s0)
    li a3, 1
    ld a4, -1344(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1328(s0)
    ld t0, -1328(s0)
    sd t0, -272(s0)
    li t0, 3
    neg t0, t0
    sd t0, -1360(s0)
    li a0, 0x80
    li a1, 0xC0
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1368(s0)
    li a0, 368
    li a1, 516
    ld a2, -1360(s0)
    li a3, 1
    ld a4, -1368(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1352(s0)
    ld t0, -1352(s0)
    sd t0, -280(s0)
    li t0, 2
    neg t0, t0
    sd t0, -1384(s0)
    li a0, 0x80
    li a1, 0xFF
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1392(s0)
    li a0, 540
    li a1, 516
    ld a2, -1384(s0)
    li a3, 1
    ld a4, -1392(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1376(s0)
    ld t0, -1376(s0)
    sd t0, -288(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1408(s0)
    li a0, 0x80
    li a1, 0xFF
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1416(s0)
    li a0, 712
    li a1, 516
    ld a2, -1408(s0)
    li a3, 1
    ld a4, -1416(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1400(s0)
    ld t0, -1400(s0)
    sd t0, -296(s0)
    li a0, 0x80
    li a1, 0xFF
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1432(s0)
    li a0, 884
    li a1, 516
    li a2, 1
    li a3, 1
    ld a4, -1432(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1424(s0)
    ld t0, -1424(s0)
    sd t0, -304(s0)
    li a0, 0xC0
    li a1, 0x00
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1448(s0)
    li a0, 1056
    li a1, 516
    li a2, 2
    li a3, 1
    ld a4, -1448(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1440(s0)
    ld t0, -1440(s0)
    sd t0, -312(s0)
    li a0, 0xC0
    li a1, 0x00
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1464(s0)
    li a0, 1228
    li a1, 516
    li a2, 3
    li a3, 1
    ld a4, -1464(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1456(s0)
    ld t0, -1456(s0)
    sd t0, -320(s0)
    li a0, 0xC0
    li a1, 0x00
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1480(s0)
    li a0, 1400
    li a1, 516
    li a2, 4
    li a3, 1
    ld a4, -1480(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1472(s0)
    ld t0, -1472(s0)
    sd t0, -328(s0)
    li a0, 0xC0
    li a1, 0x40
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1496(s0)
    li a0, 1572
    li a1, 516
    li a2, 5
    li a3, 1
    ld a4, -1496(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1488(s0)
    ld t0, -1488(s0)
    sd t0, -336(s0)
    li t0, 5
    neg t0, t0
    sd t0, -1512(s0)
    li a0, 0xC0
    li a1, 0x40
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1520(s0)
    li a0, 24
    li a1, 672
    ld a2, -1512(s0)
    li a3, 3
    ld a4, -1520(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1504(s0)
    ld t0, -1504(s0)
    sd t0, -344(s0)
    li t0, 4
    neg t0, t0
    sd t0, -1536(s0)
    li a0, 0xC0
    li a1, 0x40
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1544(s0)
    li a0, 196
    li a1, 672
    ld a2, -1536(s0)
    li a3, 3
    ld a4, -1544(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1528(s0)
    ld t0, -1528(s0)
    sd t0, -352(s0)
    li t0, 3
    neg t0, t0
    sd t0, -1560(s0)
    li a0, 0xC0
    li a1, 0x80
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1568(s0)
    li a0, 368
    li a1, 672
    ld a2, -1560(s0)
    li a3, 3
    ld a4, -1568(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1552(s0)
    ld t0, -1552(s0)
    sd t0, -360(s0)
    li t0, 2
    neg t0, t0
    sd t0, -1584(s0)
    li a0, 0xC0
    li a1, 0x80
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1592(s0)
    li a0, 540
    li a1, 672
    ld a2, -1584(s0)
    li a3, 3
    ld a4, -1592(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1576(s0)
    ld t0, -1576(s0)
    sd t0, -368(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1608(s0)
    li a0, 0xC0
    li a1, 0x80
    li a2, 0xFF
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1616(s0)
    li a0, 712
    li a1, 672
    ld a2, -1608(s0)
    li a3, 3
    ld a4, -1616(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1600(s0)
    ld t0, -1600(s0)
    sd t0, -376(s0)
    li a0, 0xC0
    li a1, 0xFF
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1632(s0)
    li a0, 884
    li a1, 672
    li a2, 1
    li a3, 3
    ld a4, -1632(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1624(s0)
    ld t0, -1624(s0)
    sd t0, -384(s0)
    li a0, 0xC0
    li a1, 0xFF
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1648(s0)
    li a0, 1056
    li a1, 672
    li a2, 2
    li a3, 3
    ld a4, -1648(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1640(s0)
    ld t0, -1640(s0)
    sd t0, -392(s0)
    li a0, 0xC0
    li a1, 0xFF
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1664(s0)
    li a0, 1228
    li a1, 672
    li a2, 3
    li a3, 3
    ld a4, -1664(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1656(s0)
    ld t0, -1656(s0)
    sd t0, -400(s0)
    li a0, 0xFF
    li a1, 0x00
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1680(s0)
    li a0, 1400
    li a1, 672
    li a2, 4
    li a3, 3
    ld a4, -1680(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1672(s0)
    ld t0, -1672(s0)
    sd t0, -408(s0)
    li a0, 0xFF
    li a1, 0x00
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1696(s0)
    li a0, 1572
    li a1, 672
    li a2, 5
    li a3, 3
    ld a4, -1696(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1688(s0)
    ld t0, -1688(s0)
    sd t0, -416(s0)
    li t0, 5
    neg t0, t0
    sd t0, -1712(s0)
    li a0, 0xFF
    li a1, 0x00
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1720(s0)
    li a0, 24
    li a1, 828
    ld a2, -1712(s0)
    li a3, 5
    ld a4, -1720(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1704(s0)
    ld t0, -1704(s0)
    sd t0, -424(s0)
    li t0, 4
    neg t0, t0
    sd t0, -1736(s0)
    li a0, 0xFF
    li a1, 0x40
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1744(s0)
    li a0, 196
    li a1, 828
    ld a2, -1736(s0)
    li a3, 5
    ld a4, -1744(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1728(s0)
    ld t0, -1728(s0)
    sd t0, -432(s0)
    li t0, 3
    neg t0, t0
    sd t0, -1760(s0)
    li a0, 0xFF
    li a1, 0x40
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1768(s0)
    li a0, 368
    li a1, 828
    ld a2, -1760(s0)
    li a3, 5
    ld a4, -1768(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1752(s0)
    ld t0, -1752(s0)
    sd t0, -440(s0)
    li t0, 2
    neg t0, t0
    sd t0, -1784(s0)
    li a0, 0xFF
    li a1, 0x40
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1792(s0)
    li a0, 540
    li a1, 828
    ld a2, -1784(s0)
    li a3, 5
    ld a4, -1792(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1776(s0)
    ld t0, -1776(s0)
    sd t0, -448(s0)
    li t0, 1
    neg t0, t0
    sd t0, -1808(s0)
    li a0, 0xFF
    li a1, 0x80
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1816(s0)
    li a0, 712
    li a1, 828
    ld a2, -1808(s0)
    li a3, 5
    ld a4, -1816(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1800(s0)
    ld t0, -1800(s0)
    sd t0, -456(s0)
    li a0, 0xFF
    li a1, 0x80
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1832(s0)
    li a0, 884
    li a1, 828
    li a2, 1
    li a3, 5
    ld a4, -1832(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1824(s0)
    ld t0, -1824(s0)
    sd t0, -464(s0)
    li a0, 0xFF
    li a1, 0x80
    li a2, 0xC0
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1848(s0)
    li a0, 1056
    li a1, 828
    li a2, 2
    li a3, 5
    ld a4, -1848(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1840(s0)
    ld t0, -1840(s0)
    sd t0, -472(s0)
    li a0, 0xFF
    li a1, 0xC0
    li a2, 0x00
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1864(s0)
    li a0, 1228
    li a1, 828
    li a2, 3
    li a3, 5
    ld a4, -1864(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1856(s0)
    ld t0, -1856(s0)
    sd t0, -480(s0)
    li a0, 0xFF
    li a1, 0xC0
    li a2, 0x40
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1880(s0)
    li a0, 1400
    li a1, 828
    li a2, 4
    li a3, 5
    ld a4, -1880(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1872(s0)
    ld t0, -1872(s0)
    sd t0, -488(s0)
    li a0, 0xFF
    li a1, 0xC0
    li a2, 0x80
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_RGB
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1896(s0)
    li a0, 1572
    li a1, 828
    li a2, 5
    li a3, 5
    ld a4, -1896(s0)
    la a5, .Lstr_obj_1
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call calynda_unit_screen_make_text
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1888(s0)
    ld t0, -1888(s0)
    sd t0, -496(s0)
    ld t0, -24(s0)
    li t6, -2384
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -32(s0)
    li t6, -2376
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -40(s0)
    li t6, -2368
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -48(s0)
    li t6, -2360
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -56(s0)
    li t6, -2352
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -64(s0)
    li t6, -2344
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -72(s0)
    li t6, -2336
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -80(s0)
    li t6, -2328
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -88(s0)
    li t6, -2320
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -96(s0)
    li t6, -2312
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -104(s0)
    li t6, -2304
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -112(s0)
    li t6, -2296
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -120(s0)
    li t6, -2288
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -128(s0)
    li t6, -2280
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -136(s0)
    li t6, -2272
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -144(s0)
    li t6, -2264
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -152(s0)
    li t6, -2256
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -160(s0)
    li t6, -2248
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -168(s0)
    li t6, -2240
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -176(s0)
    li t6, -2232
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -184(s0)
    li t6, -2224
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -192(s0)
    li t6, -2216
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -200(s0)
    li t6, -2208
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -208(s0)
    li t6, -2200
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -216(s0)
    li t6, -2192
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -224(s0)
    li t6, -2184
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -232(s0)
    li t6, -2176
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -240(s0)
    li t6, -2168
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -248(s0)
    li t6, -2160
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -256(s0)
    li t6, -2152
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -264(s0)
    li t6, -2144
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -272(s0)
    li t6, -2136
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -280(s0)
    li t6, -2128
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -288(s0)
    li t6, -2120
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -296(s0)
    li t6, -2112
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -304(s0)
    li t6, -2104
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -312(s0)
    li t6, -2096
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -320(s0)
    li t6, -2088
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -328(s0)
    li t6, -2080
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -336(s0)
    li t6, -2072
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -344(s0)
    li t6, -2064
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -352(s0)
    li t6, -2056
    add t6, s0, t6
    sd t0, 0(t6)
    ld t0, -360(s0)
    sd t0, -2048(s0)
    ld t0, -368(s0)
    sd t0, -2040(s0)
    ld t0, -376(s0)
    sd t0, -2032(s0)
    ld t0, -384(s0)
    sd t0, -2024(s0)
    ld t0, -392(s0)
    sd t0, -2016(s0)
    ld t0, -400(s0)
    sd t0, -2008(s0)
    ld t0, -408(s0)
    sd t0, -2000(s0)
    ld t0, -416(s0)
    sd t0, -1992(s0)
    ld t0, -424(s0)
    sd t0, -1984(s0)
    ld t0, -432(s0)
    sd t0, -1976(s0)
    ld t0, -440(s0)
    sd t0, -1968(s0)
    ld t0, -448(s0)
    sd t0, -1960(s0)
    ld t0, -456(s0)
    sd t0, -1952(s0)
    ld t0, -464(s0)
    sd t0, -1944(s0)
    ld t0, -472(s0)
    sd t0, -1936(s0)
    ld t0, -480(s0)
    sd t0, -1928(s0)
    ld t0, -488(s0)
    sd t0, -1920(s0)
    ld t0, -496(s0)
    sd t0, -1912(s0)
    la a0, .Ltd_desc_63
    li a1, 60
    li t6, -2384
    add a2, s0, t6
    li t6, -2392
    add t6, s0, t6
    sd t1, 0(t6)
    li t6, -2400
    add t6, s0, t6
    sd t2, 0(t6)
    li t6, -2408
    add t6, s0, t6
    sd t3, 0(t6)
    li t6, -2416
    add t6, s0, t6
    sd t4, 0(t6)
    li t6, -2424
    add t6, s0, t6
    sd t5, 0(t6)
    li t0, -2432
    add t0, s0, t0
    sd t6, 0(t0)
    call __calynda_rt_hetero_array_new
    li t0, -2432
    add t0, s0, t0
    ld t6, 0(t0)
    li t6, -2424
    add t6, s0, t6
    ld t5, 0(t6)
    li t6, -2416
    add t6, s0, t6
    ld t4, 0(t6)
    li t6, -2408
    add t6, s0, t6
    ld t3, 0(t6)
    li t6, -2400
    add t6, s0, t6
    ld t2, 0(t6)
    li t6, -2392
    add t6, s0, t6
    ld t1, 0(t6)
    mv t0, a0
    sd t0, -1904(s0)
    ld t0, -1904(s0)
    sd t0, -504(s0)
    ld a0, -504(s0)
    li t6, 2432
    add sp, sp, t6
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_loop,"ax"
.globl calynda_unit_loop
calynda_unit_loop:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_vosys_clk_enable
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    li a0, 500
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_delay_us
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t1, a0
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_dpu0_pll_configure_1080p60
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_dpu1_pll_configure_1080p60
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    la a0, calynda_global_HDMI_PLL_SETTLE_DELAY_US
    ld a0, 0(a0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_delay_us
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t2, a0
    ld a0, -24(s0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_screen_demo_frame
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_dw_hdmi_init
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    la a0, calynda_global_HDMI_POST_PHY_SETTLE_DELAY_US
    ld a0, 0(a0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_delay_us
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t3, a0
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_dc8200_init
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    la a0, calynda_global_HDMI_POST_SCANOUT_ENABLE_DELAY_US
    ld a0, 0(a0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_delay_us
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t4, a0
    ld a0, -24(s0)
    sd t1, -32(s0)
    sd t2, -40(s0)
    sd t3, -48(s0)
    sd t4, -56(s0)
    sd t5, -64(s0)
    call calynda_unit_screen_demo_hold
    ld t5, -64(s0)
    ld t4, -56(s0)
    ld t3, -48(s0)
    ld t2, -40(s0)
    ld t1, -32(s0)
    mv t5, a0
    mv a0, t5
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_hdmi_screen_demo,"ax"
.globl calynda_unit_hdmi_screen_demo
calynda_unit_hdmi_screen_demo:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call calynda_unit_screen_demo_heysyd
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    sd t2, -32(s0)
    la a0, .Ltd_desc_64
    li a1, 1
    addi a2, s0, -32
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call __calynda_rt_hetero_array_new
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    sd t1, -24(s0)
    ld a0, -24(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    call calynda_unit_loop
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t3, a0
    mv a0, t3
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_run,"ax"
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
    call calynda_unit_hdmi_screen_demo
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
.section .text.calynda_unit___mir_module_init,"ax"
.globl calynda_unit___mir_module_init
calynda_unit___mir_module_init:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -16
    sd t0, -24(s0)
    sd s1, -32(s0)
    li s1, 1920
    la t0, calynda_global_FB_WIDTH
    sd s1, 0(t0)
    li s1, 1080
    la t0, calynda_global_FB_HEIGHT
    sd s1, 0(t0)
    li s1, 32
    la t0, calynda_global_THEAD_CMO_STRIDE
    sd s1, 0(t0)
    li s1, 24
    la t0, calynda_global_SCREEN_TEXT_CHAR_ADVANCE
    sd s1, 0(t0)
    li s1, 32
    la t0, calynda_global_SCREEN_TEXT_HEIGHT
    sd s1, 0(t0)
    li s1, 5000
    la t0, calynda_global_HDMI_PLL_SETTLE_DELAY_US
    sd s1, 0(t0)
    li s1, 20000
    la t0, calynda_global_HDMI_POST_PHY_SETTLE_DELAY_US
    sd s1, 0(t0)
    li s1, 50000
    la t0, calynda_global_HDMI_POST_SCANOUT_ENABLE_DELAY_US
    sd s1, 0(t0)
    addi sp, sp, 16
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.section .text.calynda_unit_boot,"ax"
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
    call calynda_unit___mir_module_init
    ld t1, -24(s0)
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
.section .text._start,"ax"
.globl _start
_start:
    li s0, 0
    li ra, 0
    li s11, 0
    call calynda_unit_boot
1:
    j 1b
.section .text.calynda_closure_while_nlr0,"ax"
.globl calynda_closure_while_nlr0
calynda_closure_while_nlr0:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_while_nlr0
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_while_lambda1,"ax"
.globl calynda_closure_while_lambda1
calynda_closure_while_lambda1:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_while_lambda1
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_fb_rect_span_lambda2,"ax"
.globl calynda_closure_fb_rect_span_lambda2
calynda_closure_fb_rect_span_lambda2:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_rect_span_lambda2
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_fb_rect_span_nlr3,"ax"
.globl calynda_closure_fb_rect_span_nlr3
calynda_closure_fb_rect_span_nlr3:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_rect_span_nlr3
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_fb_rect_lambda4,"ax"
.globl calynda_closure_fb_rect_lambda4
calynda_closure_fb_rect_lambda4:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_rect_lambda4
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_fb_rect_nlr5,"ax"
.globl calynda_closure_fb_rect_nlr5
calynda_closure_fb_rect_nlr5:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_rect_nlr5
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_thead_dcache_clean_range_lambda6,"ax"
.globl calynda_closure_thead_dcache_clean_range_lambda6
calynda_closure_thead_dcache_clean_range_lambda6:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_thead_dcache_clean_range_lambda6
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_thead_dcache_clean_range_nlr7,"ax"
.globl calynda_closure_thead_dcache_clean_range_nlr7
calynda_closure_thead_dcache_clean_range_nlr7:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_thead_dcache_clean_range_nlr7
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dpu0_pll_configure_1080p60_lambda40,"ax"
.globl calynda_closure_dpu0_pll_configure_1080p60_lambda40
calynda_closure_dpu0_pll_configure_1080p60_lambda40:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dpu0_pll_configure_1080p60_lambda40
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dpu0_pll_configure_1080p60_nlr41,"ax"
.globl calynda_closure_dpu0_pll_configure_1080p60_nlr41
calynda_closure_dpu0_pll_configure_1080p60_nlr41:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dpu0_pll_configure_1080p60_nlr41
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dpu1_pll_configure_1080p60_lambda42,"ax"
.globl calynda_closure_dpu1_pll_configure_1080p60_lambda42
calynda_closure_dpu1_pll_configure_1080p60_lambda42:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dpu1_pll_configure_1080p60_lambda42
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dpu1_pll_configure_1080p60_nlr43,"ax"
.globl calynda_closure_dpu1_pll_configure_1080p60_nlr43
calynda_closure_dpu1_pll_configure_1080p60_nlr43:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dpu1_pll_configure_1080p60_nlr43
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_forRange_lambda44,"ax"
.globl calynda_closure_forRange_lambda44
calynda_closure_forRange_lambda44:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_forRange_lambda44
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_hdmi_phy_i2cm_write_once_lambda45,"ax"
.globl calynda_closure_hdmi_phy_i2cm_write_once_lambda45
calynda_closure_hdmi_phy_i2cm_write_once_lambda45:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_once_lambda45
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_hdmi_phy_i2cm_write_once_nlr46_nlr47,"ax"
.globl calynda_closure_hdmi_phy_i2cm_write_once_nlr46_nlr47
calynda_closure_hdmi_phy_i2cm_write_once_nlr46_nlr47:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_once_nlr46_nlr47
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_hdmi_phy_i2cm_write_once_nlr46_lambda48,"ax"
.globl calynda_closure_hdmi_phy_i2cm_write_once_nlr46_lambda48
calynda_closure_hdmi_phy_i2cm_write_once_nlr46_lambda48:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_once_nlr46_lambda48
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_hdmi_phy_i2cm_write_once_nlr46,"ax"
.globl calynda_closure_hdmi_phy_i2cm_write_once_nlr46
calynda_closure_hdmi_phy_i2cm_write_once_nlr46:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_once_nlr46
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_hdmi_phy_i2cm_write_attempt_nlr49,"ax"
.globl calynda_closure_hdmi_phy_i2cm_write_attempt_nlr49
calynda_closure_hdmi_phy_i2cm_write_attempt_nlr49:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_attempt_nlr49
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_hdmi_phy_i2cm_write_attempt_lambda50,"ax"
.globl calynda_closure_hdmi_phy_i2cm_write_attempt_lambda50
calynda_closure_hdmi_phy_i2cm_write_attempt_lambda50:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_attempt_lambda50
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_hdmi_program_identity_csc_lambda51_lambda52,"ax"
.globl calynda_closure_hdmi_program_identity_csc_lambda51_lambda52
calynda_closure_hdmi_program_identity_csc_lambda51_lambda52:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    ld a0, 0(t0)
    call calynda_unit_hdmi_program_identity_csc_lambda51_lambda52
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_hdmi_program_identity_csc_lambda51,"ax"
.globl calynda_closure_hdmi_program_identity_csc_lambda51
calynda_closure_hdmi_program_identity_csc_lambda51:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    ld a0, 0(t0)
    call calynda_unit_hdmi_program_identity_csc_lambda51
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_hdmi_clear_overflow_lambda53,"ax"
.globl calynda_closure_hdmi_clear_overflow_lambda53
calynda_closure_hdmi_clear_overflow_lambda53:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    ld a0, 0(t0)
    call calynda_unit_hdmi_clear_overflow_lambda53
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dw_hdmi_init_lambda54,"ax"
.globl calynda_closure_dw_hdmi_init_lambda54
calynda_closure_dw_hdmi_init_lambda54:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_lambda54
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dw_hdmi_init_nlr55,"ax"
.globl calynda_closure_dw_hdmi_init_nlr55
calynda_closure_dw_hdmi_init_nlr55:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_nlr55
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dw_hdmi_init_nlr56,"ax"
.globl calynda_closure_dw_hdmi_init_nlr56
calynda_closure_dw_hdmi_init_nlr56:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_nlr56
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dw_hdmi_init_lambda57,"ax"
.globl calynda_closure_dw_hdmi_init_lambda57
calynda_closure_dw_hdmi_init_lambda57:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_lambda57
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dw_hdmi_init_lambda58,"ax"
.globl calynda_closure_dw_hdmi_init_lambda58
calynda_closure_dw_hdmi_init_lambda58:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_lambda58
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_dw_hdmi_init_nlr59,"ax"
.globl calynda_closure_dw_hdmi_init_nlr59
calynda_closure_dw_hdmi_init_nlr59:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_nlr59
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_forLinear_lambda64,"ax"
.globl calynda_closure_forLinear_lambda64
calynda_closure_forLinear_lambda64:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_forLinear_lambda64
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_forLinear_nlr65,"ax"
.globl calynda_closure_forLinear_nlr65
calynda_closure_forLinear_nlr65:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_forLinear_nlr65
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_screen_demo_frame_nlr68_nlr69,"ax"
.globl calynda_closure_screen_demo_frame_nlr68_nlr69
calynda_closure_screen_demo_frame_nlr68_nlr69:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    ld a0, 0(t0)
    call calynda_unit_screen_demo_frame_nlr68_nlr69
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .text.calynda_closure_screen_demo_frame_nlr68,"ax"
.globl calynda_closure_screen_demo_frame_nlr68
calynda_closure_screen_demo_frame_nlr68:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    ld a0, 0(t0)
    call calynda_unit_screen_demo_frame_nlr68
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .rodata
.Lsym_0:
    .byte 108, 101, 110, 103, 116, 104, 0
.Ltypedesc_2:
    .byte 97, 114, 114, 0
.Ltypedesc_3:
    .byte 48, 0
.Ltypedesc_4:
    .byte 49, 0
.Ltypedesc_5:
    .byte 50, 0
.Ltypedesc_6:
    .byte 51, 0
.Ltypedesc_7:
    .byte 52, 0
.Ltypedesc_8:
    .byte 53, 0
.Ltypedesc_9:
    .byte 54, 0
.Ltypedesc_10:
    .byte 55, 0
.Ltypedesc_11:
    .byte 56, 0
.Ltypedesc_12:
    .byte 57, 0
.Ltypedesc_13:
    .byte 49, 48, 0
.Ltypedesc_14:
    .byte 49, 49, 0
.Ltypedesc_15:
    .byte 49, 50, 0
.Ltypedesc_16:
    .byte 49, 51, 0
.Ltypedesc_17:
    .byte 49, 52, 0
.Ltypedesc_18:
    .byte 49, 53, 0
.Ltypedesc_19:
    .byte 49, 54, 0
.Ltypedesc_20:
    .byte 49, 55, 0
.Ltypedesc_21:
    .byte 49, 56, 0
.Ltypedesc_22:
    .byte 49, 57, 0
.Ltypedesc_23:
    .byte 50, 48, 0
.Ltypedesc_24:
    .byte 50, 49, 0
.Ltypedesc_25:
    .byte 50, 50, 0
.Ltypedesc_26:
    .byte 50, 51, 0
.Ltypedesc_27:
    .byte 50, 52, 0
.Ltypedesc_28:
    .byte 50, 53, 0
.Ltypedesc_29:
    .byte 50, 54, 0
.Ltypedesc_30:
    .byte 50, 55, 0
.Ltypedesc_31:
    .byte 50, 56, 0
.Ltypedesc_32:
    .byte 50, 57, 0
.Ltypedesc_33:
    .byte 51, 48, 0
.Ltypedesc_34:
    .byte 51, 49, 0
.Ltypedesc_35:
    .byte 51, 50, 0
.Ltypedesc_36:
    .byte 51, 51, 0
.Ltypedesc_37:
    .byte 51, 52, 0
.Ltypedesc_38:
    .byte 51, 53, 0
.Ltypedesc_39:
    .byte 51, 54, 0
.Ltypedesc_40:
    .byte 51, 55, 0
.Ltypedesc_41:
    .byte 51, 56, 0
.Ltypedesc_42:
    .byte 51, 57, 0
.Ltypedesc_43:
    .byte 52, 48, 0
.Ltypedesc_44:
    .byte 52, 49, 0
.Ltypedesc_45:
    .byte 52, 50, 0
.Ltypedesc_46:
    .byte 52, 51, 0
.Ltypedesc_47:
    .byte 52, 52, 0
.Ltypedesc_48:
    .byte 52, 53, 0
.Ltypedesc_49:
    .byte 52, 54, 0
.Ltypedesc_50:
    .byte 52, 55, 0
.Ltypedesc_51:
    .byte 52, 56, 0
.Ltypedesc_52:
    .byte 52, 57, 0
.Ltypedesc_53:
    .byte 53, 48, 0
.Ltypedesc_54:
    .byte 53, 49, 0
.Ltypedesc_55:
    .byte 53, 50, 0
.Ltypedesc_56:
    .byte 53, 51, 0
.Ltypedesc_57:
    .byte 53, 52, 0
.Ltypedesc_58:
    .byte 53, 53, 0
.Ltypedesc_59:
    .byte 53, 54, 0
.Ltypedesc_60:
    .byte 53, 55, 0
.Ltypedesc_61:
    .byte 53, 56, 0
.Ltypedesc_62:
    .byte 53, 57, 0
    .balign 8
.Larr_elems_1:
    .quad 8192
    .quad 0
    .quad 0
    .quad 0
    .balign 8
.Larr_obj_1:
    .long 1129077060
    .long 1
    .quad 0
    .quad 4
    .quad .Larr_elems_1
    .balign 8
.Larr_elems_2:
    .quad 0
    .quad 8192
    .quad 0
    .quad 0
    .balign 8
.Larr_obj_2:
    .long 1129077060
    .long 1
    .quad 0
    .quad 4
    .quad .Larr_elems_2
    .balign 8
.Larr_elems_3:
    .quad 0
    .quad 0
    .quad 8192
    .quad 0
    .balign 8
.Larr_obj_3:
    .long 1129077060
    .long 1
    .quad 0
    .quad 4
    .quad .Larr_elems_3
    .balign 8
.Larr_elems_4:
    .quad .Larr_obj_1
    .quad .Larr_obj_2
    .quad .Larr_obj_3
    .balign 8
.Larr_obj_4:
    .long 1129077060
    .long 1
    .quad 0
    .quad 3
    .quad .Larr_elems_4
    .balign 8
.Larr_elems_5:
    .quad 16642
    .quad 16650
    .quad 16658
    .balign 8
.Larr_obj_5:
    .long 1129077060
    .long 1
    .quad 0
    .quad 3
    .quad .Larr_elems_5
    .balign 8
.Larr_elems_6:
    .quad 16643
    .quad 16651
    .quad 16659
    .balign 8
.Larr_obj_6:
    .long 1129077060
    .long 1
    .quad 0
    .quad 3
    .quad .Larr_elems_6
.data
    .balign 8
.Lstr_obj_1:
    .long 1129077060
    .long 0
    .quad 0
    .quad 7
    .quad .Lstr_bytes_1
.Lstr_bytes_1:
    .byte 72, 69, 89, 32, 83, 89, 68, 0
    .balign 8
.Ltd_gtags_63:
    .long 8
    .balign 8
.Ltd_names_63:
    .quad .Ltypedesc_3
    .quad .Ltypedesc_4
    .quad .Ltypedesc_5
    .quad .Ltypedesc_6
    .quad .Ltypedesc_7
    .quad .Ltypedesc_8
    .quad .Ltypedesc_9
    .quad .Ltypedesc_10
    .quad .Ltypedesc_11
    .quad .Ltypedesc_12
    .quad .Ltypedesc_13
    .quad .Ltypedesc_14
    .quad .Ltypedesc_15
    .quad .Ltypedesc_16
    .quad .Ltypedesc_17
    .quad .Ltypedesc_18
    .quad .Ltypedesc_19
    .quad .Ltypedesc_20
    .quad .Ltypedesc_21
    .quad .Ltypedesc_22
    .quad .Ltypedesc_23
    .quad .Ltypedesc_24
    .quad .Ltypedesc_25
    .quad .Ltypedesc_26
    .quad .Ltypedesc_27
    .quad .Ltypedesc_28
    .quad .Ltypedesc_29
    .quad .Ltypedesc_30
    .quad .Ltypedesc_31
    .quad .Ltypedesc_32
    .quad .Ltypedesc_33
    .quad .Ltypedesc_34
    .quad .Ltypedesc_35
    .quad .Ltypedesc_36
    .quad .Ltypedesc_37
    .quad .Ltypedesc_38
    .quad .Ltypedesc_39
    .quad .Ltypedesc_40
    .quad .Ltypedesc_41
    .quad .Ltypedesc_42
    .quad .Ltypedesc_43
    .quad .Ltypedesc_44
    .quad .Ltypedesc_45
    .quad .Ltypedesc_46
    .quad .Ltypedesc_47
    .quad .Ltypedesc_48
    .quad .Ltypedesc_49
    .quad .Ltypedesc_50
    .quad .Ltypedesc_51
    .quad .Ltypedesc_52
    .quad .Ltypedesc_53
    .quad .Ltypedesc_54
    .quad .Ltypedesc_55
    .quad .Ltypedesc_56
    .quad .Ltypedesc_57
    .quad .Ltypedesc_58
    .quad .Ltypedesc_59
    .quad .Ltypedesc_60
    .quad .Ltypedesc_61
    .quad .Ltypedesc_62
    .balign 8
.Ltd_tags_63:
    .long 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10
    .balign 8
.Ltd_desc_63:
    .quad .Ltypedesc_2
    .quad 1
    .quad .Ltd_gtags_63
    .quad 60
    .quad .Ltd_names_63
    .quad .Ltd_tags_63
    .balign 8
.Ltd_gtags_64:
    .long 8
    .balign 8
.Ltd_names_64:
    .quad .Ltypedesc_3
    .balign 8
.Ltd_tags_64:
    .long 10
    .balign 8
.Ltd_desc_64:
    .quad .Ltypedesc_2
    .quad 1
    .quad .Ltd_gtags_64
    .quad 1
    .quad .Ltd_names_64
    .quad .Ltd_tags_64
.globl calynda_global_HDMI_IDENTITY_CSC
calynda_global_HDMI_IDENTITY_CSC:
    .quad .Larr_obj_4
.globl calynda_global_HDMI_CSC_MSB_BASE
calynda_global_HDMI_CSC_MSB_BASE:
    .quad .Larr_obj_5
.globl calynda_global_HDMI_CSC_LSB_BASE
calynda_global_HDMI_CSC_LSB_BASE:
    .quad .Larr_obj_6
.globl calynda_global_FB_WIDTH
calynda_global_FB_WIDTH:
    .quad 0
.globl calynda_global_FB_HEIGHT
calynda_global_FB_HEIGHT:
    .quad 0
.globl calynda_global_THEAD_CMO_STRIDE
calynda_global_THEAD_CMO_STRIDE:
    .quad 0
.globl calynda_global_SCREEN_TEXT_CHAR_ADVANCE
calynda_global_SCREEN_TEXT_CHAR_ADVANCE:
    .quad 0
.globl calynda_global_SCREEN_TEXT_HEIGHT
calynda_global_SCREEN_TEXT_HEIGHT:
    .quad 0
.globl calynda_global_hdmi_diag0
calynda_global_hdmi_diag0:
    .quad 0
.globl calynda_global_hdmi_diag1
calynda_global_hdmi_diag1:
    .quad 0
.globl calynda_global_hdmi_diag2
calynda_global_hdmi_diag2:
    .quad 0
.globl calynda_global_HDMI_PLL_SETTLE_DELAY_US
calynda_global_HDMI_PLL_SETTLE_DELAY_US:
    .quad 0
.globl calynda_global_HDMI_POST_PHY_SETTLE_DELAY_US
calynda_global_HDMI_POST_PHY_SETTLE_DELAY_US:
    .quad 0
.globl calynda_global_HDMI_POST_SCANOUT_ENABLE_DELAY_US
calynda_global_HDMI_POST_SCANOUT_ENABLE_DELAY_US:
    .quad 0
.section .note.GNU-stack,"",@progbits
