CC = gcc
CFLAGS = -m32 -Wall -g

ASM = nasm
AFLAGS = -g -f elf 

all: main.o remrep.o
	$(CC) $(CFLAGS) main.o remrep.o -o remrep

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

remrep.o: remrep.s
	$(ASM) $(AFLAGS) remrep.s

clean:
	rm -rf *.o
	rm -rf remrep