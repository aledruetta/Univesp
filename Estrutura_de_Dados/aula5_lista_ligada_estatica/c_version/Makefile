CC=gcc
DEPS = static_linked_list.h
OBJ = main.o static_linked_list.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $<

test.out: $(OBJ)
	$(CC) -o $@ $^

clean:
	rm -rf *.o core

