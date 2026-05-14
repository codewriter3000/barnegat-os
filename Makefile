CALYNDA ?= ../calynda-lang/compiler/build/calynda
RISCV_PREFIX ?= riscv64-linux-gnu
CC := $(RISCV_PREFIX)-gcc
OBJDUMP := $(RISCV_PREFIX)-objdump
OBJCOPY := $(RISCV_PREFIX)-objcopy
QEMU := qemu-system-riscv64

# MACHINE selects the linker script and run target.
# Use MACHINE=virt (default) for QEMU, or MACHINE=th1520 for BeagleV-Ahead.
MACHINE ?= virt

# Serial device for 'make flash' (Y-Modem transfer to BeagleV-Ahead).
SERIAL ?= /dev/ttyUSB0

PROGRAM ?= uart_hello
SRC_ROOT := src
MACHINE_SRC := $(SRC_ROOT)/machines/$(MACHINE)
ENTRY_SRC := $(SRC_ROOT)/$(PROGRAM).cal
CALYNDA_SOURCES := $(shell find $(SRC_ROOT) -type f -name '*.cal' ! -path '$(SRC_ROOT)/machines/*' | sort) \
                   $(shell find $(MACHINE_SRC) -type f -name '*.cal' 2>/dev/null | sort)
BUILD_DIR := build
BUILD_STAMP := $(BUILD_DIR)/.dir
MERGE_SCRIPT := scripts/merge_calynda_sources.sh
MERGED_SRC := $(BUILD_DIR)/$(PROGRAM)-$(MACHINE).merged.cal
ASM := $(BUILD_DIR)/$(PROGRAM)-$(MACHINE).generated.s
START_OBJ := $(BUILD_DIR)/start-$(MACHINE).o
RUNTIME_SRC := baremetal/runtime_boot.c
RUNTIME_OBJ := $(if $(wildcard $(RUNTIME_SRC)),$(BUILD_DIR)/runtime_boot-$(MACHINE).o)
HDMI_OBJ    := $(if $(filter th1520,$(MACHINE)),$(BUILD_DIR)/hdmi_fb-$(MACHINE).o)
PROGRAM_OBJ := $(BUILD_DIR)/$(PROGRAM)-$(MACHINE).o
ELF := $(BUILD_DIR)/$(PROGRAM)-$(MACHINE).elf
BIN := $(BUILD_DIR)/$(PROGRAM)-$(MACHINE).bin
MAP := $(BUILD_DIR)/$(PROGRAM)-$(MACHINE).map
DISASM := $(BUILD_DIR)/$(PROGRAM)-$(MACHINE).disasm

ARCH_FLAGS := -march=rv64gc -mabi=lp64d -mcmodel=medany
COMMON_FLAGS := $(ARCH_FLAGS) -ffreestanding -fno-pic -fno-pie
LINKER_SCRIPT := baremetal/riscv64-$(MACHINE).ld
QEMU_BASE_FLAGS := -machine virt -cpu rv64 -m 128M -bios none -monitor none
QEMU_SERIAL_FLAGS := -serial stdio
QEMU_GUI_FLAGS := -display gtk -serial vc
QEMU_LOADER_FLAGS := -device loader,file=$(ELF),cpu-num=0
QEMU_KERNEL_FLAGS := -kernel $(ELF)

.PHONY: all doctor asm build run run-serial run-gui run-kernel compare-boot boot-th1520 flash flash-auto disasm clean

all: build

doctor:
	@printf 'Calynda: '
	@if [ -x "$(CALYNDA)" ]; then echo "$(CALYNDA)"; else echo 'missing'; fi
	@printf 'Cross GCC: '
	@if command -v "$(CC)" >/dev/null 2>&1; then command -v "$(CC)"; else echo 'missing'; fi
	@printf 'QEMU: '
	@if command -v "$(QEMU)" >/dev/null 2>&1; then command -v "$(QEMU)"; else echo 'missing'; fi

$(BUILD_STAMP):
	mkdir -p $(BUILD_DIR)
	touch $@

$(MERGED_SRC): $(ENTRY_SRC) $(CALYNDA_SOURCES) $(MERGE_SCRIPT) | $(BUILD_STAMP)
	bash $(MERGE_SCRIPT) $(SRC_ROOT) $(MACHINE_SRC) $(ENTRY_SRC) $@

$(ASM): $(MERGED_SRC) | $(BUILD_STAMP)
	$(CALYNDA) asm --target riscv64 $< > $@

$(START_OBJ): baremetal/start.S | $(BUILD_STAMP)
	$(CC) $(COMMON_FLAGS) $(if $(filter th1520,$(MACHINE)),-DMACHINE_TH1520) -c $< -o $@

$(BUILD_DIR)/runtime_boot-$(MACHINE).o: $(RUNTIME_SRC) | $(BUILD_STAMP)
	$(CC) $(COMMON_FLAGS) -I baremetal -c $< -o $@

$(BUILD_DIR)/hdmi_fb-$(MACHINE).o: baremetal/hdmi_fb.c | $(BUILD_STAMP)
	$(CC) $(COMMON_FLAGS) -I baremetal -c $< -o $@

$(PROGRAM_OBJ): $(ASM) | $(BUILD_STAMP)
	$(CC) $(COMMON_FLAGS) -c $< -o $@

$(ELF): $(START_OBJ) $(RUNTIME_OBJ) $(HDMI_OBJ) $(PROGRAM_OBJ) $(LINKER_SCRIPT)
	$(CC) $(ARCH_FLAGS) -nostdlib -nostartfiles -static -Wl,--build-id=none -Wl,-T,$(LINKER_SCRIPT) -Wl,-Map,$(MAP) $(START_OBJ) $(RUNTIME_OBJ) $(HDMI_OBJ) $(PROGRAM_OBJ) -o $@

$(BIN): $(ELF)
	$(OBJCOPY) -O binary $< $@

$(DISASM): $(ELF)
	$(OBJDUMP) -d -S $< > $@

asm: $(ASM)

build: $(ELF) $(BIN)

run: $(ELF)
ifeq ($(MACHINE),th1520)
	$(error MACHINE=th1520 cannot run in QEMU. Use 'make boot-th1520' for instructions.)
endif
	$(QEMU) $(QEMU_BASE_FLAGS) $(QEMU_SERIAL_FLAGS) $(QEMU_LOADER_FLAGS)

run-serial: $(ELF)
ifeq ($(MACHINE),th1520)
	$(error MACHINE=th1520 cannot run in QEMU. Use 'make boot-th1520' for instructions.)
endif
	$(QEMU) $(QEMU_BASE_FLAGS) $(QEMU_SERIAL_FLAGS) $(QEMU_LOADER_FLAGS)

run-gui: $(ELF)
ifeq ($(MACHINE),th1520)
	$(error MACHINE=th1520 cannot run in QEMU. Use 'make boot-th1520' for instructions.)
endif
	$(QEMU) $(QEMU_BASE_FLAGS) $(QEMU_GUI_FLAGS) $(QEMU_LOADER_FLAGS)

run-kernel: $(ELF)
ifeq ($(MACHINE),th1520)
	$(error MACHINE=th1520 cannot run in QEMU. Use 'make boot-th1520' for instructions.)
endif
	$(QEMU) $(QEMU_BASE_FLAGS) $(QEMU_SERIAL_FLAGS) $(QEMU_KERNEL_FLAGS)

boot-th1520: $(BIN)
	@echo ""
	@echo "=== BeagleV-Ahead boot instructions ==="
	@echo "Flat binary: $(BIN)  (load+entry address 0x04000000)"
	@echo ""
	@echo "Option A — USB serial Y-Modem (you are already connected):"
	@echo "  1. In U-Boot, type:  loady 0x04000000"
	@echo "  2. On the host, run: make flash MACHINE=th1520"
	@echo "  3. In U-Boot, type:  go 0x04000000"
	@echo ""
	@echo "Option B — SD card (FAT partition):"
	@echo "  cp $(BIN) /path/to/sdcard/"
	@echo "  In U-Boot:  fatload mmc 0:1 0x04000000 $(notdir $(BIN))"
	@echo "              go 0x04000000"
	@echo ""
	@echo "Option C — TFTP (board and host on same LAN):"
	@echo "  Copy $(BIN) to your TFTP server root directory."
	@echo "  In U-Boot:  setenv serverip <host-ip>"
	@echo "              tftpboot 0x04000000 $(notdir $(BIN))"
	@echo "              go 0x04000000"
	@echo ""

flash-auto: build
	@if [ "$(MACHINE)" != "th1520" ]; then \
		echo "flash-auto is only for MACHINE=th1520. Use: make flash-auto MACHINE=th1520"; \
		exit 1; \
	fi
	SERIAL=$(SERIAL) bash scripts/flash-th1520.sh

flash: $(BIN)
	@if [ "$(MACHINE)" != "th1520" ]; then \
		echo "flash target is only for MACHINE=th1520. Use: make flash MACHINE=th1520"; \
		exit 1; \
	fi
	@if ! command -v sb >/dev/null 2>&1; then \
		echo "'sb' not found. Install lrzsz: sudo apt-get install lrzsz"; \
		exit 1; \
	fi
	@echo "Configuring $(SERIAL) at 115200 baud ..."
	stty -F $(SERIAL) 115200 raw cs8 -parenb -cstopb -echo -crtscts
	@echo "Sending $(BIN) via Y-Modem to $(SERIAL) ..."
	@echo "(Make sure U-Boot is waiting at 'loady 0x04000000' before proceeding.)"
	sb $(BIN) < $(SERIAL) > $(SERIAL)

compare-boot: $(ELF)
	rm -f $(BUILD_DIR)/uart_kernel.log $(BUILD_DIR)/uart_loader.log
	-timeout 2s $(QEMU) $(QEMU_BASE_FLAGS) -serial file:$(BUILD_DIR)/uart_kernel.log $(QEMU_KERNEL_FLAGS)
	-timeout 2s $(QEMU) $(QEMU_BASE_FLAGS) -serial file:$(BUILD_DIR)/uart_loader.log $(QEMU_LOADER_FLAGS)
	@printf 'kernel bytes: '
	@wc -c < $(BUILD_DIR)/uart_kernel.log
	@printf 'loader bytes: '
	@wc -c < $(BUILD_DIR)/uart_loader.log
	@printf 'loader text: '
	@cat $(BUILD_DIR)/uart_loader.log

disasm: $(DISASM)

clean:
	rm -rf $(BUILD_DIR)