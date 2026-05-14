.section .text.start
.globl _start_baremetal

_start_baremetal:
    /* ----------------------------------------------------------------
     * Disable S-mode MMU so all addresses are physical from here on.
     * ---------------------------------------------------------------- */
    csrw satp, zero
    sfence.vma
    fence.i

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
1:
    bgeu a0, a1, 2f
    sd   zero, 0(a0)
    addi a0, a0, 8
    j    1b
2:

    call calynda_unit_boot

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