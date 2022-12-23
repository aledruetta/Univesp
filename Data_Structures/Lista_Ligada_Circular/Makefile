CC=gcc
CFLAGS = -g -Wall
DEPS = lista_ligada_circular.h
OBJ = main.o lista_ligada_circular.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

lista.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
