CFLAGS = -O
CC = gcc

lista_ordenada: main.o lista.o test.o
	$(CC) $(CFLAGS) -o a.out main.o lista.o test.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

lista.o: lista.c
	$(CC) $(CFLAGS) -c lista.c

test.o: test.c
	$(CC) $(CFLAGS) -c test.c

clean:
	rm -f core *.o
