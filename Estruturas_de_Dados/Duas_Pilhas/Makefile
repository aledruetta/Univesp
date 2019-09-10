CC=gcc
CFLAGS = -g -Wall
DEPS = duas_pilhas.h
OBJ = main.o duas_pilhas.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

pilhas.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
