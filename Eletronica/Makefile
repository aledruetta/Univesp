CC=g++
CFLAGS = -g -Wall
DEPS = resistor.hpp
OBJ = main.o passivo.o resistor.o

%.o: %.c $(DEPS)
	$(CC) -c $< $(CFLAGS)

eletronica.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf *.o core
