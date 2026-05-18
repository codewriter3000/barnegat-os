#!/usr/bin/env python3

import re
import sys


BRANCH_MEM_RE = re.compile(
    r'^(\s*)(beq|bne)\s+(-?\d+)\((s0|sp)\),\s*zero,\s*(\S+)\s*$'
)
SYMBOL_THIRD_RE = re.compile(
    r'^(\s*)(slt|mul|div|add|sub)\s+([A-Za-z0-9_]+),\s*([A-Za-z0-9_]+),\s*(calynda_global_[A-Za-z0-9_]+)\s*$'
)
SYMBOL_SECOND_RE = re.compile(
    r'^(\s*)(slt|mul|div|add|sub)\s+([A-Za-z0-9_]+),\s*(calynda_global_[A-Za-z0-9_]+),\s*([A-Za-z0-9_]+)\s*$'
)
GLOBAL_ADDR_LOAD_RE = re.compile(
    r'^(\s*)la\s+a0,\s*(calynda_global_[A-Za-z0-9_]+)\s*$'
)

HDMI_TRACE_PLAN = [
    ("call calynda_unit_scratch_mark", "0"),
    ("call calynda_unit_vosys_clk_enable", "1"),
    ("call calynda_unit_dpu0_pll_configure_1080p60", "2"),
    ("call calynda_unit_fb_layout_probe", "3"),
    ("call __calynda_rt_fence", "4"),
    ("call calynda_unit_dw_hdmi_init", "5"),
    ("call calynda_unit_dc8200_init", "6"),
    ("call calynda_unit_hold_scanout", "7"),
]

FB_LAYOUT_TRACE_PLAN = [
    ("call calynda_unit_fb_fill", "a"),
    ("call calynda_unit_fb_border", "b"),
    ("call __calynda_rt_closure_new", "c"),
    ("call calynda_unit_forRange", "d"),
]

DW_HDMI_TRACE_PLAN = [
    ("call __calynda_rt_fence", "w"),
    ("call calynda_unit_hdmi_program_video_path", "e"),
    ("call calynda_unit_hdmi_seed_phy_window", "f"),
    ("call calynda_unit_hdmi_phy_i2cm_write", "g"),
    ("call calynda_unit_hdmi_phy_i2cm_write", "h"),
    ("call calynda_unit_hdmi_phy_i2cm_write", "i"),
    ("call calynda_unit_hdmi_phy_i2cm_write", "j"),
    ("call calynda_unit_hdmi_phy_i2cm_write", "k"),
    ("call calynda_unit_hdmi_phy_i2cm_write", "l"),
    ("call calynda_unit_while", "m"),
    ("call calynda_unit_while", "n"),
    ("call calynda_unit_hdmi_program_video_path_final", "o"),
]

HDMI_VIDEO_PATH_TRACE_PLAN = [
    ("call calynda_unit_hdmi_program_identity_csc", "p"),
    ("call calynda_unit_hdmi_clear_overflow", "q"),
]

HDMI_VIDEO_PATH_FINAL_TRACE_PLAN = [
    ("call calynda_unit_hdmi_program_identity_csc", "r"),
    ("call calynda_unit_hdmi_program_hdcp_video_polarity", "s"),
    ("call calynda_unit_hdmi_clear_overflow", "t"),
]

HDMI_PHY_WRITE_ONCE_TRACE_PLAN = [
    ("call calynda_unit_while", "u"),
]


def emit_symbol_load(indent: str, register: str, symbol: str) -> list[str]:
    return [
        f"{indent}la {register}, {symbol}",
        f"{indent}ld {register}, 0({register})",
    ]


def sanitize_line(line: str) -> list[str]:
    branch_match = BRANCH_MEM_RE.match(line)
    if branch_match:
        indent, opcode, offset, base, label = branch_match.groups()
        return [
            f"{indent}ld t6, {offset}({base})",
            f"{indent}{opcode} t6, zero, {label}",
        ]

    global_addr_match = GLOBAL_ADDR_LOAD_RE.match(line)
    if global_addr_match:
        indent, symbol = global_addr_match.groups()
        return emit_symbol_load(indent, "a0", symbol)

    third_match = SYMBOL_THIRD_RE.match(line)
    if third_match:
        indent, opcode, dst, left, symbol = third_match.groups()
        tmp = dst if dst != left else "t6"
        lines = emit_symbol_load(indent, tmp, symbol)
        lines.append(f"{indent}{opcode} {dst}, {left}, {tmp}")
        return lines

    second_match = SYMBOL_SECOND_RE.match(line)
    if second_match:
        indent, opcode, dst, symbol, right = second_match.groups()
        tmp = dst if dst != right else "t6"
        lines = emit_symbol_load(indent, tmp, symbol)
        lines.append(f"{indent}{opcode} {dst}, {tmp}, {right}")
        return lines

    return [line.rstrip("\n")]


def emit_trace_block(indent: str, marker: str) -> list[str]:
    ascii_code = ord(marker)
    label = f".Lcalynda_hdmi_trace_{ascii_code}_wait"
    return [
        f"{indent}li t5, 0xFFE7014000",
        f"{label}:",
        f"{indent}lw t6, 0x14(t5)",
        f"{indent}andi t6, t6, 0x20",
        f"{indent}beqz t6, {label}",
        f"{indent}li t6, {ascii_code}",
        f"{indent}sw t6, 0(t5)",
    ]


def instrument_hdmi_trace(lines: list[str]) -> list[str]:
    output: list[str] = []
    in_hdmi = False
    plan_index = 0

    for line in lines:
        stripped = line.strip()

        if stripped == "calynda_unit_hdmi_hello_world:":
            in_hdmi = True
            plan_index = 0
            output.append(line)
            continue

        if in_hdmi and stripped.startswith(".globl "):
            in_hdmi = False

        if in_hdmi and plan_index < len(HDMI_TRACE_PLAN):
            target_call, marker = HDMI_TRACE_PLAN[plan_index]
            if stripped == target_call:
                indent = line[: len(line) - len(line.lstrip())]
                output.extend(emit_trace_block(indent, marker))
                plan_index += 1

        output.append(line)

    return output


def instrument_symbol_trace(lines: list[str], symbol: str, plan: list[tuple[str, str]]) -> list[str]:
    output: list[str] = []
    in_symbol = False
    plan_index = 0

    for line in lines:
        stripped = line.strip()

        if stripped == f"{symbol}:":
            in_symbol = True
            plan_index = 0
            output.append(line)
            continue

        if in_symbol and stripped.startswith(".globl "):
            in_symbol = False

        if in_symbol and plan_index < len(plan):
            target_call, marker = plan[plan_index]
            if stripped == target_call:
                indent = line[: len(line) - len(line.lstrip())]
                output.extend(emit_trace_block(indent, marker))
                plan_index += 1

        output.append(line)

    return output


def instrument_symbol_entry(lines: list[str], symbol: str, marker: str) -> list[str]:
    output: list[str] = []

    for line in lines:
        output.append(line)
        if line.strip() == f"{symbol}:":
            indent = line[: len(line) - len(line.lstrip())]
            output.extend(emit_trace_block(indent, marker))

    return output


def replace_symbol_body(lines: list[str], symbol: str, new_body: list[str]) -> list[str]:
    output: list[str] = []
    index = 0

    while index < len(lines):
        line = lines[index]
        if (line.strip() == f".globl {symbol}" and index + 1 < len(lines) and
                lines[index + 1].strip() == f"{symbol}:"):
            output.append(line)
            output.append(lines[index + 1])
            index += 2
            while index < len(lines) and not lines[index].strip().startswith(".globl "):
                index += 1
            output.extend(new_body)
            continue

        output.append(line)
        index += 1

    return output


ITERATIVE_FOR_RANGE_BODY = [
    "    addi sp, sp, -56",
    "    sd ra, 48(sp)",
    "    sd s0, 40(sp)",
    "    addi s0, sp, 56",
    "    sd a0, 24(sp)",
    "    sd a1, 16(sp)",
    "    sd a2, 8(sp)",
    "    li a0, 'q'",
    "    ld a1, 8(sp)",
    "    ld a2, 24(sp)",
    "    call __calynda_rt_debug_pair",
    "    li a0, 'Q'",
    "    ld a1, 16(sp)",
    "    li a2, 0",
    "    call __calynda_rt_debug_pair",
    ".Lcalynda_iter_forRange_loop:",
    "    ld t0, 24(sp)",
    "    ld t1, 16(sp)",
    "    bge t0, t1, .Lcalynda_iter_forRange_done",
    "    sd t0, 0(sp)",
    "    ld a0, 8(sp)",
    "    li a1, 1",
    "    mv a2, sp",
    "    call __calynda_rt_call_callable",
    "    ld t0, 24(sp)",
    "    addi t0, t0, 1",
    "    sd t0, 24(sp)",
    "    j .Lcalynda_iter_forRange_loop",
    ".Lcalynda_iter_forRange_done:",
    "    li a0, 0",
    "    ld s0, 40(sp)",
    "    ld ra, 48(sp)",
    "    addi sp, sp, 56",
    "    ret",
]


ITERATIVE_WHILE_BODY = [
    "    addi sp, sp, -48",
    "    sd ra, 40(sp)",
    "    sd s0, 32(sp)",
    "    addi s0, sp, 48",
    "    sd a0, 24(sp)",
    "    sd a1, 16(sp)",
    ".Lcalynda_iter_while_loop:",
    "    ld a0, 24(sp)",
    "    li a1, 0",
    "    li a2, 0",
    "    call __calynda_rt_call_callable",
    "    beqz a0, .Lcalynda_iter_while_done",
    "    ld a0, 16(sp)",
    "    li a1, 0",
    "    li a2, 0",
    "    call __calynda_rt_call_callable",
    "    j .Lcalynda_iter_while_loop",
    ".Lcalynda_iter_while_done:",
    "    li a0, 0",
    "    ld s0, 32(sp)",
    "    ld ra, 40(sp)",
    "    addi sp, sp, 48",
    "    ret",
]


FB_RECT_SPAN_BODY = [
    "    li t4, 0x04200000",
    "    li t5, 1920",
    "    mul t0, a2, t5",
    "    add t0, t0, a0",
    "    mv t1, a0",
    ".Lcalynda_fb_rect_span_loop:",
    "    bge t1, a1, .Lcalynda_fb_rect_span_done",
    "    slli t2, t0, 2",
    "    add t3, t4, t2",
    "    sw a3, 0(t3)",
    "    addi t1, t1, 1",
    "    addi t0, t0, 1",
    "    j .Lcalynda_fb_rect_span_loop",
    ".Lcalynda_fb_rect_span_done:",
    "    li a0, 0",
    "    ret",
]


FB_RECT_BODY = [
    "    mv t0, a1",
    "    li t6, 0x04200000",
    ".Lcalynda_fb_rect_y_loop:",
    "    blt a3, t0, .Lcalynda_fb_rect_done",
    "    li t1, 1920",
    "    mul t2, t0, t1",
    "    add t2, t2, a0",
    "    mv t3, a0",
    ".Lcalynda_fb_rect_x_loop:",
    "    blt a2, t3, .Lcalynda_fb_rect_next_row",
    "    slli t4, t2, 2",
    "    add t5, t6, t4",
    "    sw a4, 0(t5)",
    "    addi t3, t3, 1",
    "    addi t2, t2, 1",
    "    j .Lcalynda_fb_rect_x_loop",
    ".Lcalynda_fb_rect_next_row:",
    "    addi t0, t0, 1",
    "    j .Lcalynda_fb_rect_y_loop",
    ".Lcalynda_fb_rect_done:",
    "    li a0, 0",
    "    ret",
]


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: sanitize_calynda_asm.py <input.s> <output.s>", file=sys.stderr)
        return 64

    input_path, output_path = sys.argv[1], sys.argv[2]

    with open(input_path, "r", encoding="utf-8") as input_file:
        lines = input_file.readlines()

    output_lines: list[str] = []
    for line in lines:
        output_lines.extend(sanitize_line(line))

    output_lines = instrument_hdmi_trace(output_lines)
    output_lines = instrument_symbol_trace(output_lines,
                                           "calynda_unit_fb_layout_probe",
                                           FB_LAYOUT_TRACE_PLAN)
    output_lines = instrument_symbol_entry(output_lines,
                                           "calynda_unit_dw_hdmi_init",
                                           "v")
    output_lines = instrument_symbol_trace(output_lines,
                                           "calynda_unit_dw_hdmi_init",
                                           DW_HDMI_TRACE_PLAN)
    output_lines = instrument_symbol_trace(output_lines,
                                           "calynda_unit_hdmi_program_video_path",
                                           HDMI_VIDEO_PATH_TRACE_PLAN)
    output_lines = instrument_symbol_trace(output_lines,
                                           "calynda_unit_hdmi_program_video_path_final",
                                           HDMI_VIDEO_PATH_FINAL_TRACE_PLAN)
    output_lines = instrument_symbol_trace(output_lines,
                                           "calynda_unit_hdmi_phy_i2cm_write_once",
                                           HDMI_PHY_WRITE_ONCE_TRACE_PLAN)
    output_lines = replace_symbol_body(output_lines,
                                       "calynda_unit_forRange",
                                       ITERATIVE_FOR_RANGE_BODY)
    output_lines = replace_symbol_body(output_lines,
                                       "calynda_unit_while",
                                       ITERATIVE_WHILE_BODY)
    output_lines = replace_symbol_body(output_lines,
                                       "calynda_unit_fb_rect_span",
                                       FB_RECT_SPAN_BODY)
    output_lines = replace_symbol_body(output_lines,
                                       "calynda_unit_fb_rect",
                                       FB_RECT_BODY)

    with open(output_path, "w", encoding="utf-8") as output_file:
        for line in output_lines:
            output_file.write(f"{line}\n")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())