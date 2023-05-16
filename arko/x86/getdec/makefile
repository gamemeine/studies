CC = gcc
CFLAGS = -m32 -Wall -g

ASM = nasm
AFLAGS = -g -f elf 

all: main.o getdec.o
	$(CC) $(CFLAGS) main.o getdec.o -o getdec

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

getdec.o: getdec.s
	$(ASM) $(AFLAGS) getdec.s

clean:
	rm -rf *.o
	rm -rf getdec