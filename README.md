# Barnegat OS

This workspace is set up for bare-metal Calynda development on RISC-V, targeting either the QEMU `virt` machine (for local testing) or the BeagleV-Ahead (T-Head TH1520, quad-core RV64GC).

The flow is:

1. Merge local imported `.cal` files into one generated source file.
2. Compile that generated `.cal` to RISC-V assembly with the sibling Calynda compiler.
3. Assemble and link a freestanding ELF with a custom startup file and linker script.
4. Boot the image — either via `qemu-system-riscv64` or as a flat binary via U-Boot on the board.

The target machine is selected with `MACHINE=virt` (default) or `MACHINE=th1520`. Machine-specific source files live under `src/machines/<machine>/` and are overlaid on top of the common `src/` tree at build time.

## Prerequisites

Required host tools:

- `make`
- `gcc`
- `qemu-system-riscv64`
- `riscv64-linux-gnu-gcc`
- `riscv64-linux-gnu-objdump`
- the sibling Calynda compiler at `../calynda-lang/compiler/build/calynda`

On Debian or Ubuntu, install the missing cross tools with:

```sh
sudo apt-get update
sudo apt-get install gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu qemu-system-misc
```

This machine already has QEMU, `gcc`, and `make`, but it is missing the RISC-V cross compiler.

## Quick Start

Check tool availability:

```sh
make doctor
```

Generate RISC-V assembly from the sample Calynda program:

```sh
make asm
```

This also writes the merged source file used by the bare-metal assembly flow:

- `build/uart_hello.merged.cal`
- `build/uart_hello.generated.s`

Build a bootable ELF for QEMU:

```sh
make build
```

Build for the BeagleV-Ahead:

```sh
make build MACHINE=th1520
```

That produces `build/uart_hello-th1520.bin` for the current U-Boot flow on the board.

Build modes:

- `BUILD_MODE=release` is the default. It disables UART trace injection and other bring-up probes while keeping the runtime helper replacements and code-size optimizations enabled.
- `BUILD_MODE=debug` re-enables the current TH1520 bring-up breadcrumbs, scratch/UART probe path, and sanitizer trace injection.

Examples:

```sh
make build MACHINE=th1520 BUILD_MODE=release
make build MACHINE=th1520 BUILD_MODE=debug
```

Run it in QEMU:

```sh
make run
```

Run it with explicit terminal UART output:

```sh
make run-serial
```

Run it in a QEMU window with the UART rendered inside the window:

```sh
make run-gui
```

`make run` defaults to the QEMU loader-device boot path in terminal-serial mode. The sample prints `Hello World` to the `virt` UART at `0x10000000` and then spins.

- `make run` / `make run-serial`: UART text appears in the terminal. Exit QEMU with `Ctrl+A`, then `X`.
- `make run-gui`: QEMU opens a GTK window and renders the guest UART in a virtual text console inside that window.
- `make run-kernel`: boots with QEMU's `-kernel` path for comparison; on this workspace it does not currently reach the program entry.
- `make compare-boot`: captures UART output from both boot paths and shows the difference.

## Running on the BeagleV-Ahead

Since you're already connected via USB-C serial, the easiest method is Y-Modem transfer directly over that connection. The board appears as `/dev/ttyUSB0` (or `/dev/ttyACM0`) on the host.

You'll need `lrzsz` for the `sb` command:

```sh
sudo apt-get install lrzsz
```

**Steps:**

1. Open a serial terminal to the board at 115200 baud (e.g. `picocom -b 115200 /dev/ttyUSB0`).
2. Power on and press any key to interrupt U-Boot autoboot.
3. In U-Boot, type:
   ```
   loady 0x04000000
   ```
4. In a second terminal on the host, run:
   ```sh
   make flash MACHINE=th1520 PROGRAM=<program>
   ```
   This sends `build/<program>-th1520.bin` via Y-Modem to `/dev/ttyUSB0`. Override the device with `SERIAL=/dev/ttyACM0` if needed.
5. Once the transfer completes, back in U-Boot:
   ```
   go 0x04000000
   ```

Output appears in the same serial terminal immediately after `go 0x04000000`.

On this workspace host, do not use `sudo` for the flash step. The current user already has access to `/dev/ttyUSB0`.

Examples:

```sh
make flash MACHINE=th1520 PROGRAM=uart_hello
make flash MACHINE=th1520 PROGRAM=screen_demo
```

For TH1520 debug-heavy runs, the bare-metal runtime also emits compact UART trace tokens and mirrors a limited event ring into scratch DRAM at `0x05001000`. The helper script below decodes those tokens and maps any embedded addresses back to the nearest ELF symbols:

```sh
python3 scripts/decode_th1520_trace.py --elf build/uart_hello-th1520.elf 'ABCDEFG012V000000000400E770!0000000004000730'
```

This trace path is only present in `BUILD_MODE=debug`. Release builds intentionally omit these UART trace markers and other bring-up probes by default.

Current token classes are:

- single-character stage markers like `A`-`I`, `0`-`7`, and `a`-`d`
- `P<tag><left>,<right>;` for runtime debug pairs
- `D<tag><value>;` for runtime debug words
- `O<tag>K<kind>V<value>;` or `O<tag>V<value>;` for runtime object inspection
- `V<value>` / `K<kind>V<value>` / `!<caller>` for runtime failure diagnostics

For the current HDMI bring-up architecture, reproduction steps, and known hardware-specific constraints, see `docs/th1520-hdmi-bringup.md`.

For a per-function reference covering every TH1520 I/O routine under `src/machines/th1520/lib/io`, see `docs/th1520-io-reference.md`.

For the current list of helpers that are moved out of Calynda codegen and the corresponding compiler optimization proposals, see `docs/calynda-codegen-optimizations.md`.

`make boot-th1520 MACHINE=th1520` prints instructions for the SD card and TFTP alternatives if you prefer those.

## Layout

- `src/uart_hello.cal`: bare-metal Calynda sample — prints `Hello World` via recursive `uart_print_at`
- `src/screen_demo.cal`: opt-in TH1520 framebuffer demo — boots the HDMI path and animates a pair of rectangle objects on screen
- `src/lib/io/stdlib.cal`: shared helper module (currently a stub; machine-specific drivers live under `src/machines/`)
- `src/machines/virt/lib/io/uart.cal`: UART driver for the QEMU `virt` machine (16550 at `0x10000000`)
- `src/machines/th1520/lib/io/uart.cal`: UART driver for the BeagleV-Ahead (DW APB at `0xFFE7014000`)
- `baremetal/start.S`: freestanding entry point and stack setup
- `baremetal/runtime_boot.c`: freestanding Calynda runtime support used by the bare-metal boot path
- `baremetal/riscv64-virt.ld`: linker script for the QEMU `virt` machine (load address `0x80000000`)
- `baremetal/riscv64-th1520.ld`: linker script for the BeagleV-Ahead (load address `0x04000000`, above OpenSBI/U-Boot)
- `scripts/merge_calynda_sources.sh`: resolves imports — machine-specific overlay takes precedence over common `src/`
- `build/`: generated assembly, objects, ELF, map, and disassembly output

## Notes

The current Calynda RISC-V backend already emits a `boot()` symbol and a Linux-oriented `_start` stub. This workspace ignores that stub by selecting `start.S` as the ELF entry point and calling `calynda_unit_boot` directly.

The current GUI mode is not a guest framebuffer yet. It uses QEMU's built-in virtual console to display the UART stream inside the QEMU window, which is the simplest way to make the window show something useful before the OS has real graphics support.

On this machine, the QEMU `virt` machine only produced visible UART output when the ELF was loaded with `-device loader,file=...,cpu-num=0`. The `-kernel` path started QEMU but produced zero captured UART bytes for this image.

The generated bare-metal object code can still reference Calynda helper symbols such as `__calynda_store_sized`. For freestanding builds, this workspace links `baremetal/runtime_boot.c` instead of the hosted runtime archive so simple MMIO and raw pointer operations work without libc.

This workspace now supports a practical split-file bare-metal layout by resolving local import lines like `import lib.io.stdlib;` to `src/lib/io/stdlib.cal` before calling `calynda asm`. The imported file bodies are inlined into one generated `.cal` file for the compiler.

That means split files work here as a workspace build feature, not as native bare-metal package linking. To keep the result freestanding, imported helpers should use direct top-level function calls like `print()`, not hosted package-member calls like `stdlib.print()`.

Heap-backed helpers such as `malloc`, `free`, and `stackalloc` are not part of that minimal shim yet.

If you install Calynda globally, you can override the compiler path:

```sh
make CALYNDA=/path/to/calynda build
```

If you want a different program, place another `.cal` file in `src/` and select it with:

```sh
make PROGRAM=my_program build
make PROGRAM=my_program run
```

The TH1520 moving-object demo added by the screen/probe split can be built explicitly with:

```sh
make PROGRAM=screen_demo build MACHINE=th1520
```