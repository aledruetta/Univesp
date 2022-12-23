CC=gcc
CFLAGS = -g -Wall
DEPS = arvore_avl.h
OBJ = main.o arvore_avl.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

arvore.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
