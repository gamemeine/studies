CC = gcc
CFLAGS = -m32 -Wall -g

ASM = nasm
AFLAGS = -g -f elf 

all: main.o increasing.o
	$(CC) $(CFLAGS) main.o increasing.o -o increasing

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

increasing.o: increasing.s
	$(ASM) $(AFLAGS) increasing.s

clean:
	rm -rf *.o
	rm -rf increasing