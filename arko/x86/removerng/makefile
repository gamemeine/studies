CC = gcc
CFLAGS = -m32 -Wall -g

ASM = nasm
AFLAGS = -g -f elf 

all: main.o removerng.o
	$(CC) $(CFLAGS) main.o removerng.o -o rmvng

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

removerng.o: removerng.s
	$(ASM) $(AFLAGS) removerng.s

clean:
	rm -rf *.o
	rm -rf rmvng