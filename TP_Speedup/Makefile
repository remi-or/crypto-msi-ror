CC = gcc

# Compiler flags:
#  -g adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
#  -march=native tells the compiler to tailor the code to the hardware
#  -O3 tells the compiler to optimise the code as much as possible
CFLAGS  = -g -Wall -march=native -O3 -fopenmp

# The build target executable:
TARGET = some_program

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	$(RM) $(TARGET)