# Calynda Patch Request: Compiler Crash On Monolithic 60-Object Scene Literal

## Summary

Compiling a single Calynda function that:

- binds 60 local `ScreenObject` values
- then materializes one `arr<?> sceneObjects = [ ... ]` literal from those locals

causes the Calynda compiler to fail with an internal compiler error in reduced form, and previously caused a hard segmentation fault in the full Barnegat screen-demo build, instead of either generating code or emitting a diagnostic.

This was hit while expanding the TH1520 HDMI `screen_demo` scene in Barnegat OS to all 60 ordered RGB permutations of `0x00`, `0x40`, `0x80`, `0xC0`, and `0xFF`.

The attached standalone repro intentionally uses a numeric-only object payload to avoid a separate mixed-type array diagnostic from the text-object path; the crash is about the monolithic scene-literal shape, not string payload handling.

## Standalone Reproducer

Reproducer file: [docs/repros/calynda_scene_60_rgb_permutations_segfault.cal](/home/codewriter3000/Coding/barnegat-os/docs/repros/calynda_scene_60_rgb_permutations_segfault.cal)

Compiler command:

```bash
../calynda-lang/compiler/build/calynda asm --target riscv64 docs/repros/calynda_scene_60_rgb_permutations_segfault.cal > /tmp/calynda_scene_60_rgb_permutations_segfault.s
```

Expected result:

- successful code generation, or
- a bounded user-facing diagnostic if the source shape is unsupported

Actual result observed with the standalone repro on the local compiler build:

```text
docs/repros/calynda_scene_60_rgb_permutations_segfault.cal:28:18: HIR error: Internal error: missing type info for local 'heysyd_14'.
```

Original result observed in the full Barnegat build path before the grouped-workaround rewrite:

```text
Segmentation fault (core dumped)
make: *** [Makefile:85: build/screen_demo-th1520.generated.s] Error 139
```

## Source Shape That Triggers The Crash

The compiler failure was observed when all of the following were true in one function body:

1. A large number of local object bindings are created (`ScreenObject heysyd_00`, ..., `ScreenObject heysyd_59`).
2. Each binding comes from the same helper shape (`screen_make_text(...)`).
3. A single `arr<?>` literal is built from all of those locals in one statement.

The same data split into smaller helper functions does compile in this workspace.

## Confirmed Workaround Used In Barnegat OS

The current Barnegat workaround is:

1. Split the 60 objects into 6 helper functions of 10 objects each.
2. In each helper, bind local `ScreenObject` values, then assign them into a local `arr<?> group` and return that local.
3. Build the top-level scene as a nested array of those 6 groups.
4. Flatten nested scene groups on the TH1520 runtime side before animating/drawing.

That workaround compiles and builds successfully, but it is source-shape-driven scaffolding around a compiler crash.

## Requested Compiler Patch

1. Fix the compiler crash / internal compiler error for the monolithic local-object + `arr<?> literal` pattern in the reproducer.
2. Add the reproducer as a non-regression test in the Calynda compiler test suite.
3. If the compiler still needs to reject this shape for some reason, emit a normal user-facing diagnostic instead of crashing or reporting an internal HIR failure.

## Related Nearby Limitation

While reducing the crash, we also ran into a non-crashing adjacent issue:

```text
type error: Array literal element type cannot be inferred from external values.
```

This appeared when returning array literals directly from helper functions, even when the elements were all `ScreenObject` values. That was worked around by assigning the literal to a local `arr<?> group` first and returning the local.

That issue is separate from the segfault, but it is in the same part of the language surface: array literal typing around object values and large scene construction.

## Environment

- Host repo: `barnegat-os`
- Compiler path used here: `../calynda-lang/compiler/build/calynda`
- Target: `riscv64`
- Date observed: 2026-05-21