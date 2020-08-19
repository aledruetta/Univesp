CC=gcc
CFLAGS = -g -Wall
DEPS = py_strlib.h strtools.h
OBJ = main.o py_strlib.o strtools.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(FLAGS)

a.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
