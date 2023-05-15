CC = gcc
CFLAGS = -m32 -Wall -g

ASM = nasm
AFLAGS = -g -f elf 

all: main.o remnth.o
	$(CC) $(CFLAGS) main.o remnth.o -o remnth

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

remnth.o: remnth.s
	$(ASM) $(AFLAGS) remnth.s

clean:
	rm -rf *.o
	rm -rf remnth