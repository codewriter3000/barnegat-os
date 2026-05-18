#!/usr/bin/env python3

from __future__ import annotations

import argparse
import bisect
import pathlib
import re
import subprocess
import sys


STAGE_MAP = {
    "A": "assembly entry reached",
    "B": "satp/fence sequence completed",
    "C": "BSS clear completed",
    "D": "about to enter runtime boot probe",
    "E": "assembly shim entered before C boot probe",
    "F": "runtime boot probe entered / module init start",
    "G": "module init returned / run about to start",
    "H": "run returned",
    "I": "assembly shim returned from C boot probe",
    "0": "before scratch_mark(0)",
    "1": "before vosys_clk_enable()",
    "2": "before dpu0_pll_configure_1080p60()",
    "3": "before fb_layout_probe()",
    "4": "before framebuffer fence/cache clean",
    "5": "before dw_hdmi_init()",
    "6": "before dc8200_init()",
    "7": "before hold_scanout()",
    "a": "fb_layout_probe before fb_fill()",
    "b": "fb_layout_probe before fb_border()",
    "c": "fb_layout_probe before first closure allocation",
    "d": "fb_layout_probe before outer forRange()",
    "e": "dw_hdmi_init before hdmi_program_video_path()",
    "f": "dw_hdmi_init before hdmi_seed_phy_window()",
    "g": "dw_hdmi_init before hdmi_phy_i2cm_write(0x06, 0x0001)",
    "h": "dw_hdmi_init before hdmi_phy_i2cm_write(0x10, 0x2080)",
    "i": "dw_hdmi_init before hdmi_phy_i2cm_write(0x11, 0x020A)",
    "j": "dw_hdmi_init before hdmi_phy_i2cm_write(0x19, 0x0007)",
    "k": "dw_hdmi_init before hdmi_phy_i2cm_write(0x0E, 0x01A0)",
    "l": "dw_hdmi_init before hdmi_phy_i2cm_write(0x09, 0x8088)",
    "m": "dw_hdmi_init before lock_wait while()",
    "n": "dw_hdmi_init before final_wait while()",
    "o": "dw_hdmi_init before hdmi_program_video_path_final()",
    "p": "hdmi_program_video_path before hdmi_program_identity_csc()",
    "q": "hdmi_program_video_path before hdmi_clear_overflow()",
    "r": "hdmi_program_video_path_final before hdmi_program_identity_csc()",
    "s": "hdmi_program_video_path_final before hdmi_program_hdcp_video_polarity()",
    "t": "hdmi_program_video_path_final before hdmi_clear_overflow()",
    "u": "hdmi_phy_i2cm_write_once before poll while()",
    "v": "dw_hdmi_init entry",
    "w": "dw_hdmi_init before first fence()",
}


def load_symbols(elf_path: pathlib.Path) -> tuple[list[int], list[tuple[int, str]]]:
    result = subprocess.run(
        ["riscv64-linux-gnu-nm", "-n", str(elf_path)],
        check=True,
        capture_output=True,
        text=True,
    )
    symbols: list[tuple[int, str]] = []
    for line in result.stdout.splitlines():
        parts = line.split(maxsplit=2)
        if len(parts) < 3:
            continue
        address_text, _kind, name = parts
        try:
            address = int(address_text, 16)
        except ValueError:
            continue
        symbols.append((address, name))
    return [address for address, _ in symbols], symbols


def format_symbol(address: int, addresses: list[int], symbols: list[tuple[int, str]]) -> str:
    if not symbols:
        return "<no symbols>"
    index = bisect.bisect_right(addresses, address) - 1
    if index < 0:
        return "<before first symbol>"
    base, name = symbols[index]
    offset = address - base
    if offset == 0:
        return name
    return f"{name}+0x{offset:x}"


def read_trace_text(argument: str) -> str:
    try:
        path = pathlib.Path(argument)
        if path.exists():
            return path.read_text(encoding="utf-8")
    except OSError:
        return argument
    return argument


def scan_trace(text: str) -> list[str]:
    events: list[str] = []
    index = 0
    while index < len(text):
        remaining = text[index:]

        pair_match = re.match(r"P(.)([0-9A-F]{16}),([0-9A-F]{16});", remaining)
        if pair_match:
            tag, left, right = pair_match.groups()
            events.append(f"pair:{tag}:{left}:{right}")
            index += pair_match.end()
            continue

        word_match = re.match(r"D(.)([0-9A-F]{16});", remaining)
        if word_match:
            tag, value = word_match.groups()
            events.append(f"word:{tag}:{value}")
            index += word_match.end()
            continue

        object_match = re.match(r"O(.)(?:K([0-9A-F]{16}))?V([0-9A-F]{16});", remaining)
        if object_match:
            tag, kind, value = object_match.groups()
            if kind is None:
                events.append(f"object:{tag}:none:{value}")
            else:
                events.append(f"object:{tag}:{kind}:{value}")
            index += object_match.end()
            continue

        fail_match = re.match(r"!([0-9A-F]{16})", remaining)
        if fail_match:
            events.append(f"fail:{fail_match.group(1)}")
            index += fail_match.end()
            continue

        invalid_value_match = re.match(r"V([0-9A-F]{16})", remaining)
        if invalid_value_match:
            events.append(f"invalid:{invalid_value_match.group(1)}")
            index += invalid_value_match.end()
            continue

        invalid_kind_match = re.match(r"K([0-9A-F]{16})V([0-9A-F]{16})", remaining)
        if invalid_kind_match:
            kind, value = invalid_kind_match.groups()
            events.append(f"kind:{kind}:{value}")
            index += invalid_kind_match.end()
            continue

        marker = text[index]
        if marker in STAGE_MAP:
            events.append(f"stage:{marker}")
        index += 1

    return events


def main() -> int:
    parser = argparse.ArgumentParser(description="Decode TH1520 UART trace markers")
    parser.add_argument("--elf", required=True, help="ELF file used for the board run")
    parser.add_argument("trace", help="Trace text or path to a logfile")
    args = parser.parse_args()

    elf_path = pathlib.Path(args.elf)
    if not elf_path.exists():
        print(f"missing ELF: {elf_path}", file=sys.stderr)
        return 1

    addresses, symbols = load_symbols(elf_path)
    trace_text = read_trace_text(args.trace)
    events = scan_trace(trace_text)

    for event in events:
        parts = event.split(":")
        kind = parts[0]
        if kind == "stage":
            marker = parts[1]
            print(f"{marker}: {STAGE_MAP[marker]}")
        elif kind == "pair":
            tag, left_text, right_text = parts[1], parts[2], parts[3]
            left = int(left_text, 16)
            right = int(right_text, 16)
            print(f"P{tag}: {left_text} -> {format_symbol(left, addresses, symbols)}")
            print(f"    {right_text} -> {format_symbol(right, addresses, symbols)}")
        elif kind == "word":
            tag, value_text = parts[1], parts[2]
            value = int(value_text, 16)
            print(f"D{tag}: {value_text} -> {format_symbol(value, addresses, symbols)}")
        elif kind == "object":
            tag, kind_text, value_text = parts[1], parts[2], parts[3]
            value = int(value_text, 16)
            if kind_text == "none":
                print(f"O{tag}: non-object {value_text} -> {format_symbol(value, addresses, symbols)}")
            else:
                print(
                    f"O{tag}: kind {int(kind_text, 16)} value {value_text} -> "
                    f"{format_symbol(value, addresses, symbols)}"
                )
        elif kind == "invalid":
            value_text = parts[1]
            value = int(value_text, 16)
            print(f"V: invalid object {value_text} -> {format_symbol(value, addresses, symbols)}")
        elif kind == "kind":
            kind_text, value_text = parts[1], parts[2]
            value = int(value_text, 16)
            print(
                f"K: wrong object kind {int(kind_text, 16)} for {value_text} -> "
                f"{format_symbol(value, addresses, symbols)}"
            )
        elif kind == "fail":
            value_text = parts[1]
            value = int(value_text, 16)
            print(f"!: frt_fail caller {value_text} -> {format_symbol(value, addresses, symbols)}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())