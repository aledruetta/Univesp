CC=gcc
CFLAGS = -g -Wall
DEPS = lista_linear_ordenada.h
OBJ = main.o lista_linear_ordenada.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

lista.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
