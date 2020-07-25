CC=gcc
CFLAGS = -g -Wall
DEPS = strlib.h strtools.h
OBJ = main.o strlib.o strtools.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(FLAGS)

a.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
