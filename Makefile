# Compiler defining
CC = gcc
AS = nasm

# Compiling options
CFLAGS = -Wall -g -m32
ASFLAGS = -f elf

# Target and dependencies defining
all: program

test.o: test.asm
	$(AS) $(ASFLAGS) -o test.o test.asm

program: main.o test.o
	$(CC) $(CFLAGS) -o program main.c test.o

clean:
	rm -f program *.o


