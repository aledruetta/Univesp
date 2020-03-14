CC=g++
CFLAGS = -g -Wall
DEPS = arvore_avl.hpp
OBJ = main.o arvore_avl.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

arvore.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
