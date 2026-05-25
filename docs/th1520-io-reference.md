# TH1520 I/O Function Reference

This document covers every function defined under `src/machines/th1520/lib/io`.

Some of these functions keep a compiler-stable Calynda source shape but have their final linked body replaced by a sanitizer/runtime helper in the current TH1520 bare-metal build. Those functions are marked as runtime-replaced so the source-level description does not get confused with the final machine code path.

## Files Without Functions

### `font.cal`

This module currently defines only the older 8x8 `PROBE_FONT` bitmap constants. It exports no callable functions.

### `hdmi.cal`

This module is an import shim that pulls in `hdmi_pure.cal`. It exports no callable functions of its own.

## `clock.cal`

- `delay_us(us) -> int32`: Busy-wait delay loop used between PLL, reset, and HDMI programming steps. It returns `0` because the low-level inline assembly form is modeled as an integer-returning routine.
- `dpu0_pll_configure_1080p60()`: Programs the DPU0 PLL and its divider path for the 1080p60 display clock.
- `dpu1_pll_configure_1080p60()`: Programs the DPU1 PLL and its divider path for the same 1080p60 timing.
- `vosys_clk_enable()`: Enables the VO-side gates and clocks needed by the TH1520 display pipeline before the HDMI and DC blocks are touched.

## `dc8200.cal`

- `dc8200_init()`: Programs the Verisilicon DC8200 registers for a 1920x1080 XRGB8888 scanout from framebuffer `0x04200000`, then enables panel output on the path used by the HDMI bring-up flow.

## `hdmi_pure.cal`

- `scratch_mark(index, value)`: Writes a bring-up breadcrumb to the scratch MMIO window at `0x05000000`. Runtime-replaced in current TH1520 builds: release mode makes it effectively a no-op, while debug mode routes it through the freestanding runtime helper.
- `hold_scanout() -> int32`: Infinite loop that keeps the program alive after display bring-up so firmware does not regain control and tear down the image.
- `screen_demo_step_axis(object, max_pos, horizontal) -> ScreenObject`: Flips one velocity axis when the next step would leave the visible framebuffer range.
- `screen_demo_step_bounds(object) -> ScreenObject`: Applies the demo's bounce rules on both axes and returns the next screen-object state.
- `screen_demo_frame(object_a, object_b)`: Seeds the framebuffer with the demo background and both rectangles before HDMI scanout starts.
- `screen_demo_hold(object_a, object_b) -> int32`: Source-level recursive animation loop for the opt-in screen demo. Runtime-replaced in current TH1520 builds with a freestanding helper that steps, redraws, and cache-cleans only the moving object regions without per-frame Calynda allocations.
- `hdmi_screen_demo() -> int32`: Alternate TH1520 bring-up entrypoint for `PROGRAM=screen_demo`. It initializes clocks and HDMI/DC like the probe path, then keeps scanout alive with the moving-object demo instead of the static probe grid.
- `hdmi_hello_world() -> int32`: Top-level TH1520 boot path. It enables clocks, configures both display PLLs, renders the framebuffer probe layout, flushes the cache for non-coherent scanout, initializes DW-HDMI and DC8200, then parks in `hold_scanout()`.

## `hdmi_tx.cal`

- `hdmi_phy_i2cm_write_once(reg, value) -> int32`: Performs one indirect DW-HDMI PHY I2C write, then polls the controller status. Returns `1` on acknowledged success, `-1` on explicit controller error, and `0` if the poll window expires without a final status.
- `hdmi_phy_i2cm_write_attempt(remaining, reg, value) -> int32`: Recursive retry wrapper around `hdmi_phy_i2cm_write_once()` that waits briefly between attempts and stops once a write succeeds or the retry budget is exhausted.
- `hdmi_phy_i2cm_write(reg, value) -> int32`: Public fixed-budget PHY I2C write entry point. It uses the module's standard retry count instead of requiring each caller to choose one.
- `hdmi_program_identity_csc()`: Loads the identity color-space-conversion matrix into the DW-HDMI CSC block and selects the passthrough RGB path.
- `hdmi_clear_overflow()`: Applies the DW-HDMI overflow-clear sequence by toggling the overflow register and rewriting `FC_INVIDCONF` a few times.
- `hdmi_program_hdcp_video_polarity()`: Programs the HDCP/video-polarity side registers needed by the final stable video path.
- `hdmi_program_video_path(h)`: Programs the initial video sampler, packetizer, CSC, timing, and overflow state before the PHY is fully trained.
- `hdmi_seed_phy_window(h)`: Primes the PHY control window and related sideband registers before the explicit PHY I2C writes.
- `hdmi_program_video_path_final(h)`: Reapplies the video path after PHY bring-up, including the final polarity programming, so the core is left in its steady-state configuration.
- `dw_hdmi_init()`: Full DW-HDMI bring-up sequence. It unmasks interrupts, programs the video path, resets and seeds the PHY, pushes the PHY register script, waits for lock, retries the hard reset path if needed, captures diagnostics, and leaves the HDMI core in the final output state.

## `screen.cal`

- `RGB(r, g, b) -> uint32`: Packs 8-bit red, green, and blue channels into the framebuffer's `0x00RRGGBB` pixel format.
- `fb_in_bounds(x, y) -> bool`: Returns whether a pixel coordinate lies inside the configured 1920x1080 framebuffer. This is a convenience helper rather than part of the hot drawing path.
- `fb_write_pixel(x, y, color)`: Writes one pixel directly into the linear framebuffer at `0x04200000`.
- `fb_rect_span(x0, x_end, y, color)`: Draws a horizontal run of pixels on one scanline from `x0` up to but not including `x_end`. Runtime-replaced in current TH1520 builds with a tighter helper than the source-level pixel loop.
- `fb_rect(x0, y0, x1, y1, color)`: Fills an inclusive rectangle by iterating rows and calling `fb_rect_span()`. Runtime-replaced in current TH1520 builds.
- `fb_fill(color)`: Fills the entire framebuffer with a single color by delegating to `fb_rect()`.
- `thead_dcache_clean_range(start_addr, size)`: Flushes the non-coherent T-Head dcache over the scanout range so DC/HDMI can see the rendered framebuffer contents. Runtime-replaced in current TH1520 builds.
- `fb_border(x0, y0, x1, y1, color, thick)`: Draws a thick rectangular outline using four filled rectangles. Runtime-replaced in current TH1520 builds.
- `screen_make_rect(x, y, width, height, vx, vy, color) -> ScreenObject`: Builds the first screen object shape, a filled rectangle with stored position, size, velocity, and color.
- `screen_object_kind(object) -> int32`: Returns the stored object kind tag. The current screen API uses a rectangle tag only, but keeps the field for forward compatibility.
- `screen_object_x(object) -> int32`: Returns the rectangle's left edge.
- `screen_object_y(object) -> int32`: Returns the rectangle's top edge.
- `screen_object_width(object) -> int32`: Returns the rectangle width in pixels.
- `screen_object_height(object) -> int32`: Returns the rectangle height in pixels.
- `screen_object_vx(object) -> int32`: Returns the horizontal velocity component.
- `screen_object_vy(object) -> int32`: Returns the vertical velocity component.
- `screen_object_color(object) -> uint32`: Returns the rectangle fill color.
- `screen_object_with_state(object, x, y, vx, vy) -> ScreenObject`: Rebuilds an object with updated position and velocity while preserving size, kind, and color.
- `screen_object_set_velocity(object, vx, vy) -> ScreenObject`: Returns a copy of the object with a new velocity.
- `screen_move_object(object, dx, dy) -> ScreenObject`: Returns a copy of the object translated by `dx` and `dy`.
- `screen_step_object(object) -> ScreenObject`: Returns a copy of the object advanced by its current velocity.
- `screen_draw_object(object)`: Draws the current rectangle object into the framebuffer using `fb_rect()`.
- `screen_clear_object(object, color)`: Clears the current rectangle object's previous area by overdrawing it with the supplied color.

## `probe.cal`

- `fb_draw_char_top(px, py, color)`: Draws the top horizontal stroke of the source-level probe label font.
- `fb_draw_char_middle(px, py, color)`: Draws the middle horizontal stroke of the source-level probe label font.
- `fb_draw_char_bottom(px, py, color)`: Draws the bottom horizontal stroke of the source-level probe label font.
- `fb_draw_char_left(px, py, color)`: Draws the full-height left vertical stroke of the source-level probe label font.
- `fb_draw_char_left_lower(px, py, color)`: Draws only the lower half of the left vertical stroke for digit composition.
- `fb_draw_char_right(px, py, color)`: Draws the full-height right vertical stroke of the source-level probe label font.
- `fb_draw_char_right_upper(px, py, color)`: Draws only the upper half of the right vertical stroke for digit composition.
- `fb_draw_char_right_lower(px, py, color)`: Draws only the lower half of the right vertical stroke for letter and digit composition.
- `fb_draw_char_center(px, py, color)`: Draws the center vertical stroke used by the source-level digit renderer.
- `fb_draw_probe_letter(px, py, col, color)`: Composes the column letter portion of a probe label from the stroke helpers. Column indices `0` through `7` map to the on-screen `A` through `H` labels.
- `fb_draw_probe_digit(px, py, row, color)`: Composes the row digit portion of a probe label from the stroke helpers. Row indices `0` through `3` map to the on-screen numeric suffix.
- `fb_draw_probe_label(px, py, col, row, color)`: Draws the full cell label such as `A0` or `C2`. Runtime-replaced in current TH1520 builds with the compact runtime glyph renderer.
- `fb_draw_row_markers(x0, x1, y0, row)`: Draws the stacked horizontal row markers inside one probe cell. Runtime-replaced in current TH1520 builds.
- `fb_draw_col_markers(x0, y0, y1, col)`: Draws the vertical column markers inside one probe cell. Runtime-replaced in current TH1520 builds.
- `fb_draw_probe_cell(row, col, cols, rows, cell_w, cell_h)`: Paints one probe cell: background fill, border, row/column markers, label backdrop, and the cell label itself.
- `fb_layout_probe_row(row, cols, rows, cell_w, cell_h)`: Renders every column in a single probe-grid row.
- `fb_layout_probe()`: Builds the full 8x4 on-screen probe layout by filling the background, drawing the outer border, and then rendering each row of cells.

## `uart.cal`

- `uart_putc(ch) -> int32`: Low-level TH1520 UART0 transmit primitive implemented in inline assembly. It polls the transmitter-holding-register-empty bit, writes one character, and returns `0`.
- `uart_puts_bare_walk(s, index) -> int32`: Recursive string walker for bare UART output. It stops at the end of the string and otherwise delegates one character at a time to the emit helpers.
- `uart_puts_bare_emit(s, index) -> int32`: Dispatches one string character either to the plain-character path or to the newline-normalization path.
- `uart_puts_bare_emit_plain(s, index, ch) -> int32`: Emits one character as-is and advances the recursive string walk.
- `uart_puts_bare_emit_newline(s, index, ch) -> int32`: Emits CRLF for newline handling, then advances the recursive string walk.
- `uart_puts_bare(s)`: Public raw string printer for early bring-up output. It normalizes `\n` into the carriage-return/newline sequence expected by many serial terminals.
- `uart_puthex_walk(value, nibble) -> int32`: Recursive nibble walker for 32-bit hexadecimal output.
- `uart_puthex_emit(value, nibble) -> int32`: Emits one hexadecimal digit of a 32-bit value, then recurses to the next nibble.
- `uart_puthex(value)`: Prints a `0x` prefix followed by eight hexadecimal digits.
- `uart_puthex64_walk(value, nibble) -> int32`: Recursive nibble walker for 64-bit hexadecimal output.
- `uart_puthex64_emit(value, nibble) -> int32`: Emits one hexadecimal digit of a 64-bit value, then recurses to the next nibble.
- `uart_puthex64(value)`: Prints a `0x` prefix followed by sixteen hexadecimal digits.
- `uart_dump_row_cells(row_addr, word_index, column, words) -> int32`: Emits up to four 32-bit values for one formatted dump row and stops when either the row or the requested word count is exhausted.
- `uart_dump_row_emit(row_addr, word_index, column, words) -> int32`: Prints one 32-bit MMIO cell in hexadecimal, then recurses to the next column of the same formatted row.
- `uart_dump_rows(base, words, row) -> int32`: Recursive row driver for `uart_dump_mmio32()`. It stops once all requested words have been covered.
- `uart_dump_row(base, words, row) -> int32`: Prints one dump row in `address: word0 word1 ...` form and then advances to the next row.
- `uart_dump_mmio32(base, words)`: Public helper that dumps a 32-bit MMIO window over UART in four-word rows for quick hardware inspection.