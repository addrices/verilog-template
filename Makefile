.PHONY: all emu clean-all run-emu

OBJ_DIR := output
V_DIR := src
LOG_DIR := logs
V_FILES := $(shell find $(V_DIR) -name "*.v")
WAVE_VIEWER := gtkwave
LOG_FILE := logs/vlt_dump.vcd

EMU_SRC_DIR := emu
EMU_TOP_MODULE := adder
EMU_MK := $(OBJ_DIR)/emu.mk
EMU_BIN := $(OBJ_DIR)/emulator
EMU_CXXFILES := $(shell find $(EMU_SRC_DIR) -name "*.cpp")


emu: $(EMU_BIN)
run-emu: emu
	@$(EMU_BIN) +trace

$(EMU_MK): $(V_FILES) $(EMU_CXXFILES)
	@verilator --cc --exe --top-module $(EMU_TOP_MODULE) \
	  -o $(notdir $(EMU_BIN)) -Mdir $(@D) --trace\
	  --prefix $(basename $(notdir $(EMU_MK))) $^ -CFLAGS -DVL_TIME_CONTEXT

$(EMU_BIN): $(EMU_MK) $(EMU_CXXFILES)
	@cd $(@D) && make -s -f $(notdir $<)

clean-all:
	rm -rf $(OBJ_DIR) $(LOG_DIR)

show: run-emu
	@$(WAVE_VIEWER) $(LOG_FILE)
