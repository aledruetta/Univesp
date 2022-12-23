CC=gcc
CFLAGS = -g -Wall
DEPS = lista_linear_sequencial.h
OBJ = main.o lista_linear_sequencial.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

lista.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
