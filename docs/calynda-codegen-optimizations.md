# Calynda Codegen Optimizations

This note tracks the helpers that are currently kept in source for readability but are not trusted to stay in generated Calynda code for the TH1520 bare-metal path. They are either replaced in `scripts/sanitize_calynda_asm.py`, redirected to compact runtime helpers in `baremetal/runtime_boot.c`, or both.

The point of this file is twofold:

1. record the exact local workarounds used by this workspace
2. turn those workarounds into a concrete optimization list for the next Calynda release

## Build Modes

- `BUILD_MODE=release` is the default. It disables UART trace injection and bring-up probes, and is the smallest TH1520 build mode currently supported.
- `BUILD_MODE=debug` keeps the startup/runtime breadcrumbs, scratch/UART bring-up probes, and sanitizer trace markers used during board debugging.

The build system now forces a rebuild when `BUILD_MODE` changes, so `release` and `debug` no longer silently reuse stale artifacts.

## Current Size Snapshot

- Before section GC and release/debug split: `71664` byte TH1520 flat binary
- After per-symbol `.text.<symbol>` sections plus `--gc-sections`: `62032` bytes
- Current release build after additional helper moves and bring-up probe gating: `52364` bytes
- Current debug build with traces enabled: `54112` bytes

The remaining gap versus the handwritten C implementation is still mostly compiler/runtime overhead: closures, NLR scaffolding, conservative helper lowering, and generally larger generated control flow.

## Helpers Moved Out Of Calynda Codegen

### 1. `calynda_unit_forRange`

- Current replacement: sanitizer swaps the generated body with an iterative assembly loop.
- Why it moved: the direct generated form was closure-heavy and fragile; the original debug version also carried explicit runtime debug calls.
- Optimization ask: lower simple counted loops directly to iterative control flow without closure allocation, helper recursion, or NLR scaffolding.

### 2. `calynda_unit_while`

- Current replacement: sanitizer swaps the generated body with an iterative assembly loop.
- Why it moved: the generated helper path was unstable early in bring-up and significantly larger than the loop semantics required.
- Optimization ask: lower simple `while` patterns to straight-line branch loops without callable indirection when the condition/body are syntactically local closures.

### 3. `calynda_unit_fb_rect_span`

- Current replacement: sanitizer swaps the generated body with direct framebuffer span stores.
- Why it moved: the generated path caused heap churn and excessive helper overhead in hot screen drawing.
- Optimization ask: recognize contiguous MMIO/raw-buffer span writes and lower them to direct indexed stores.

### 4. `calynda_unit_fb_rect`

- Current replacement: sanitizer swaps the generated body with direct nested framebuffer stores.
- Why it moved: the generated path layered `fb_rect` over `fb_rect_span` with more closure/call overhead than the hot path could afford.
- Optimization ask: fuse simple nested loops around contiguous store patterns into direct indexed loops.

### 5. `calynda_unit_scratch_mark`

- Current replacement: sanitizer replaces the function body with a call to `__calynda_rt_scratch_mark`.
- Runtime behavior: in `BUILD_MODE=debug` it writes to scratch DRAM and fences; in `BUILD_MODE=release` it is a no-op.
- Why it moved: it is a bring-up probe, not core product logic, and release builds should be able to remove it cheaply.
- Optimization ask: support compile-time gating or dead stripping of probe-only MMIO helper wrappers.

### 6. `calynda_unit_thead_dcache_clean_range`

- Current replacement: sanitizer replaces the function body with a call to `__calynda_rt_cache_clean_range`.
- Why it moved: the original Calynda loop introduced extra lambda/NLR code around a simple architecture-specific cache maintenance sequence.
- Optimization ask: add a better lowering path or intrinsic for cache maintenance loops / architecture maintenance instructions.

### 7. `calynda_unit_fb_border`

- Current replacement: sanitizer replaces the function body with a call to `__calynda_rt_fb_border`.
- Why it moved: the generated form stacked four rectangle-helper calls and kept unnecessary helper code alive in the screen path.
- Optimization ask: inline or fuse simple multi-rect primitives, especially when each sub-call is a trivial geometric specialization.

### 8. `calynda_unit_fb_draw_row_markers`

- Current replacement: sanitizer replaces the function body with a call to `__calynda_rt_fb_draw_row_markers`.
- Why it moved: this hot probe-grid helper compiled into additional loop lambda/NLR scaffolding for a very small fixed drawing pattern.
- Optimization ask: lower small monotonic drawing loops directly when the body is a simple rect/store primitive.

### 9. `calynda_unit_fb_draw_col_markers`

- Current replacement: sanitizer replaces the function body with a call to `__calynda_rt_fb_draw_col_markers`.
- Why it moved: same issue as row markers, but on the vertical marker path.
- Optimization ask: same as row markers; avoid helper/lambda expansion for tiny drawing loops.

### 10. `calynda_unit_fb_draw_probe_label`

- Current replacement: sanitizer replaces the function body with a call to `__calynda_rt_draw_probe_label`.
- Runtime implementation: a compact 5x7 bitmap renderer in `baremetal/runtime_boot.c`.
- Why it moved: the source-level font-driven version triggered compiler instability, while the block-stroke version kept too much label scaffolding live.
- Optimization ask: improve array-indexing + nested loop lowering for small embedded bitmap fonts, or support compact static bitmap data with direct loop lowering.

### 11. `calynda_unit_screen_demo_hold`

- Current replacement: sanitizer replaces the function body with a call to `__calynda_rt_screen_demo_hold`.
- Runtime implementation: a freestanding TH1520 helper that updates the demo rectangles in place, redraws only the dirty object regions, and cache-cleans only those touched spans.
- Why it moved: the direct Calynda animation loop allocated closures and arrays every frame, which made the demo visibly choppy in debug runs and eventually exhausted the fixed boot heap.
- Optimization ask: recognize simple state-update animation loops and lower them without per-frame closure/cell churn, especially when the loop body is otherwise just scalar arithmetic plus a few drawing calls.

## Non-Function Build Optimizations Worth Proposing

### Emit per-symbol sections natively

- Current workaround: `scripts/sanitize_calynda_asm.py` injects `.section .text.<symbol>,"ax"` before each generated function.
- Why it matters: without this, dead generated helpers sit in one large `.text` section and `--gc-sections` cannot discard them.
- Optimization ask: the Calynda backend should emit per-function text sections directly, or at least provide a mode for it.

### Keep generated helper graphs smaller

- Current observation: simple source patterns still create large graphs of lambdas, closures, and NLR helpers.
- Why it matters: even when section GC is available, any referenced helper can pull in a wide cone of generated support code.
- Optimization ask: reduce closure/NLR generation for obviously local control-flow and fixed-shape helpers.

## Files To Inspect

- `scripts/sanitize_calynda_asm.py`
- `baremetal/runtime_boot.c`
- `src/machines/th1520/lib/io/screen.cal`
- `src/machines/th1520/lib/io/probe.cal`
- `src/machines/th1520/lib/io/hdmi_pure.cal`
- `Makefile`