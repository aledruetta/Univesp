CC=gcc
CFLAGS = -g -Wall
DEPS = matriz.h
OBJ = main.o matriz.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

algebra.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
