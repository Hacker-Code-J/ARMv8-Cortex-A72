# Makefile for AArch64 C and Assembly Project

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Compiler, Assembler, and Flags
CC = aarch64-linux-gnu-gcc
AS = aarch64-linux-gnu-as
CFLAGS = -g -c           # -g for debugging, -c for compiling without linking
ASFLAGS = -g             # -g for debugging
LDFLAGS =                # Additional linker flags

# Source and Object Files
C_SRCS = $(wildcard $(SRC_DIR)/*.c)
ASM_SRCS = $(wildcard $(SRC_DIR)/*.s)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(C_SRCS)) \
       $(patsubst $(SRC_DIR)/%.s, $(OBJ_DIR)/%.o, $(ASM_SRCS))

# Extract the base name of the main source file for the target name
MAIN_SRC = $(basename $(notdir $(filter $(SRC_DIR)/main.c,$(C_SRCS))))
TARGET = $(BIN_DIR)/$(MAIN_SRC)

# Default target
all: $(TARGET)

# Ensure directories exist
$(OBJ_DIR) $(BIN_DIR):
	@mkdir -p $@

# Build target executable
$(TARGET): $(OBJS) | $(BIN_DIR)
	@echo "Linking..."
	$(CC) -g -o $@ $(OBJS)
	@echo "Build complete: $(TARGET)"

# Compile C source files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@echo "Compiling C source: $<"
	$(CC) $(CFLAGS) -o $@ $<

# Assemble Assembly source files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s | $(OBJ_DIR)
	@echo "Assembling ASM source: $<"
	$(AS) $(ASFLAGS) -o $@ $<

# Clean up build files
clean:
	@echo "Cleaning up build files..."
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Rebuild from scratch
rebuild: clean all

# Run the program
run: $(TARGET)
	@echo "Running program..."
	./$(TARGET)

# Phony targets to prevent conflicts
.PHONY: all clean rebuild run
