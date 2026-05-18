# TH1520 HDMI Bring-Up

This note captures the current known-good bare-metal path for the BeagleV-Ahead / TH1520 target. It is scoped to the repository as it exists now, not to the earlier failed `bootelf` or stale-runtime workflow.

## Known-Good Boot Flow

Build the board image:

```sh
make build MACHINE=th1520
```

That produces the flat binary U-Boot should launch:

- `build/uart_hello-th1520.bin`

Manual boot from U-Boot:

```text
loady 0x04000000
```

On the host:

```sh
make flash MACHINE=th1520
```

Back in U-Boot:

```text
go 0x04000000
```

`bootelf` is intentionally not part of the TH1520 flow. Vendor U-Boot misparsed the 64-bit ELF entry during bring-up, so the working path is a flat `.bin` loaded and jumped to at `0x04000000`.

`make flash-auto MACHINE=th1520` now follows the same `loady` plus `go` sequence automatically.

## Display Pipeline

The current HDMI path is:

- DC8200 display controller at `0xFFEF600000`
- DW-MIPI-DSI host at `0xFFEF500000`
- DW-HDMI TX at `0xFFEF540000`

The important invariants in the working implementation are:

- Framebuffer physical base is `0x04200000`
- Resolution is `1920x1080`
- Pixel format is `XRGB8888`
- HDMI scanout uses DC plane 1 on display 1
- The framebuffer path is non-coherent, so explicit T-Head dcache clean is required before scanout

## Source Map

The implementation is centered in `baremetal/hdmi_fb.c`:

- `thead_dcache_clean_range`: flushes the scanout buffer for non-coherent DMA
- `fb_layout_probe`: renders the on-screen probe layout and text
- `dpu0_pll_configure_1080p60` and `dpu1_pll_configure_1080p60`: video PLL setup
- `vosys_clk_enable`: enables the display-side clocks used by the pipeline
- `dw_hdmi_init`: programs the DW-HDMI core and PHY
- `dc8200_init`: routes the framebuffer through DC plane 1 / display 1
- `hdmi_hello_world`: top-level orchestration and diagnostics

The freestanding runtime lives in `baremetal/runtime_boot.c`.

## Reproduction Checklist

Use this when validating changes to the TH1520 path:

1. Run `make build MACHINE=th1520`.
2. Boot with `loady 0x04000000`, transfer with `make flash MACHINE=th1520`, then `go 0x04000000`.
3. Confirm UART diagnostics report a live plane 1 configuration and a locked HDMI PHY.
4. Confirm the HDMI monitor shows the expected probe layout rather than a solid-color fallback.

Useful UART indicators from a good run include:

- `p1_addr=0x04200000`
- `p1_stride=0x00001E00`
- `p1_size=0x021C0780`
- `phystat=0x0000F300`
- `i2cm=0x690B0006`

## Failure Modes That Matter

- Solid red HDMI can be a DW-HDMI core configuration issue, not only a DC routing problem.
- Moving the framebuffer away from low DRAM or skipping cache clean can produce partial or corrupted output.
- U-Boot register peeks are not a safe substitute for in-program diagnostics on every display MMIO window.
- If a future refactor changes plane or display routing, revalidate the plane 1 / display 1 assumption first.

## Next Improvement Targets

- Split `baremetal/hdmi_fb.c` into clock, HDMI, DC, and rendering units once the register sequence is considered stable.
- Replace ad hoc comments that still reflect intermediate experiments with comments that describe only the final working behavior.
- Add a narrower TH1520 validation target that checks the generated artifacts and grep-validates the boot instructions without needing hardware.