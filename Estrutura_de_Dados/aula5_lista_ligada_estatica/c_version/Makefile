CC = gcc
SRC = main.c static_linked_list.c
DEPS = static_linked_list.h
OBJ = main.o static_linked_list.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $<

test.out: $(OBJ)
	$(CC) -o $@ $^

dbg.out: $(SRC)
	$(CC) -g -o $@ $^

debug:
	gdb dbg.out

clean:
	rm -rf *.o *.out core

