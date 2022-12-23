CC=gcc
CFLAGS = -g -Wall
DEPS = pilha_dinamica.h
OBJ = main.o pilha_dinamica.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

pilha.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
