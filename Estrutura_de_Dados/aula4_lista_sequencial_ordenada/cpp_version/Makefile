CFLAGS = -O
CC = g++

LinearSeqList: main.o linearSeqList.o register.o
	$(CC) $(CFLAGS) -o a.out main.o linearSeqList.o register.o

main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

linearSeqList.o: linearSeqList.cpp
	$(CC) $(CFLAGS) -c linearSeqList.cpp

register.o: register.cpp
	$(CC) $(CFLAGS) -c register.cpp

clean:
	rm -f core *.o
