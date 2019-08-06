CC = g++
SRC = main.cpp static_linked_list.cpp
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

