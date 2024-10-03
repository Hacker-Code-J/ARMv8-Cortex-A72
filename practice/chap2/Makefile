# Makefile for AArch64 assembly program

# Variables
AS = as                      # Assembler
LD = ld                      # Linker
ASFLAGS = -g                 # Assembler flags (e.g., debugging info)
LDFLAGS =                    # Linker flags
NAME = add
OBJ = $(NAME).o              # Object file
TARGET = $(NAME)             # Output executable
SRC = $(NAME).s              # Assembly source file

# Default target
all: $(TARGET)

# Rule to build the executable
$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $^

# Rule to assemble the source file
$(OBJ): $(SRC)
	$(AS) $(ASFLAGS) -o $@ $<

# Rebuild target: cleans and builds everything
rebuild: clean all

# Run the program after building
run: $(TARGET)
	./$(TARGET)

# Clean up
clean:
	rm -f $(OBJ) $(TARGET)

# Phony targets
.PHONY: all clean rebuild run