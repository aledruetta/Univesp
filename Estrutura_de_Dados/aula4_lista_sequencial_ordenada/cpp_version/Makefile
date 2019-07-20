CFLAGS = -O
CC = g++

LinearSeqList: main.o LinearSeqList.o Register.o
	$(CC) $(CFLAGS) -o a.out main.o LinearSeqList.o Register.o

main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

LinearSeqList.o: LinearSeqList.cpp
	$(CC) $(CFLAGS) -c LinearSeqList.cpp

Register.o: Register.cpp
	$(CC) $(CFLAGS) -c Register.cpp

clean:
	rm -f core *.o
