CC=gcc
CFLAGS = -g -Wall
DEPS = deque_dinamico.h
OBJ = main.o deque_dinamico.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

deque.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
