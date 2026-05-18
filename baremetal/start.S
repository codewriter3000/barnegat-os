.section .text.start
.globl _start_baremetal

_start_baremetal:
    li   t0, 0xFFE7014000
1:
    lw   t1, 0x14(t0)
    andi t1, t1, 0x20
    beqz t1, 1b
    li   t1, 'A'
    sw   t1, 0(t0)

    /* ----------------------------------------------------------------
     * Disable S-mode MMU so all addresses are physical from here on.
     * ---------------------------------------------------------------- */
    csrw satp, zero
    sfence.vma
    fence.i

    li   t0, 0xFFE7014000
2:
    lw   t1, 0x14(t0)
    andi t1, t1, 0x20
    beqz t1, 2b
    li   t1, 'B'
    sw   t1, 0(t0)

    li   t1, 0x05000060
    li   t2, 0xA1000001
    sw   t2, 0(t1)
    fence

    /* ----------------------------------------------------------------
     * Prologue — save ALL state U-Boot needs restored.
     *
     * Critical: we must save U-Boot's sp BEFORE switching stacks.
     *   Use t0 as a scratch register to ferry the old sp value.
     *
     * Saved on our own stack (so U-Boot's stack is untouched):
     *   offset 56: U-Boot sp    ← must be restored LAST
     *   offset 48: ra
     *   offset 40: s0
     *   offset 32: s10
     *   offset 24: s11
     *   offset 16: stvec
     *   offset  8: satp
     *   offset  0: (alignment pad)
     * ---------------------------------------------------------------- */
    mv   t0, sp                  /* stash U-Boot's sp in t0 */

    la   sp, __stack_top
    addi sp, sp, -64

    sd   t0,  56(sp)             /* U-Boot's original sp */
    sd   ra,  48(sp)
    sd   s0,  40(sp)
    sd   s10, 32(sp)
    sd   s11, 24(sp)
    csrr t0,  stvec
    sd   t0,  16(sp)
    csrr t0,  satp
    sd   t0,   8(sp)

    /* Install our trap handler. */
    la   t0, _trap_handler
    csrw stvec, t0

    /* Zero BSS. */
    la   a0, __bss_start
    la   a1, __bss_end
3:
    bgeu a0, a1, 2f
    sd   zero, 0(a0)
    addi a0, a0, 8
    j    3b
2:

    li   t0, 0xFFE7014000
4:
    lw   t1, 0x14(t0)
    andi t1, t1, 0x20
    beqz t1, 4b
    li   t1, 'C'
    sw   t1, 0(t0)

    li   t1, 0x05000064
    li   t2, 0xA1000002
    sw   t2, 0(t1)
    fence

    li   t0, 0xFFE7014000
5:
    lw   t1, 0x14(t0)
    andi t1, t1, 0x20
    beqz t1, 5b
    li   t1, 'D'
    sw   t1, 0(t0)

    call __calynda_rt_boot_probe

    /* ----------------------------------------------------------------
     * Epilogue — restore in reverse order; sp MUST be last.
     * ---------------------------------------------------------------- */
    ld   t0,   8(sp)
    csrw satp, t0
    sfence.vma
    ld   t0,  16(sp)
    csrw stvec, t0
    ld   s11, 24(sp)
    ld   s10, 32(sp)
    ld   s0,  40(sp)
    ld   ra,  48(sp)
    ld   sp,  56(sp)             /* restore U-Boot's stack pointer last */
    ret

.globl __calynda_rt_boot_probe
__calynda_rt_boot_probe:
    li   t0, 0xFFE7014000
6:
    lw   t1, 0x14(t0)
    andi t1, t1, 0x20
    beqz t1, 6b
    li   t1, 'E'
    sw   t1, 0(t0)

    call __calynda_rt_boot_probe_c

    li   t0, 0xFFE7014000
7:
    lw   t1, 0x14(t0)
    andi t1, t1, 0x20
    beqz t1, 7b
    li   t1, 'I'
    sw   t1, 0(t0)
    ret

/* ----------------------------------------------------------------
 * Minimal S-mode trap handler.
 * Writes a sentinel + sepc to scratch DRAM at 0x05000010 then spins.
 * Read back with U-Boot: md.l 0x05000010 4
 *   [0] 0xDEAD0001 = trap was taken
 *   [1] sepc low 32 bits
 *   [2] sepc high 32 bits
 * ---------------------------------------------------------------- */
.align 4
_trap_handler:
    /* Write trap sentinel + sepc to scratch DRAM — safe, no MMIO. */
    li   t0, 0x05000010
    li   t1, 0xDEAD0001
    sw   t1, 0(t0)
    csrr t1, sepc
    sw   t1, 4(t0)         /* sepc low 32 bits  */
    srli t1, t1, 32
    sw   t1, 8(t0)         /* sepc high 32 bits */
    fence
.Ltrap_spin:
    wfi
    j    .Ltrap_spin