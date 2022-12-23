CC=gcc
CFLAGS = -g -Wall
DEPS = fila_estatica.h
OBJ = main.o fila_estatica.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

fila.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
