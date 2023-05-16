CC = gcc
CFLAGS = -m32 -Wall -g

ASM = nasm
AFLAGS = -g -f elf 

all: main.o leavelongestnum.o
	$(CC) $(CFLAGS) main.o leavelongestnum.o -o leavelongestnum

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

leavelongestnum.o: leavelongestnum.s
	$(ASM) $(AFLAGS) leavelongestnum.s

clean:
	rm -rf *.o
	rm -rf leavelongestnum