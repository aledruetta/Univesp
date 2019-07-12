CFLAGS = -O
CC = gcc

lista_ordenada: main.o lista.o
	$(CC) $(CFLAGS) -o a.out main.o lista.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

lista.o: lista.c
	$(CC) $(CFLAGS) -c lista.c

clean:
	rm -f core *.o
