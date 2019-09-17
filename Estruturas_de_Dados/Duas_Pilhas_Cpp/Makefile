CC=g++
CFLAGS = -g -Wall
DEPS = duas_pilhas.hpp
OBJ = main.o duas_pilhas.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

pilhas.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
