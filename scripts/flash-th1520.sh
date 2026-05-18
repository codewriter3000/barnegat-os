#!/usr/bin/env bash
# scripts/flash-th1520.sh
#
# Automated flash workflow for BeagleV-Ahead (TH1520).
# Usage: [SERIAL=/dev/ttyUSB0] [LOGFILE=/tmp/th1520-serial.log] bash scripts/flash-th1520.sh
#
# Steps performed automatically:
#   1. Power-cycle board after starting; script interrupts autoboot and waits for the U-Boot prompt
#   2. Sends "loady 0x04000000"
#   3. Opens a new terminal window running "make flash MACHINE=th1520"
#   4. Waits for the Y-Modem transfer to complete
#   5. Sends "go 0x04000000" and drops into interactive picocom
#
# Dependencies: expect  picocom  lrzsz (sb)
#   sudo apt-get install expect picocom lrzsz

set -euo pipefail

SERIAL="${SERIAL:-/dev/ttyUSB0}"
LOGFILE="${LOGFILE:-}"
LOAD_ADDR="0x04000000"
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# ── dependency check ─────────────────────────────────────────────────
missing=()
for cmd in expect picocom sb; do
    command -v "$cmd" >/dev/null 2>&1 || missing+=("$cmd")
done
if (( ${#missing[@]} > 0 )); then
    printf 'Missing required tools: %s\n' "${missing[*]}"
    echo "  sudo apt-get install expect picocom lrzsz"
    exit 1
fi

# ── write a temp script for the flash window ─────────────────────────
FLASH_SCRIPT=$(mktemp /tmp/barnegat-flash-XXXXXX.sh)
trap 'rm -f "$FLASH_SCRIPT"' EXIT

cat > "$FLASH_SCRIPT" <<FLASHEOF
#!/usr/bin/env bash
cd "$PROJECT_DIR"
make flash MACHINE=th1520
echo
read -rp 'Press Enter to close' _
FLASHEOF
chmod +x "$FLASH_SCRIPT"

# ── find a terminal emulator ─────────────────────────────────────────
TERM_BIN=""
for t in gnome-terminal xterm konsole xfce4-terminal lxterminal; do
    if command -v "$t" >/dev/null 2>&1; then
        TERM_BIN="$t"
        break
    fi
done

case "$TERM_BIN" in
    gnome-terminal) OPEN_TERM="gnome-terminal --title barnegat-flash -- bash $FLASH_SCRIPT" ;;
    xterm)          OPEN_TERM="xterm -title barnegat-flash -e bash $FLASH_SCRIPT" ;;
    konsole)        OPEN_TERM="konsole --title barnegat-flash -e bash $FLASH_SCRIPT" ;;
    xfce4-terminal) OPEN_TERM="xfce4-terminal -T barnegat-flash -e bash $FLASH_SCRIPT" ;;
    lxterminal)     OPEN_TERM="lxterminal -t barnegat-flash -e bash $FLASH_SCRIPT" ;;
    *)
        echo "No terminal emulator found (tried gnome-terminal xterm konsole)."
        echo "When prompted, run this manually in a new terminal:"
        echo "  make flash MACHINE=th1520"
        OPEN_TERM="echo 'Run in another terminal: make flash MACHINE=th1520'"
        ;;
esac

# ── configure serial port ─────────────────────────────────────────────
echo "Configuring $SERIAL at 115200 8N1, no flow control ..."
stty -F "$SERIAL" 115200 raw cs8 -parenb -cstopb -echo -crtscts

if [[ -n "$LOGFILE" ]]; then
    mkdir -p "$(dirname "$LOGFILE")"
    echo "Serial log will be written to $LOGFILE"
fi

echo "Power cycle the board now. Waiting for autoboot or the U-Boot prompt (up to 60 s) ..."
echo

# ── expect session ────────────────────────────────────────────────────
expect - <<EXPECT_SCRIPT
log_user 1
set timeout 60
set autoboot_interrupted 0

if { "$LOGFILE" ne "" } {
    spawn picocom -b 115200 --flow n --logfile "$LOGFILE" "$SERIAL"
} else {
    spawn picocom -b 115200 --flow n "$SERIAL"
}

# Wait for U-Boot prompt, interrupting autoboot if needed.
expect {
    -re {Hit any key to stop autoboot:} {
        if { !\$autoboot_interrupted } {
            puts "\n\[barnegat\] Autoboot detected — sending space to stop it ..."
            send " "
            set autoboot_interrupted 1
        }
        exp_continue
    }
    -re {(C910 Light#|=>)\s} {
        puts "\n\[barnegat\] U-Boot prompt detected — sending loady ..."
    }
    timeout {
        puts "\n\[barnegat\] Timed out waiting for U-Boot prompt."
        exit 1
    }
}

send "loady $LOAD_ADDR\r"

# Wait for U-Boot to enter Y-Modem receive mode
expect {
    "Ready for binary" {
        puts "\n\[barnegat\] Opening make flash in new window ..."
        exec $OPEN_TERM &
    }
    timeout {
        puts "\n\[barnegat\] loady not acknowledged by U-Boot."
        exit 1
    }
}

# Wait for Y-Modem transfer to finish
set timeout 120
expect {
    "Total Size" {
        puts "\n\[barnegat\] Transfer complete — jumping to flat binary ..."
    }
    timeout {
        puts "\n\[barnegat\] Y-Modem transfer timed out."
        exit 1
    }
}

send "go $LOAD_ADDR\r"

interact
EXPECT_SCRIPT
