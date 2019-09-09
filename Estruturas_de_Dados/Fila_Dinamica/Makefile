CC=gcc
CFLAGS = -g -Wall
DEPS = fila_dinamica.h
OBJ = main.o fila_dinamica.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

fila.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
