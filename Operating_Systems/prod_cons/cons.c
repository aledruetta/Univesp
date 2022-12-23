/* Consumidor */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#define TRUE 1
#define MAXBITS 1000
#define FILENAME "buffer.txt"

char read_buf(char * line)
{
    FILE * file = fopen(FILENAME, "r");

    if(file == NULL) {
        printf("Error!");
        exit(1);
    }

    fgets(line, MAXBITS, file);

    char ch = (char) line[0];

    int i = 1;
    while(line[i] != '\0') {
        line[i-1] = line[i];
        i++;
    }

    fclose(file);

    return ch;
}

void write_buf(char * line)
{
    FILE * file = fopen(FILENAME, "w");

    if(file == NULL) {
        printf("Error!");
        exit(1);
    }

    fputs(line, file);
    fclose(file);
}

int main()
{
    srand(time(0));
    char line[MAXBITS];

    while(TRUE) {
        char ch = read_buf(line);
        puts(ch);
        // write_buf(line);

        int slt = rand() % 5;
        sleep(slt);

    }
    printf("\n");

    return 0;
}
