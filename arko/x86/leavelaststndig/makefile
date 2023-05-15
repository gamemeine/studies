CC = gcc
CFLAGS = -m32 -Wall -g

ASM = nasm
AFLAGS = -g -f elf 

all: main.o leavelaststndig.o
	$(CC) $(CFLAGS) main.o leavelaststndig.o -o leavelaststndig

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

leavelaststndig.o: leavelaststndig.s
	$(ASM) $(AFLAGS) leavelaststndig.s

clean:
	rm -rf *.o
	rm -rf leavelaststndig