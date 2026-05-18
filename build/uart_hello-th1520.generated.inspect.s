.text
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
.globl calynda_unit_fb_in_bounds
calynda_unit_fb_in_bounds:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    ld t0, -24(s0)
    li s1, 0
    slt t1, t0, s1
    xori t1, t1, 1
    bne t1, zero, .Lcalynda_unit_fb_in_bounds_bb1
    j .Lcalynda_unit_fb_in_bounds_bb2
.Lcalynda_unit_fb_in_bounds_bb1:
    ld t0, -32(s0)
    li s1, 0
    slt t2, t0, s1
    xori t2, t2, 1
    sd t2, -56(s0)
    j .Lcalynda_unit_fb_in_bounds_bb3
.Lcalynda_unit_fb_in_bounds_bb2:
    li t0, 0
    sd t0, -56(s0)
    j .Lcalynda_unit_fb_in_bounds_bb3
.Lcalynda_unit_fb_in_bounds_bb3:
    ld t6, -56(s0)
    bne t6, zero, .Lcalynda_unit_fb_in_bounds_bb4
    j .Lcalynda_unit_fb_in_bounds_bb5
.Lcalynda_unit_fb_in_bounds_bb4:
    ld t0, -24(s0)
    la t3, calynda_global_FB_WIDTH
    ld t3, 0(t3)
    slt t3, t0, t3
    sd t3, -48(s0)
    j .Lcalynda_unit_fb_in_bounds_bb6
.Lcalynda_unit_fb_in_bounds_bb5:
    li t0, 0
    sd t0, -48(s0)
    j .Lcalynda_unit_fb_in_bounds_bb6
.Lcalynda_unit_fb_in_bounds_bb6:
    ld t6, -48(s0)
    bne t6, zero, .Lcalynda_unit_fb_in_bounds_bb7
    j .Lcalynda_unit_fb_in_bounds_bb8
.Lcalynda_unit_fb_in_bounds_bb7:
    ld t0, -32(s0)
    la t4, calynda_global_FB_HEIGHT
    ld t4, 0(t4)
    slt t4, t0, t4
    sd t4, -40(s0)
    j .Lcalynda_unit_fb_in_bounds_bb9
.Lcalynda_unit_fb_in_bounds_bb8:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_fb_in_bounds_bb9
.Lcalynda_unit_fb_in_bounds_bb9:
    ld a0, -40(s0)
    addi sp, sp, 64
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
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
.globl calynda_unit_thead_dcache_clean_range
calynda_unit_thead_dcache_clean_range:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -160
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    li s1, 1
    la t2, calynda_global_THEAD_CMO_STRIDE
    ld t2, 0(t2)
    sub t2, t2, s1
    mv t1, t2
    not t1, t1
    ld t0, -24(s0)
    and t3, t0, t1
    mv a0, t3
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_cell_alloc
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t4, a0
    sd t4, -40(s0)
    ld t0, -24(s0)
    ld s1, -32(s0)
    add t5, t0, s1
    mv a0, t5
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_cell_alloc
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t6, a0
    sd t6, -48(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_nlr_push
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -64(s0)
    ld t0, -64(s0)
    sd t0, -56(s0)
    ld t0, -40(s0)
    sd t0, -104(s0)
    ld t0, -48(s0)
    sd t0, -96(s0)
    addi a2, s0, -104
    la a0, calynda_closure_thead_dcache_clean_range_lambda6
    li a1, 2
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_closure_new
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld t0, -56(s0)
    sd t0, -104(s0)
    ld t0, -40(s0)
    sd t0, -96(s0)
    addi a2, s0, -104
    la a0, calynda_closure_thead_dcache_clean_range_nlr7
    li a1, 2
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_closure_new
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -72(s0)
    ld a1, -80(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call calynda_unit_while
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    ld a0, -56(s0)
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -152(s0)
    ld t5, -144(s0)
    ld t4, -136(s0)
    ld t3, -128(s0)
    ld t2, -120(s0)
    ld t1, -112(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld t6, -88(s0)
    bne t6, zero, .Lcalynda_unit_thead_dcache_clean_range_bb1
    j .Lcalynda_unit_thead_dcache_clean_range_bb2
.Lcalynda_unit_thead_dcache_clean_range_bb1:
    addi sp, sp, 160
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_thead_dcache_clean_range_bb2:
    sd t1, -112(s0)
    sd t2, -120(s0)
    sd t3, -128(s0)
    sd t4, -136(s0)
    sd t5, -144(s0)
    sd t6, -152(s0)
    call __calynda_rt_cache_final
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
.globl calynda_unit_fb_border
calynda_unit_fb_border:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -128
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    sd a3, -48(s0)
    sd a4, -56(s0)
    sd a5, -64(s0)
    ld t0, -32(s0)
    ld s1, -64(s0)
    add t1, t0, s1
    li s1, 1
    sub t2, t1, s1
    ld a0, -24(s0)
    ld a1, -32(s0)
    ld a2, -40(s0)
    mv a3, t2
    ld a4, -56(s0)
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    sd t6, -128(s0)
    call calynda_unit_fb_rect
    ld t6, -128(s0)
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    ld t0, -48(s0)
    ld s1, -64(s0)
    sub t3, t0, s1
    li s1, 1
    add t4, t3, s1
    ld a0, -24(s0)
    mv a1, t4
    ld a2, -40(s0)
    ld a3, -48(s0)
    ld a4, -56(s0)
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    sd t6, -128(s0)
    call calynda_unit_fb_rect
    ld t6, -128(s0)
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    ld t0, -24(s0)
    ld s1, -64(s0)
    add t5, t0, s1
    li s1, 1
    sub t6, t5, s1
    ld a0, -24(s0)
    ld a1, -32(s0)
    mv a2, t6
    ld a3, -48(s0)
    ld a4, -56(s0)
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    sd t6, -128(s0)
    call calynda_unit_fb_rect
    ld t6, -128(s0)
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    ld t0, -40(s0)
    ld s1, -64(s0)
    sub t0, t0, s1
    sd t0, -72(s0)
    ld t0, -72(s0)
    li s1, 1
    add t0, t0, s1
    sd t0, -80(s0)
    ld a0, -80(s0)
    ld a1, -32(s0)
    ld a2, -40(s0)
    ld a3, -48(s0)
    ld a4, -56(s0)
    sd t1, -88(s0)
    sd t2, -96(s0)
    sd t3, -104(s0)
    sd t4, -112(s0)
    sd t5, -120(s0)
    sd t6, -128(s0)
    call calynda_unit_fb_rect
    ld t6, -128(s0)
    ld t5, -120(s0)
    ld t4, -112(s0)
    ld t3, -104(s0)
    ld t2, -96(s0)
    ld t1, -88(s0)
    addi sp, sp, 128
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_draw_probe_label
calynda_unit_fb_draw_probe_label:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -176
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    sd a3, -48(s0)
    sd a4, -56(s0)
    ld t0, -40(s0)
    li s1, 6
    mul t1, t0, s1
    li t0, 10
    add t2, t0, t1
    sd t2, -64(s0)
    ld t0, -48(s0)
    li s1, 6
    mul t3, t0, s1
    li t0, 10
    add t4, t0, t3
    sd t4, -72(s0)
    ld t0, -32(s0)
    li s1, 14
    add t5, t0, s1
    ld t0, -24(s0)
    ld s1, -64(s0)
    add t6, t0, s1
    ld t0, -32(s0)
    li s1, 21
    add t0, t0, s1
    sd t0, -80(s0)
    ld a0, -24(s0)
    mv a1, t5
    mv a2, t6
    ld a3, -80(s0)
    ld a4, -56(s0)
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call calynda_unit_fb_rect
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    ld t0, -24(s0)
    li s1, 40
    add t0, t0, s1
    sd t0, -88(s0)
    ld t0, -32(s0)
    li s1, 6
    add t0, t0, s1
    sd t0, -96(s0)
    ld t0, -24(s0)
    li s1, 47
    add t0, t0, s1
    sd t0, -104(s0)
    ld t0, -32(s0)
    li s1, 6
    add t0, t0, s1
    sd t0, -112(s0)
    ld t0, -112(s0)
    ld s1, -72(s0)
    add t0, t0, s1
    sd t0, -120(s0)
    ld a0, -88(s0)
    ld a1, -96(s0)
    ld a2, -104(s0)
    ld a3, -120(s0)
    ld a4, -56(s0)
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call calynda_unit_fb_rect
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    addi sp, sp, 176
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_draw_row_markers_lambda8
calynda_unit_fb_draw_row_markers_lambda8:
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
.globl calynda_unit_fb_draw_row_markers_nlr9
calynda_unit_fb_draw_row_markers_nlr9:
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
    ld t0, 16(s11)
    sd t0, -40(s0)
    ld t0, 24(s11)
    sd t0, -48(s0)
    ld t0, 32(s11)
    sd t0, -56(s0)
    ld t0, -32(s0)
    li s1, 18
    add t1, t0, s1
    ld t0, -40(s0)
    li s1, 18
    add t2, t0, s1
    ld a0, -48(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call __calynda_rt_cell_read
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    mv t3, a0
    li s1, 16
    mul t4, t3, s1
    add t5, t2, t4
    ld t0, -56(s0)
    li s1, 18
    sub t6, t0, s1
    ld t0, -40(s0)
    li s1, 25
    add t0, t0, s1
    sd t0, -64(s0)
    ld a0, -48(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call __calynda_rt_cell_read
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld t0, -72(s0)
    li s1, 16
    mul t0, t0, s1
    sd t0, -80(s0)
    ld t0, -64(s0)
    ld s1, -80(s0)
    add t0, t0, s1
    sd t0, -88(s0)
    li a0, 0
    li a1, 0
    li a2, 0
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call calynda_unit_RGB
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    mv t0, a0
    sd t0, -96(s0)
    mv a0, t1
    mv a1, t5
    mv a2, t6
    ld a3, -88(s0)
    ld a4, -96(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call calynda_unit_fb_rect
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    ld a0, -48(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call __calynda_rt_cell_read
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld t0, -104(s0)
    li s1, 1
    add t0, t0, s1
    sd t0, -112(s0)
    ld a0, -48(s0)
    ld a1, -112(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call __calynda_rt_cell_write
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    addi sp, sp, 160
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_draw_row_markers
calynda_unit_fb_draw_row_markers:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -176
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    sd a3, -48(s0)
    li a0, 0
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_cell_alloc
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t1, a0
    sd t1, -56(s0)
    ld t0, -48(s0)
    li s1, 1
    add t2, t0, s1
    mv a0, t2
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_cell_alloc
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t3, a0
    sd t3, -64(s0)
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_nlr_push
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t4, a0
    sd t4, -72(s0)
    ld t0, -56(s0)
    sd t0, -120(s0)
    ld t0, -64(s0)
    sd t0, -112(s0)
    addi a2, s0, -120
    la a0, calynda_closure_fb_draw_row_markers_lambda8
    li a1, 2
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_closure_new
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t5, a0
    ld t0, -72(s0)
    sd t0, -120(s0)
    ld t0, -24(s0)
    sd t0, -112(s0)
    ld t0, -40(s0)
    sd t0, -104(s0)
    ld t0, -56(s0)
    sd t0, -96(s0)
    ld t0, -32(s0)
    sd t0, -88(s0)
    addi a2, s0, -120
    la a0, calynda_closure_fb_draw_row_markers_nlr9
    li a1, 5
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_closure_new
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t6, a0
    mv a0, t5
    mv a1, t6
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call calynda_unit_while
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    ld a0, -72(s0)
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld t6, -80(s0)
    bne t6, zero, .Lcalynda_unit_fb_draw_row_markers_bb1
    j .Lcalynda_unit_fb_draw_row_markers_bb2
.Lcalynda_unit_fb_draw_row_markers_bb1:
    addi sp, sp, 176
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_fb_draw_row_markers_bb2:
    addi sp, sp, 176
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_draw_col_markers_lambda10
calynda_unit_fb_draw_col_markers_lambda10:
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
.globl calynda_unit_fb_draw_col_markers_nlr11
calynda_unit_fb_draw_col_markers_nlr11:
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
    ld t0, 16(s11)
    sd t0, -40(s0)
    ld t0, 24(s11)
    sd t0, -48(s0)
    ld t0, 32(s11)
    sd t0, -56(s0)
    ld t0, -32(s0)
    li s1, 18
    add t1, t0, s1
    ld a0, -40(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call __calynda_rt_cell_read
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    mv t2, a0
    li s1, 16
    mul t3, t2, s1
    add t4, t1, t3
    ld t0, -48(s0)
    li s1, 72
    add t5, t0, s1
    ld t0, -32(s0)
    li s1, 25
    add t6, t0, s1
    ld a0, -40(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call __calynda_rt_cell_read
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    mv t0, a0
    sd t0, -64(s0)
    ld t0, -64(s0)
    li s1, 16
    mul t0, t0, s1
    sd t0, -72(s0)
    ld s1, -72(s0)
    add t0, t6, s1
    sd t0, -80(s0)
    ld t0, -56(s0)
    li s1, 18
    sub t0, t0, s1
    sd t0, -88(s0)
    li a0, 0
    li a1, 0
    li a2, 0
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call calynda_unit_RGB
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    mv t0, a0
    sd t0, -96(s0)
    mv a0, t4
    mv a1, t5
    ld a2, -80(s0)
    ld a3, -88(s0)
    ld a4, -96(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call calynda_unit_fb_rect
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    ld a0, -40(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call __calynda_rt_cell_read
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld t0, -104(s0)
    li s1, 1
    add t0, t0, s1
    sd t0, -112(s0)
    ld a0, -40(s0)
    ld a1, -112(s0)
    sd t1, -120(s0)
    sd t2, -128(s0)
    sd t3, -136(s0)
    sd t4, -144(s0)
    sd t5, -152(s0)
    sd t6, -160(s0)
    call __calynda_rt_cell_write
    ld t6, -160(s0)
    ld t5, -152(s0)
    ld t4, -144(s0)
    ld t3, -136(s0)
    ld t2, -128(s0)
    ld t1, -120(s0)
    addi sp, sp, 160
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_draw_col_markers
calynda_unit_fb_draw_col_markers:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -176
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    sd a3, -48(s0)
    li a0, 0
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_cell_alloc
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t1, a0
    sd t1, -56(s0)
    ld t0, -48(s0)
    li s1, 1
    add t2, t0, s1
    mv a0, t2
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_cell_alloc
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t3, a0
    sd t3, -64(s0)
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_nlr_push
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t4, a0
    sd t4, -72(s0)
    ld t0, -56(s0)
    sd t0, -120(s0)
    ld t0, -64(s0)
    sd t0, -112(s0)
    addi a2, s0, -120
    la a0, calynda_closure_fb_draw_col_markers_lambda10
    li a1, 2
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_closure_new
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t5, a0
    ld t0, -72(s0)
    sd t0, -120(s0)
    ld t0, -24(s0)
    sd t0, -112(s0)
    ld t0, -56(s0)
    sd t0, -104(s0)
    ld t0, -32(s0)
    sd t0, -96(s0)
    ld t0, -40(s0)
    sd t0, -88(s0)
    addi a2, s0, -120
    la a0, calynda_closure_fb_draw_col_markers_nlr11
    li a1, 5
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_closure_new
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t6, a0
    mv a0, t5
    mv a1, t6
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call calynda_unit_while
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    ld a0, -72(s0)
    sd t1, -128(s0)
    sd t2, -136(s0)
    sd t3, -144(s0)
    sd t4, -152(s0)
    sd t5, -160(s0)
    sd t6, -168(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -168(s0)
    ld t5, -160(s0)
    ld t4, -152(s0)
    ld t3, -144(s0)
    ld t2, -136(s0)
    ld t1, -128(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld t6, -80(s0)
    bne t6, zero, .Lcalynda_unit_fb_draw_col_markers_bb1
    j .Lcalynda_unit_fb_draw_col_markers_bb2
.Lcalynda_unit_fb_draw_col_markers_bb1:
    addi sp, sp, 176
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_fb_draw_col_markers_bb2:
    addi sp, sp, 176
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_draw_probe_cell
calynda_unit_fb_draw_probe_cell:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -400
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    sd a3, -48(s0)
    sd a4, -56(s0)
    sd a5, -64(s0)
    ld t0, -32(s0)
    ld s1, -56(s0)
    mul t1, t0, s1
    sd t1, -72(s0)
    ld t0, -24(s0)
    ld s1, -64(s0)
    mul t2, t0, s1
    sd t2, -80(s0)
    ld t0, -40(s0)
    li s1, 1
    sub t3, t0, s1
    ld t0, -32(s0)
    sub t4, t0, t3
    seqz t4, t4
    bne t4, zero, .Lcalynda_unit_fb_draw_probe_cell_bb1
    j .Lcalynda_unit_fb_draw_probe_cell_bb2
.Lcalynda_unit_fb_draw_probe_cell_bb1:
    li s1, 1
    la t5, calynda_global_FB_WIDTH
    ld t5, 0(t5)
    sub t5, t5, s1
    sd t5, -96(s0)
    j .Lcalynda_unit_fb_draw_probe_cell_bb3
.Lcalynda_unit_fb_draw_probe_cell_bb2:
    ld t0, -32(s0)
    li s1, 1
    add t6, t0, s1
    ld s1, -56(s0)
    mul t0, t6, s1
    sd t0, -136(s0)
    ld t0, -136(s0)
    li s1, 1
    sub t0, t0, s1
    sd t0, -144(s0)
    ld t0, -144(s0)
    sd t0, -96(s0)
    j .Lcalynda_unit_fb_draw_probe_cell_bb3
.Lcalynda_unit_fb_draw_probe_cell_bb3:
    ld t0, -96(s0)
    sd t0, -88(s0)
    ld t0, -48(s0)
    li s1, 1
    sub t0, t0, s1
    sd t0, -152(s0)
    ld t0, -24(s0)
    ld s1, -152(s0)
    sub t0, t0, s1
    seqz t0, t0
    sd t0, -160(s0)
    ld t6, -160(s0)
    bne t6, zero, .Lcalynda_unit_fb_draw_probe_cell_bb4
    j .Lcalynda_unit_fb_draw_probe_cell_bb5
.Lcalynda_unit_fb_draw_probe_cell_bb4:
    li s1, 1
    la t0, calynda_global_FB_HEIGHT
    ld t0, 0(t0)
    sub t0, t0, s1
    sd t0, -168(s0)
    ld t0, -168(s0)
    sd t0, -112(s0)
    j .Lcalynda_unit_fb_draw_probe_cell_bb6
.Lcalynda_unit_fb_draw_probe_cell_bb5:
    ld t0, -24(s0)
    li s1, 1
    add t0, t0, s1
    sd t0, -176(s0)
    ld t0, -176(s0)
    ld s1, -64(s0)
    mul t0, t0, s1
    sd t0, -184(s0)
    ld t0, -184(s0)
    li s1, 1
    sub t0, t0, s1
    sd t0, -192(s0)
    ld t0, -192(s0)
    sd t0, -112(s0)
    j .Lcalynda_unit_fb_draw_probe_cell_bb6
.Lcalynda_unit_fb_draw_probe_cell_bb6:
    ld t0, -112(s0)
    sd t0, -104(s0)
    ld t0, -56(s0)
    li s1, 64
    sub t0, t0, s1
    sd t0, -200(s0)
    ld t0, -200(s0)
    li s1, 2
    div t0, t0, s1
    sd t0, -208(s0)
    ld t0, -72(s0)
    ld s1, -208(s0)
    add t0, t0, s1
    sd t0, -216(s0)
    ld t0, -216(s0)
    sd t0, -120(s0)
    ld t0, -64(s0)
    li s1, 32
    sub t0, t0, s1
    sd t0, -224(s0)
    ld t0, -224(s0)
    li s1, 2
    div t0, t0, s1
    sd t0, -232(s0)
    ld t0, -80(s0)
    ld s1, -232(s0)
    add t0, t0, s1
    sd t0, -240(s0)
    ld t0, -240(s0)
    sd t0, -128(s0)
    ld t0, -72(s0)
    li s1, 4
    add t0, t0, s1
    sd t0, -248(s0)
    ld t0, -80(s0)
    li s1, 4
    add t0, t0, s1
    sd t0, -256(s0)
    ld t0, -88(s0)
    li s1, 4
    sub t0, t0, s1
    sd t0, -264(s0)
    ld t0, -104(s0)
    li s1, 4
    sub t0, t0, s1
    sd t0, -272(s0)
    la a0, calynda_global_PROBE_COLS
    ld a0, 0(a0)
    ld a1, -32(s0)
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call __calynda_rt_index_load
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    mv t0, a0
    sd t0, -288(s0)
    ld t0, -288(s0)
    sd t0, -280(s0)
    ld a0, -248(s0)
    ld a1, -256(s0)
    ld a2, -264(s0)
    ld a3, -272(s0)
    ld a4, -280(s0)
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call calynda_unit_fb_rect
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    li a0, 0xFF
    li a1, 0xFF
    li a2, 0xFF
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call calynda_unit_RGB
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    mv t0, a0
    sd t0, -296(s0)
    ld a0, -72(s0)
    ld a1, -80(s0)
    ld a2, -88(s0)
    ld a3, -104(s0)
    ld a4, -296(s0)
    li a5, 2
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call calynda_unit_fb_border
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    ld a0, -72(s0)
    ld a1, -88(s0)
    ld a2, -80(s0)
    ld a3, -24(s0)
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call calynda_unit_fb_draw_row_markers
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    ld a0, -72(s0)
    ld a1, -80(s0)
    ld a2, -104(s0)
    ld a3, -32(s0)
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call calynda_unit_fb_draw_col_markers
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    ld t0, -120(s0)
    li s1, 10
    sub t0, t0, s1
    sd t0, -304(s0)
    ld t0, -128(s0)
    li s1, 10
    sub t0, t0, s1
    sd t0, -312(s0)
    ld t0, -120(s0)
    li s1, 73
    add t0, t0, s1
    sd t0, -320(s0)
    ld t0, -128(s0)
    li s1, 41
    add t0, t0, s1
    sd t0, -328(s0)
    li a0, 0
    li a1, 0
    li a2, 0
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call calynda_unit_RGB
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    mv t0, a0
    sd t0, -336(s0)
    ld a0, -304(s0)
    ld a1, -312(s0)
    ld a2, -320(s0)
    ld a3, -328(s0)
    ld a4, -336(s0)
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call calynda_unit_fb_rect
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    li a0, 0xFF
    li a1, 0xFF
    li a2, 0xFF
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call calynda_unit_RGB
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    mv t0, a0
    sd t0, -344(s0)
    ld a0, -120(s0)
    ld a1, -128(s0)
    ld a2, -32(s0)
    ld a3, -24(s0)
    ld a4, -344(s0)
    sd t1, -352(s0)
    sd t2, -360(s0)
    sd t3, -368(s0)
    sd t4, -376(s0)
    sd t5, -384(s0)
    sd t6, -392(s0)
    call calynda_unit_fb_draw_probe_label
    ld t6, -392(s0)
    ld t5, -384(s0)
    ld t4, -376(s0)
    ld t3, -368(s0)
    ld t2, -360(s0)
    ld t1, -352(s0)
    addi sp, sp, 400
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_layout_probe_row_lambda12
calynda_unit_fb_layout_probe_row_lambda12:
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
.globl calynda_unit_fb_layout_probe_row_nlr13
calynda_unit_fb_layout_probe_row_nlr13:
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
    ld t0, 40(s11)
    sd t0, -64(s0)
    ld t0, 48(s11)
    sd t0, -72(s0)
    ld a0, -40(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    call __calynda_rt_cell_read
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    mv t1, a0
    ld a0, -32(s0)
    mv a1, t1
    ld a2, -48(s0)
    ld a3, -56(s0)
    ld a4, -64(s0)
    ld a5, -72(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    call calynda_unit_fb_draw_probe_cell
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    ld a0, -40(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    call __calynda_rt_cell_read
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    mv t2, a0
    li s1, 1
    add t3, t2, s1
    ld a0, -40(s0)
    mv a1, t3
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    call __calynda_rt_cell_write
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    addi sp, sp, 96
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_layout_probe_row
calynda_unit_fb_layout_probe_row:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -176
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    sd a2, -40(s0)
    sd a3, -48(s0)
    sd a4, -56(s0)
    li a0, 0
    sd t1, -136(s0)
    sd t2, -144(s0)
    sd t3, -152(s0)
    sd t4, -160(s0)
    sd t5, -168(s0)
    call __calynda_rt_cell_alloc
    ld t5, -168(s0)
    ld t4, -160(s0)
    ld t3, -152(s0)
    ld t2, -144(s0)
    ld t1, -136(s0)
    mv t1, a0
    sd t1, -64(s0)
    sd t1, -136(s0)
    sd t2, -144(s0)
    sd t3, -152(s0)
    sd t4, -160(s0)
    sd t5, -168(s0)
    call __calynda_rt_nlr_push
    ld t5, -168(s0)
    ld t4, -160(s0)
    ld t3, -152(s0)
    ld t2, -144(s0)
    ld t1, -136(s0)
    mv t2, a0
    sd t2, -72(s0)
    ld t0, -64(s0)
    sd t0, -128(s0)
    ld t0, -32(s0)
    sd t0, -120(s0)
    addi a2, s0, -128
    la a0, calynda_closure_fb_layout_probe_row_lambda12
    li a1, 2
    sd t1, -136(s0)
    sd t2, -144(s0)
    sd t3, -152(s0)
    sd t4, -160(s0)
    sd t5, -168(s0)
    call __calynda_rt_closure_new
    ld t5, -168(s0)
    ld t4, -160(s0)
    ld t3, -152(s0)
    ld t2, -144(s0)
    ld t1, -136(s0)
    mv t3, a0
    ld t0, -72(s0)
    sd t0, -128(s0)
    ld t0, -24(s0)
    sd t0, -120(s0)
    ld t0, -64(s0)
    sd t0, -112(s0)
    ld t0, -32(s0)
    sd t0, -104(s0)
    ld t0, -40(s0)
    sd t0, -96(s0)
    ld t0, -48(s0)
    sd t0, -88(s0)
    ld t0, -56(s0)
    sd t0, -80(s0)
    addi a2, s0, -128
    la a0, calynda_closure_fb_layout_probe_row_nlr13
    li a1, 7
    sd t1, -136(s0)
    sd t2, -144(s0)
    sd t3, -152(s0)
    sd t4, -160(s0)
    sd t5, -168(s0)
    call __calynda_rt_closure_new
    ld t5, -168(s0)
    ld t4, -160(s0)
    ld t3, -152(s0)
    ld t2, -144(s0)
    ld t1, -136(s0)
    mv t4, a0
    mv a0, t3
    mv a1, t4
    sd t1, -136(s0)
    sd t2, -144(s0)
    sd t3, -152(s0)
    sd t4, -160(s0)
    sd t5, -168(s0)
    call calynda_unit_while
    ld t5, -168(s0)
    ld t4, -160(s0)
    ld t3, -152(s0)
    ld t2, -144(s0)
    ld t1, -136(s0)
    ld a0, -72(s0)
    sd t1, -136(s0)
    sd t2, -144(s0)
    sd t3, -152(s0)
    sd t4, -160(s0)
    sd t5, -168(s0)
    call __calynda_rt_nlr_check_pop
    ld t5, -168(s0)
    ld t4, -160(s0)
    ld t3, -152(s0)
    ld t2, -144(s0)
    ld t1, -136(s0)
    mv t5, a0
    bne t5, zero, .Lcalynda_unit_fb_layout_probe_row_bb1
    j .Lcalynda_unit_fb_layout_probe_row_bb2
.Lcalynda_unit_fb_layout_probe_row_bb1:
    addi sp, sp, 176
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_fb_layout_probe_row_bb2:
    addi sp, sp, 176
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_layout_probe_lambda14
calynda_unit_fb_layout_probe_lambda14:
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
.globl calynda_unit_fb_layout_probe_nlr15
calynda_unit_fb_layout_probe_nlr15:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -128
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
    ld t0, 40(s11)
    sd t0, -64(s0)
    ld a0, -32(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    sd t4, -104(s0)
    sd t5, -112(s0)
    sd t6, -120(s0)
    call __calynda_rt_cell_read
    ld t6, -120(s0)
    ld t5, -112(s0)
    ld t4, -104(s0)
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    mv t1, a0
    ld a0, -40(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    sd t4, -104(s0)
    sd t5, -112(s0)
    sd t6, -120(s0)
    call __calynda_rt_cell_read
    ld t6, -120(s0)
    ld t5, -112(s0)
    ld t4, -104(s0)
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    mv t2, a0
    ld a0, -48(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    sd t4, -104(s0)
    sd t5, -112(s0)
    sd t6, -120(s0)
    call __calynda_rt_cell_read
    ld t6, -120(s0)
    ld t5, -112(s0)
    ld t4, -104(s0)
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    mv t3, a0
    ld a0, -56(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    sd t4, -104(s0)
    sd t5, -112(s0)
    sd t6, -120(s0)
    call __calynda_rt_cell_read
    ld t6, -120(s0)
    ld t5, -112(s0)
    ld t4, -104(s0)
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    mv t4, a0
    ld a0, -64(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    sd t4, -104(s0)
    sd t5, -112(s0)
    sd t6, -120(s0)
    call __calynda_rt_cell_read
    ld t6, -120(s0)
    ld t5, -112(s0)
    ld t4, -104(s0)
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    mv t5, a0
    mv a0, t1
    mv a1, t2
    mv a2, t3
    mv a3, t4
    mv a4, t5
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    sd t4, -104(s0)
    sd t5, -112(s0)
    sd t6, -120(s0)
    call calynda_unit_fb_layout_probe_row
    ld t6, -120(s0)
    ld t5, -112(s0)
    ld t4, -104(s0)
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    ld a0, -32(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    sd t4, -104(s0)
    sd t5, -112(s0)
    sd t6, -120(s0)
    call __calynda_rt_cell_read
    ld t6, -120(s0)
    ld t5, -112(s0)
    ld t4, -104(s0)
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    mv t6, a0
    li s1, 1
    add t0, t6, s1
    sd t0, -72(s0)
    ld a0, -32(s0)
    ld a1, -72(s0)
    sd t1, -80(s0)
    sd t2, -88(s0)
    sd t3, -96(s0)
    sd t4, -104(s0)
    sd t5, -112(s0)
    sd t6, -120(s0)
    call __calynda_rt_cell_write
    ld t6, -120(s0)
    ld t5, -112(s0)
    ld t4, -104(s0)
    ld t3, -96(s0)
    ld t2, -88(s0)
    ld t1, -80(s0)
    addi sp, sp, 128
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_fb_layout_probe
calynda_unit_fb_layout_probe:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -256
    sd t0, -24(s0)
    sd s1, -32(s0)
    li a0, 8
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_cell_alloc
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t1, a0
    sd t1, -24(s0)
    li a0, 4
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_cell_alloc
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t2, a0
    sd t2, -32(s0)
    ld a0, -24(s0)
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_cell_read
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t3, a0
    la t4, calynda_global_FB_WIDTH
    ld t4, 0(t4)
    div t4, t4, t3
    mv a0, t4
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_cell_alloc
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t5, a0
    sd t5, -40(s0)
    ld a0, -32(s0)
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_cell_read
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t6, a0
    la t0, calynda_global_FB_HEIGHT
    ld t0, 0(t0)
    div t0, t0, t6
    sd t0, -72(s0)
    ld a0, -72(s0)
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_cell_alloc
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld t0, -80(s0)
    sd t0, -48(s0)
    li a0, 0
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_cell_alloc
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld t0, -88(s0)
    sd t0, -56(s0)
    li a0, 0x10
    li a1, 0x10
    li a2, 0x10
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call calynda_unit_RGB
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_97_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_97_wait
    li t6, 97
    sw t6, 0(t5)
    call calynda_unit_fb_fill
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    li s1, 1
    la t0, calynda_global_FB_WIDTH
    ld t0, 0(t0)
    sub t0, t0, s1
    sd t0, -104(s0)
    li s1, 1
    la t0, calynda_global_FB_HEIGHT
    ld t0, 0(t0)
    sub t0, t0, s1
    sd t0, -112(s0)
    li a0, 0xFF
    li a1, 0xFF
    li a2, 0xFF
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call calynda_unit_RGB
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t0, a0
    sd t0, -120(s0)
    li a0, 0
    li a1, 0
    ld a2, -104(s0)
    ld a3, -112(s0)
    ld a4, -120(s0)
    li a5, 4
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_98_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_98_wait
    li t6, 98
    sw t6, 0(t5)
    call calynda_unit_fb_border
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_nlr_push
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t0, a0
    sd t0, -128(s0)
    ld t0, -128(s0)
    sd t0, -64(s0)
    ld t0, -56(s0)
    sd t0, -200(s0)
    ld t0, -32(s0)
    sd t0, -192(s0)
    addi a2, s0, -200
    la a0, calynda_closure_fb_layout_probe_lambda14
    li a1, 2
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_99_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_99_wait
    li t6, 99
    sw t6, 0(t5)
    call __calynda_rt_closure_new
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t0, a0
    sd t0, -136(s0)
    ld t0, -64(s0)
    sd t0, -200(s0)
    ld t0, -56(s0)
    sd t0, -192(s0)
    ld t0, -24(s0)
    sd t0, -184(s0)
    ld t0, -32(s0)
    sd t0, -176(s0)
    ld t0, -40(s0)
    sd t0, -168(s0)
    ld t0, -48(s0)
    sd t0, -160(s0)
    addi a2, s0, -200
    la a0, calynda_closure_fb_layout_probe_nlr15
    li a1, 6
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_closure_new
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t0, a0
    sd t0, -144(s0)
    ld a0, -136(s0)
    ld a1, -144(s0)
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call calynda_unit_while
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    ld a0, -64(s0)
    sd t1, -208(s0)
    sd t2, -216(s0)
    sd t3, -224(s0)
    sd t4, -232(s0)
    sd t5, -240(s0)
    sd t6, -248(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -248(s0)
    ld t5, -240(s0)
    ld t4, -232(s0)
    ld t3, -224(s0)
    ld t2, -216(s0)
    ld t1, -208(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld t6, -152(s0)
    bne t6, zero, .Lcalynda_unit_fb_layout_probe_bb1
    j .Lcalynda_unit_fb_layout_probe_bb2
.Lcalynda_unit_fb_layout_probe_bb1:
    addi sp, sp, 256
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_fb_layout_probe_bb2:
    addi sp, sp, 256
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
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
.globl calynda_unit_dpu0_pll_configure_1080p60_lambda16
calynda_unit_dpu0_pll_configure_1080p60_lambda16:
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
    bne t2, zero, .Lcalynda_unit_dpu0_pll_configure_1080p60_lambda16_bb1
    j .Lcalynda_unit_dpu0_pll_configure_1080p60_lambda16_bb2
.Lcalynda_unit_dpu0_pll_configure_1080p60_lambda16_bb1:
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
    j .Lcalynda_unit_dpu0_pll_configure_1080p60_lambda16_bb3
.Lcalynda_unit_dpu0_pll_configure_1080p60_lambda16_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_dpu0_pll_configure_1080p60_lambda16_bb3
.Lcalynda_unit_dpu0_pll_configure_1080p60_lambda16_bb3:
    ld a0, -40(s0)
    addi sp, sp, 112
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_dpu0_pll_configure_1080p60_nlr17
calynda_unit_dpu0_pll_configure_1080p60_nlr17:
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
    la a0, calynda_closure_dpu0_pll_configure_1080p60_lambda16
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
    la a0, calynda_closure_dpu0_pll_configure_1080p60_nlr17
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
.globl calynda_unit_dpu1_pll_configure_1080p60_lambda18
calynda_unit_dpu1_pll_configure_1080p60_lambda18:
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
    bne t2, zero, .Lcalynda_unit_dpu1_pll_configure_1080p60_lambda18_bb1
    j .Lcalynda_unit_dpu1_pll_configure_1080p60_lambda18_bb2
.Lcalynda_unit_dpu1_pll_configure_1080p60_lambda18_bb1:
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
    j .Lcalynda_unit_dpu1_pll_configure_1080p60_lambda18_bb3
.Lcalynda_unit_dpu1_pll_configure_1080p60_lambda18_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_dpu1_pll_configure_1080p60_lambda18_bb3
.Lcalynda_unit_dpu1_pll_configure_1080p60_lambda18_bb3:
    ld a0, -40(s0)
    addi sp, sp, 112
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_dpu1_pll_configure_1080p60_nlr19
calynda_unit_dpu1_pll_configure_1080p60_nlr19:
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
    la a0, calynda_closure_dpu1_pll_configure_1080p60_lambda18
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
    la a0, calynda_closure_dpu1_pll_configure_1080p60_nlr19
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
.globl calynda_unit_forRange_lambda20
calynda_unit_forRange_lambda20:
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
.globl calynda_unit_forRange
calynda_unit_forRange:
    addi sp, sp, -56
    sd ra, 48(sp)
    sd s0, 40(sp)
    addi s0, sp, 56
    sd a0, 24(sp)
    sd a1, 16(sp)
    sd a2, 8(sp)
    li a0, 'q'
    ld a1, 8(sp)
    ld a2, 24(sp)
    call __calynda_rt_debug_pair
    li a0, 'Q'
    ld a1, 16(sp)
    li a2, 0
    call __calynda_rt_debug_pair
.Lcalynda_iter_forRange_loop:
    ld t0, 24(sp)
    ld t1, 16(sp)
    bge t0, t1, .Lcalynda_iter_forRange_done
    sd t0, 0(sp)
    ld a0, 8(sp)
    li a1, 1
    mv a2, sp
    call __calynda_rt_call_callable
    ld t0, 24(sp)
    addi t0, t0, 1
    sd t0, 24(sp)
    j .Lcalynda_iter_forRange_loop
.Lcalynda_iter_forRange_done:
    li a0, 0
    ld s0, 40(sp)
    ld ra, 48(sp)
    addi sp, sp, 56
    ret
.globl calynda_unit_hdmi_phy_i2cm_write_once_lambda21
calynda_unit_hdmi_phy_i2cm_write_once_lambda21:
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
    bne t2, zero, .Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda21_bb1
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda21_bb2
.Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda21_bb1:
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
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda21_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda21_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda21_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_once_lambda21_bb3:
    ld a0, -40(s0)
    addi sp, sp, 80
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23
calynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23:
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
    bne t5, zero, .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23_bb1
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23_bb2
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23_bb1:
    li t0, 1
    sd t0, -56(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23_bb2:
    li t6, 1
    neg t6, t6
    sd t6, -56(s0)
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23_bb3
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23_bb3:
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
.globl calynda_unit_hdmi_phy_i2cm_write_once_nlr22_lambda24
calynda_unit_hdmi_phy_i2cm_write_once_nlr22_lambda24:
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
.globl calynda_unit_hdmi_phy_i2cm_write_once_nlr22
calynda_unit_hdmi_phy_i2cm_write_once_nlr22:
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
    la a0, calynda_closure_hdmi_phy_i2cm_write_once_nlr22_nlr23
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
    la a0, calynda_closure_hdmi_phy_i2cm_write_once_nlr22_lambda24
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
    bne t6, zero, .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_bb1
    j .Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_bb2
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_bb1:
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
.Lcalynda_unit_hdmi_phy_i2cm_write_once_nlr22_bb2:
    addi sp, sp, 192
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
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
    la a0, calynda_closure_hdmi_phy_i2cm_write_once_lambda21
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
    la a0, calynda_closure_hdmi_phy_i2cm_write_once_nlr22
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
.globl calynda_unit_hdmi_phy_i2cm_write_attempt_nlr25
calynda_unit_hdmi_phy_i2cm_write_attempt_nlr25:
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
.globl calynda_unit_hdmi_phy_i2cm_write_attempt_lambda26
calynda_unit_hdmi_phy_i2cm_write_attempt_lambda26:
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
    la a0, calynda_closure_hdmi_phy_i2cm_write_attempt_nlr25
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
    la a0, calynda_closure_hdmi_phy_i2cm_write_attempt_lambda26
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
.globl calynda_unit_hdmi_program_identity_csc_lambda27_lambda28
calynda_unit_hdmi_program_identity_csc_lambda27_lambda28:
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
.globl calynda_unit_hdmi_program_identity_csc_lambda27
calynda_unit_hdmi_program_identity_csc_lambda27:
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
    la a0, calynda_closure_hdmi_program_identity_csc_lambda27_lambda28
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
.globl calynda_unit_hdmi_program_identity_csc
calynda_unit_hdmi_program_identity_csc:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -64
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t0, 0xFFEF540000
    sd t0, -24(s0)
    ld t0, -24(s0)
    sd t0, -32(s0)
    addi a2, s0, -32
    la a0, calynda_closure_hdmi_program_identity_csc_lambda27
    li a1, 1
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_rt_closure_new
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t1, a0
    li a0, 0
    li a1, 3
    mv a2, t1
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call calynda_unit_forRange
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    ld a0, -24(s0)
    li a1, 0x4100
    li a2, 4
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_offset_stride
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t2, a0
    mv a0, t2
    li a1, 0x00
    li a2, 4
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_mmio_store_sized
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    ld a0, -24(s0)
    li a1, 0x4101
    li a2, 4
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_offset_stride
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t3, a0
    mv a0, t3
    li a1, 0x01
    li a2, 4
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_mmio_store_sized
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    ld a0, -24(s0)
    li a1, 0x4004
    li a2, 4
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_offset_stride
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    mv t4, a0
    mv a0, t4
    li a1, 0x00
    li a2, 4
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_mmio_store_sized
    ld t4, -64(s0)
    ld t3, -56(s0)
    ld t2, -48(s0)
    ld t1, -40(s0)
    sd t1, -40(s0)
    sd t2, -48(s0)
    sd t3, -56(s0)
    sd t4, -64(s0)
    call __calynda_rt_fence
    ld t4, -64(s0)
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
.globl calynda_unit_hdmi_clear_overflow_lambda29
calynda_unit_hdmi_clear_overflow_lambda29:
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
.globl calynda_unit_hdmi_clear_overflow
calynda_unit_hdmi_clear_overflow:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -112
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t0, 0xFFEF540000
    sd t0, -24(s0)
    ld a0, -24(s0)
    li a1, 0x1000
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
    mv t2, a0
    mv a0, t2
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
    mv t1, a0
    li s1, 0xFF
    and t3, t1, s1
    mv a0, t3
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_rt_cell_alloc
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t4, a0
    sd t4, -32(s0)
    ld a0, -24(s0)
    li a1, 0x4002
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
    mv t5, a0
    mv a0, t5
    li a1, 0xFD
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
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_rt_fence
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    ld t0, -24(s0)
    sd t0, -56(s0)
    ld t0, -32(s0)
    sd t0, -48(s0)
    addi a2, s0, -56
    la a0, calynda_closure_hdmi_clear_overflow_lambda29
    li a1, 2
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_rt_closure_new
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    mv t6, a0
    li a0, 0
    li a1, 4
    mv a2, t6
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call calynda_unit_forRange
    ld t6, -104(s0)
    ld t5, -96(s0)
    ld t4, -88(s0)
    ld t3, -80(s0)
    ld t2, -72(s0)
    ld t1, -64(s0)
    ld a0, -24(s0)
    li a1, 0x4002
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
    mv t0, a0
    sd t0, -40(s0)
    ld a0, -40(s0)
    li a1, 0xFF
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
    sd t1, -64(s0)
    sd t2, -72(s0)
    sd t3, -80(s0)
    sd t4, -88(s0)
    sd t5, -96(s0)
    sd t6, -104(s0)
    call __calynda_rt_fence
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
.globl calynda_unit_dw_hdmi_init_lambda30
calynda_unit_dw_hdmi_init_lambda30:
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
    bne t2, zero, .Lcalynda_unit_dw_hdmi_init_lambda30_bb1
    j .Lcalynda_unit_dw_hdmi_init_lambda30_bb2
.Lcalynda_unit_dw_hdmi_init_lambda30_bb1:
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
    j .Lcalynda_unit_dw_hdmi_init_lambda30_bb3
.Lcalynda_unit_dw_hdmi_init_lambda30_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_dw_hdmi_init_lambda30_bb3
.Lcalynda_unit_dw_hdmi_init_lambda30_bb3:
    ld a0, -40(s0)
    addi sp, sp, 96
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_dw_hdmi_init_nlr31
calynda_unit_dw_hdmi_init_nlr31:
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
.globl calynda_unit_dw_hdmi_init_nlr32
calynda_unit_dw_hdmi_init_nlr32:
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
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_offset_stride
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0x36
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_mmio_store_sized
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    li a0, 5000
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_delay_us
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t2, a0
    ld a0, -32(s0)
    li a1, 0x4005
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_offset_stride
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t3, a0
    mv a0, t3
    li a1, 0x01
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_mmio_store_sized
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    li a0, 200
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_delay_us
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t4, a0
    ld a0, -32(s0)
    li a1, 0x4005
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_offset_stride
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t5, a0
    mv a0, t5
    li a1, 0x00
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_mmio_store_sized
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    li a0, 10000
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_delay_us
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t6, a0
    ld a0, -32(s0)
    li a1, 0x4007
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_offset_stride
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -40(s0)
    ld a0, -40(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_mmio_store_sized
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    ld a0, -32(s0)
    li a1, 0x3001
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_offset_stride
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -48(s0)
    ld a0, -48(s0)
    li a1, 0x20
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_mmio_store_sized
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    li a0, 100
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_delay_us
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -56(s0)
    ld a0, -32(s0)
    li a1, 0x3020
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_offset_stride
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -64(s0)
    ld a0, -64(s0)
    li a1, 0x69
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_mmio_store_sized
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    li a0, 100
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_delay_us
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -72(s0)
    ld a0, -32(s0)
    li a1, 0x3001
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_offset_stride
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -80(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_mmio_store_sized
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    li a0, 1000
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_delay_us
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld a0, -32(s0)
    li a1, 0x0108
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_offset_stride
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_mmio_store_sized
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    li a0, 0x06
    li a1, 0x0001
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -104(s0)
    li a0, 0x10
    li a1, 0x2080
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -112(s0)
    li a0, 0x11
    li a1, 0x020A
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -120(s0)
    li a0, 0x19
    li a1, 0x0007
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -128(s0)
    li a0, 0x0E
    li a1, 0x01A0
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -136(s0)
    li a0, 0x09
    li a1, 0x8088
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -144(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    ld a0, -32(s0)
    li a1, 0x3000
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_offset_stride
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld a0, -152(s0)
    li a1, 0x2E
    li a2, 4
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_mmio_store_sized
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    sd t1, -160(s0)
    sd t2, -168(s0)
    sd t3, -176(s0)
    sd t4, -184(s0)
    sd t5, -192(s0)
    sd t6, -200(s0)
    call __calynda_rt_fence
    ld t6, -200(s0)
    ld t5, -192(s0)
    ld t4, -184(s0)
    ld t3, -176(s0)
    ld t2, -168(s0)
    ld t1, -160(s0)
    addi sp, sp, 208
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_dw_hdmi_init_lambda33
calynda_unit_dw_hdmi_init_lambda33:
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
.globl calynda_unit_dw_hdmi_init_lambda34
calynda_unit_dw_hdmi_init_lambda34:
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
    bne t2, zero, .Lcalynda_unit_dw_hdmi_init_lambda34_bb1
    j .Lcalynda_unit_dw_hdmi_init_lambda34_bb2
.Lcalynda_unit_dw_hdmi_init_lambda34_bb1:
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
    j .Lcalynda_unit_dw_hdmi_init_lambda34_bb3
.Lcalynda_unit_dw_hdmi_init_lambda34_bb2:
    li t0, 0
    sd t0, -40(s0)
    j .Lcalynda_unit_dw_hdmi_init_lambda34_bb3
.Lcalynda_unit_dw_hdmi_init_lambda34_bb3:
    ld a0, -40(s0)
    addi sp, sp, 96
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_dw_hdmi_init_nlr35
calynda_unit_dw_hdmi_init_nlr35:
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
.globl calynda_unit_dw_hdmi_init
calynda_unit_dw_hdmi_init:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -576
    sd t0, -24(s0)
    sd s1, -32(s0)
    li t0, 0xFFEF540000
    sd t0, -24(s0)
    ld a0, -24(s0)
    li a1, 0x0180
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t1, a0
    mv a0, t1
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x0181
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t2, a0
    mv a0, t2
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x0182
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t3, a0
    mv a0, t3
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x0183
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t4, a0
    mv a0, t4
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x0184
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t5, a0
    mv a0, t5
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x0185
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t6, a0
    mv a0, t6
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x0186
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -80(s0)
    ld a0, -80(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x0187
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -88(s0)
    ld a0, -88(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x0188
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -96(s0)
    ld a0, -96(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x01FF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -104(s0)
    ld a0, -104(s0)
    li a1, 0x03
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_hdmi_program_video_path
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x3000
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -112(s0)
    ld a0, -112(s0)
    li a1, 0x36
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x4005
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -120(s0)
    ld a0, -120(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    li a0, 200
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_delay_us
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -128(s0)
    ld a0, -24(s0)
    li a1, 0x4005
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -136(s0)
    ld a0, -136(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    li a0, 50000
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_delay_us
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -144(s0)
    ld a0, -24(s0)
    li a1, 0x4007
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -152(s0)
    ld a0, -152(s0)
    li a1, 0x01
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x3001
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -160(s0)
    ld a0, -160(s0)
    li a1, 0x20
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    li a0, 100
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_delay_us
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -168(s0)
    ld a0, -24(s0)
    li a1, 0x3020
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -176(s0)
    ld a0, -176(s0)
    li a1, 0x69
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    li a0, 100
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_delay_us
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -184(s0)
    ld a0, -24(s0)
    li a1, 0x3001
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -192(s0)
    ld a0, -192(s0)
    li a1, 0x00
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    li a0, 1000
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_delay_us
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -200(s0)
    ld a0, -24(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_hdmi_seed_phy_window
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    li a0, 1000
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_delay_us
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -208(s0)
    ld a0, -24(s0)
    li a1, 0x0108
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -216(s0)
    ld a0, -216(s0)
    li a1, 0xFF
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x3020
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -232(s0)
    ld a0, -232(s0)
    li a1, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_deref_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -224(s0)
    ld t0, -224(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -240(s0)
    ld s1, -240(s0)
    la t0, calynda_global_hdmi_diag0
    sd s1, 0(t0)
    ld a0, -24(s0)
    li a1, 0x3029
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -256(s0)
    ld a0, -256(s0)
    li a1, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_deref_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -248(s0)
    ld t0, -248(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -264(s0)
    ld s1, -264(s0)
    la t0, calynda_global_hdmi_diag1
    sd s1, 0(t0)
    ld a0, -24(s0)
    li a1, 0x4001
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -280(s0)
    ld a0, -280(s0)
    li a1, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_deref_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -272(s0)
    ld t0, -272(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -288(s0)
    ld s1, -288(s0)
    la t0, calynda_global_hdmi_diag2
    sd s1, 0(t0)
    li a0, 0x06
    li a1, 0x0001
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -296(s0)
    li a0, 0x10
    li a1, 0x2080
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -304(s0)
    li a0, 0x11
    li a1, 0x020A
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -312(s0)
    li a0, 0x19
    li a1, 0x0007
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -320(s0)
    li a0, 0x0E
    li a1, 0x01A0
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -328(s0)
    li a0, 0x09
    li a1, 0x8088
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_hdmi_phy_i2cm_write
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -336(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -24(s0)
    li a1, 0x3000
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -344(s0)
    ld a0, -344(s0)
    li a1, 0x2E
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_store_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_fence
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    li a0, 0
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_cell_alloc
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -352(s0)
    ld t0, -352(s0)
    sd t0, -32(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_nlr_push
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -360(s0)
    ld t0, -360(s0)
    sd t0, -40(s0)
    ld t0, -32(s0)
    sd t0, -528(s0)
    ld t0, -24(s0)
    sd t0, -520(s0)
    addi a2, s0, -528
    la a0, calynda_closure_dw_hdmi_init_lambda30
    li a1, 2
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_closure_new
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -368(s0)
    ld t0, -40(s0)
    sd t0, -528(s0)
    ld t0, -32(s0)
    sd t0, -520(s0)
    addi a2, s0, -528
    la a0, calynda_closure_dw_hdmi_init_nlr31
    li a1, 2
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_closure_new
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -376(s0)
    ld a0, -368(s0)
    ld a1, -376(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_while
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -40(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -384(s0)
    ld t6, -384(s0)
    bne t6, zero, .Lcalynda_unit_dw_hdmi_init_bb1
    j .Lcalynda_unit_dw_hdmi_init_bb2
.Lcalynda_unit_dw_hdmi_init_bb1:
    addi sp, sp, 576
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_dw_hdmi_init_bb2:
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_nlr_push
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -392(s0)
    ld t0, -392(s0)
    sd t0, -48(s0)
    ld a0, -24(s0)
    li a1, 0x3004
    li a2, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -408(s0)
    ld a0, -408(s0)
    li a1, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_deref_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -400(s0)
    ld t0, -400(s0)
    li s1, 0x01
    and t0, t0, s1
    sd t0, -416(s0)
    ld t0, -416(s0)
    li s1, 0
    sub t0, t0, s1
    seqz t0, t0
    sd t0, -424(s0)
    ld t0, -48(s0)
    sd t0, -528(s0)
    ld t0, -24(s0)
    sd t0, -520(s0)
    addi a2, s0, -528
    la a0, calynda_closure_dw_hdmi_init_nlr32
    li a1, 2
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_closure_new
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -432(s0)
    li a2, 0
    la a0, calynda_closure_dw_hdmi_init_lambda33
    li a1, 0
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_closure_new
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -440(s0)
    ld a0, -424(s0)
    ld a1, -432(s0)
    ld a2, -440(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_if
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -48(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -448(s0)
    ld t6, -448(s0)
    bne t6, zero, .Lcalynda_unit_dw_hdmi_init_bb3
    j .Lcalynda_unit_dw_hdmi_init_bb4
.Lcalynda_unit_dw_hdmi_init_bb3:
    addi sp, sp, 576
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.Lcalynda_unit_dw_hdmi_init_bb4:
    li a0, 0
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_cell_alloc
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -456(s0)
    ld t0, -456(s0)
    sd t0, -56(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_nlr_push
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -464(s0)
    ld t0, -464(s0)
    sd t0, -64(s0)
    ld t0, -56(s0)
    sd t0, -528(s0)
    ld t0, -24(s0)
    sd t0, -520(s0)
    addi a2, s0, -528
    la a0, calynda_closure_dw_hdmi_init_lambda34
    li a1, 2
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_closure_new
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -472(s0)
    ld t0, -64(s0)
    sd t0, -528(s0)
    ld t0, -56(s0)
    sd t0, -520(s0)
    addi a2, s0, -528
    la a0, calynda_closure_dw_hdmi_init_nlr35
    li a1, 2
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_closure_new
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -480(s0)
    ld a0, -472(s0)
    ld a1, -480(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_while
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld a0, -64(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_rt_nlr_check_pop
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -488(s0)
    ld t6, -488(s0)
    bne t6, zero, .Lcalynda_unit_dw_hdmi_init_bb5
    j .Lcalynda_unit_dw_hdmi_init_bb6
.Lcalynda_unit_dw_hdmi_init_bb5:
    addi sp, sp, 576
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
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_offset_stride
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -504(s0)
    ld a0, -504(s0)
    li a1, 4
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call __calynda_mmio_deref_sized
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    mv t0, a0
    sd t0, -496(s0)
    ld t0, -496(s0)
    li s1, 0xFF
    and t0, t0, s1
    sd t0, -512(s0)
    ld t0, -512(s0)
    sd t0, -72(s0)
    ld a0, -24(s0)
    sd t1, -536(s0)
    sd t2, -544(s0)
    sd t3, -552(s0)
    sd t4, -560(s0)
    sd t5, -568(s0)
    sd t6, -576(s0)
    call calynda_unit_hdmi_program_video_path_final
    ld t6, -576(s0)
    ld t5, -568(s0)
    ld t4, -560(s0)
    ld t3, -552(s0)
    ld t2, -544(s0)
    ld t1, -536(s0)
    ld s1, -72(s0)
    la t0, calynda_global_hdmi_diag1
    sd s1, 0(t0)
    addi sp, sp, 576
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
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
.globl calynda_unit_scratch_mark
calynda_unit_scratch_mark:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -48
    sd t0, -24(s0)
    sd s1, -32(s0)
    sd a0, -24(s0)
    sd a1, -32(s0)
    li t0, 0x05000000
    sd t0, -40(s0)
    ld a0, -40(s0)
    ld a1, -24(s0)
    li a2, 4
    sd t1, -48(s0)
    call __calynda_offset_stride
    ld t1, -48(s0)
    mv t1, a0
    mv a0, t1
    ld a1, -32(s0)
    li a2, 4
    sd t1, -48(s0)
    call __calynda_mmio_store_sized
    ld t1, -48(s0)
    sd t1, -48(s0)
    call __calynda_rt_fence
    ld t1, -48(s0)
    addi sp, sp, 48
    ld t0, -24(s0)
    ld s1, -32(s0)
    ld s0, 0(sp)
    ld ra, 8(sp)
    addi sp, sp, 16
    ret
.globl calynda_unit_hold_scanout
calynda_unit_hold_scanout:

1:
    nop
    j 1b
.globl calynda_unit_hdmi_hello_world
calynda_unit_hdmi_hello_world:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -32
    sd t0, -24(s0)
    sd s1, -32(s0)
    li a0, 0
    li a1, 0xAA000001
    sd t1, -24(s0)
    sd t2, -32(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_48_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_48_wait
    li t6, 48
    sw t6, 0(t5)
    call calynda_unit_scratch_mark
    ld t2, -32(s0)
    ld t1, -24(s0)
    sd t1, -24(s0)
    sd t2, -32(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_49_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_49_wait
    li t6, 49
    sw t6, 0(t5)
    call calynda_unit_vosys_clk_enable
    ld t2, -32(s0)
    ld t1, -24(s0)
    li a0, 1
    li a1, 0xAA000002
    sd t1, -24(s0)
    sd t2, -32(s0)
    call calynda_unit_scratch_mark
    ld t2, -32(s0)
    ld t1, -24(s0)
    li a0, 500
    sd t1, -24(s0)
    sd t2, -32(s0)
    call calynda_unit_delay_us
    ld t2, -32(s0)
    ld t1, -24(s0)
    mv t1, a0
    sd t1, -24(s0)
    sd t2, -32(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_50_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_50_wait
    li t6, 50
    sw t6, 0(t5)
    call calynda_unit_dpu0_pll_configure_1080p60
    ld t2, -32(s0)
    ld t1, -24(s0)
    sd t1, -24(s0)
    sd t2, -32(s0)
    call calynda_unit_dpu1_pll_configure_1080p60
    ld t2, -32(s0)
    ld t1, -24(s0)
    li a0, 2
    li a1, 0xAA000003
    sd t1, -24(s0)
    sd t2, -32(s0)
    call calynda_unit_scratch_mark
    ld t2, -32(s0)
    ld t1, -24(s0)
    sd t1, -24(s0)
    sd t2, -32(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_51_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_51_wait
    li t6, 51
    sw t6, 0(t5)
    call calynda_unit_fb_layout_probe
    ld t2, -32(s0)
    ld t1, -24(s0)
    sd t1, -24(s0)
    sd t2, -32(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_52_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_52_wait
    li t6, 52
    sw t6, 0(t5)
    call __calynda_rt_fence
    ld t2, -32(s0)
    ld t1, -24(s0)
    li a0, 0x04200000
    li a1, 0x007E9000
    sd t1, -24(s0)
    sd t2, -32(s0)
    call calynda_unit_thead_dcache_clean_range
    ld t2, -32(s0)
    ld t1, -24(s0)
    li a0, 3
    li a1, 0xAA000004
    sd t1, -24(s0)
    sd t2, -32(s0)
    call calynda_unit_scratch_mark
    ld t2, -32(s0)
    ld t1, -24(s0)
    sd t1, -24(s0)
    sd t2, -32(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_53_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_53_wait
    li t6, 53
    sw t6, 0(t5)
    call calynda_unit_dw_hdmi_init
    ld t2, -32(s0)
    ld t1, -24(s0)
    li a0, 7
    li a1, 0xAA000005
    sd t1, -24(s0)
    sd t2, -32(s0)
    call calynda_unit_scratch_mark
    ld t2, -32(s0)
    ld t1, -24(s0)
    sd t1, -24(s0)
    sd t2, -32(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_54_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_54_wait
    li t6, 54
    sw t6, 0(t5)
    call calynda_unit_dc8200_init
    ld t2, -32(s0)
    ld t1, -24(s0)
    li a0, 8
    li a1, 0xAA000006
    sd t1, -24(s0)
    sd t2, -32(s0)
    call calynda_unit_scratch_mark
    ld t2, -32(s0)
    ld t1, -24(s0)
    sd t1, -24(s0)
    sd t2, -32(s0)
    li t5, 0xFFE7014000
.Lcalynda_hdmi_trace_55_wait:
    lw t6, 0x14(t5)
    andi t6, t6, 0x20
    beqz t6, .Lcalynda_hdmi_trace_55_wait
    li t6, 55
    sw t6, 0(t5)
    call calynda_unit_hold_scanout
    ld t2, -32(s0)
    ld t1, -24(s0)
    mv t2, a0
    mv a0, t2
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
.globl calynda_unit___mir_module_init
calynda_unit___mir_module_init:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s0, 0(sp)
    addi s0, sp, 16
    addi sp, sp, -16
    sd t0, -24(s0)
    sd s1, -32(s0)
    li s1, 0x04200000
    la t0, calynda_global_FB_PHYS_ADDR
    sd s1, 0(t0)
    li s1, 0x04200000
    la t0, calynda_global_FB_PHYS
    sd s1, 0(t0)
    li s1, 1920
    la t0, calynda_global_FB_WIDTH
    sd s1, 0(t0)
    li s1, 1080
    la t0, calynda_global_FB_HEIGHT
    sd s1, 0(t0)
    li s1, 0x00001E00
    la t0, calynda_global_FB_STRIDE_BYTES
    sd s1, 0(t0)
    li s1, 0x007E9000
    la t0, calynda_global_FB_SIZE_BYTES
    sd s1, 0(t0)
    li s1, 32
    la t0, calynda_global_THEAD_CMO_STRIDE
    sd s1, 0(t0)
    li s1, 0xFFEF010000
    la t0, calynda_global_AP_CLKGEN_BASE
    sd s1, 0(t0)
    li s1, 0xFFEF528000
    la t0, calynda_global_VOSYS_CLK_GATE_BASE
    sd s1, 0(t0)
    li s1, 0xFFEF540000
    la t0, calynda_global_HDMI_TX_BASE
    sd s1, 0(t0)
    li s1, 5
    la t0, calynda_global_I2CM_ATTEMPTS
    sd s1, 0(t0)
    li s1, 500
    la t0, calynda_global_I2CM_RETRY_DELAY_US
    sd s1, 0(t0)
    li s1, 0
    la t0, calynda_global_hdmi_diag0
    sd s1, 0(t0)
    li s1, 0
    la t0, calynda_global_hdmi_diag1
    sd s1, 0(t0)
    li s1, 0
    la t0, calynda_global_hdmi_diag2
    sd s1, 0(t0)
    addi sp, sp, 16
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
.globl _start
_start:
    li s0, 0
    li ra, 0
    li s11, 0
    call calynda_unit_boot
1:
    j 1b
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
.globl calynda_closure_fb_draw_row_markers_lambda8
calynda_closure_fb_draw_row_markers_lambda8:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_draw_row_markers_lambda8
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_fb_draw_row_markers_nlr9
calynda_closure_fb_draw_row_markers_nlr9:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_draw_row_markers_nlr9
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_fb_draw_col_markers_lambda10
calynda_closure_fb_draw_col_markers_lambda10:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_draw_col_markers_lambda10
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_fb_draw_col_markers_nlr11
calynda_closure_fb_draw_col_markers_nlr11:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_draw_col_markers_nlr11
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_fb_layout_probe_row_lambda12
calynda_closure_fb_layout_probe_row_lambda12:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_layout_probe_row_lambda12
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_fb_layout_probe_row_nlr13
calynda_closure_fb_layout_probe_row_nlr13:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_layout_probe_row_nlr13
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_fb_layout_probe_lambda14
calynda_closure_fb_layout_probe_lambda14:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_layout_probe_lambda14
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_fb_layout_probe_nlr15
calynda_closure_fb_layout_probe_nlr15:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_fb_layout_probe_nlr15
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dpu0_pll_configure_1080p60_lambda16
calynda_closure_dpu0_pll_configure_1080p60_lambda16:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dpu0_pll_configure_1080p60_lambda16
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dpu0_pll_configure_1080p60_nlr17
calynda_closure_dpu0_pll_configure_1080p60_nlr17:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dpu0_pll_configure_1080p60_nlr17
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dpu1_pll_configure_1080p60_lambda18
calynda_closure_dpu1_pll_configure_1080p60_lambda18:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dpu1_pll_configure_1080p60_lambda18
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dpu1_pll_configure_1080p60_nlr19
calynda_closure_dpu1_pll_configure_1080p60_nlr19:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dpu1_pll_configure_1080p60_nlr19
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_forRange_lambda20
calynda_closure_forRange_lambda20:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_forRange_lambda20
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_hdmi_phy_i2cm_write_once_lambda21
calynda_closure_hdmi_phy_i2cm_write_once_lambda21:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_once_lambda21
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_hdmi_phy_i2cm_write_once_nlr22_nlr23
calynda_closure_hdmi_phy_i2cm_write_once_nlr22_nlr23:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_once_nlr22_nlr23
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_hdmi_phy_i2cm_write_once_nlr22_lambda24
calynda_closure_hdmi_phy_i2cm_write_once_nlr22_lambda24:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_once_nlr22_lambda24
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_hdmi_phy_i2cm_write_once_nlr22
calynda_closure_hdmi_phy_i2cm_write_once_nlr22:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_once_nlr22
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_hdmi_phy_i2cm_write_attempt_nlr25
calynda_closure_hdmi_phy_i2cm_write_attempt_nlr25:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_attempt_nlr25
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_hdmi_phy_i2cm_write_attempt_lambda26
calynda_closure_hdmi_phy_i2cm_write_attempt_lambda26:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_hdmi_phy_i2cm_write_attempt_lambda26
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_hdmi_program_identity_csc_lambda27_lambda28
calynda_closure_hdmi_program_identity_csc_lambda27_lambda28:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    ld a0, 0(t0)
    call calynda_unit_hdmi_program_identity_csc_lambda27_lambda28
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_hdmi_program_identity_csc_lambda27
calynda_closure_hdmi_program_identity_csc_lambda27:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    ld a0, 0(t0)
    call calynda_unit_hdmi_program_identity_csc_lambda27
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_hdmi_clear_overflow_lambda29
calynda_closure_hdmi_clear_overflow_lambda29:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    ld a0, 0(t0)
    call calynda_unit_hdmi_clear_overflow_lambda29
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dw_hdmi_init_lambda30
calynda_closure_dw_hdmi_init_lambda30:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_lambda30
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dw_hdmi_init_nlr31
calynda_closure_dw_hdmi_init_nlr31:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_nlr31
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dw_hdmi_init_nlr32
calynda_closure_dw_hdmi_init_nlr32:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_nlr32
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dw_hdmi_init_lambda33
calynda_closure_dw_hdmi_init_lambda33:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_lambda33
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dw_hdmi_init_lambda34
calynda_closure_dw_hdmi_init_lambda34:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_lambda34
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.globl calynda_closure_dw_hdmi_init_nlr35
calynda_closure_dw_hdmi_init_nlr35:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    addi s0, sp, 32
    sd s11, 8(sp)
    mv s11, a0
    mv t0, a2
    call calynda_unit_dw_hdmi_init_nlr35
    ld s11, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
.section .rodata
    .balign 8
.Larr_elems_0:
    .quad 16777215
    .quad 16776960
    .quad 65535
    .quad 65280
    .quad 16711935
    .quad 16728128
    .quad 3170559
    .quad 8421504
    .balign 8
.Larr_obj_0:
    .long 1129077060
    .long 1
    .quad 0
    .quad 8
    .quad .Larr_elems_0
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
.globl calynda_global_PROBE_COLS
calynda_global_PROBE_COLS:
    .quad .Larr_obj_0
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
.globl calynda_global_hdmi_diag0
calynda_global_hdmi_diag0:
    .quad 0
.globl calynda_global_hdmi_diag1
calynda_global_hdmi_diag1:
    .quad 0
.globl calynda_global_hdmi_diag2
calynda_global_hdmi_diag2:
    .quad 0
.globl calynda_global_FB_PHYS_ADDR
calynda_global_FB_PHYS_ADDR:
    .quad 0
.globl calynda_global_FB_PHYS
calynda_global_FB_PHYS:
    .quad 0
.globl calynda_global_FB_STRIDE_BYTES
calynda_global_FB_STRIDE_BYTES:
    .quad 0
.globl calynda_global_FB_SIZE_BYTES
calynda_global_FB_SIZE_BYTES:
    .quad 0
.globl calynda_global_AP_CLKGEN_BASE
calynda_global_AP_CLKGEN_BASE:
    .quad 0
.globl calynda_global_VOSYS_CLK_GATE_BASE
calynda_global_VOSYS_CLK_GATE_BASE:
    .quad 0
.globl calynda_global_HDMI_TX_BASE
calynda_global_HDMI_TX_BASE:
    .quad 0
.globl calynda_global_I2CM_ATTEMPTS
calynda_global_I2CM_ATTEMPTS:
    .quad 0
.globl calynda_global_I2CM_RETRY_DELAY_US
calynda_global_I2CM_RETRY_DELAY_US:
    .quad 0
.section .note.GNU-stack,"",@progbits
