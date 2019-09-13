CC=gcc
CFLAGS = -g -Wall
DEPS = matriz_esparsa.h
OBJ = main.o matriz_esparsa.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

matriz.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
