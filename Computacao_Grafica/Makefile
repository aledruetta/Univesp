CC = gcc
LIBS = -lglut -lGLU -lGL
CFLAGS = -Wall

%: %.c
	$(CC) $^ $(CFLAGS) $(LIBS)

%: %.cpp
	$(CC) $^ $(CFLAGS) $(LIBS)

clean:
	rm -rf *.o *.out core
