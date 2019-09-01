CC=gcc
CFLAGS = -g -Wall
DEPS = pilha_estatica.h
OBJ = main.o pilha_estatica.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

lista.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
