CC=gcc
CFLAGS = -g -Wall
DEPS = arvore_binaria_busca.h
OBJ = main.o arvore_binaria_busca.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

arvore.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
