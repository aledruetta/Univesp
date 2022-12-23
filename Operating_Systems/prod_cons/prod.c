/* Produtor */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#define TRUE 1

int main()
{
    srand(time(0));
    FILE *buf;

    while(TRUE) {
        buf = fopen("buffer.txt", "a");

        if(buf == NULL) {
            printf("Error!");
            exit(1);
        }

        char bit = rand() % 2;
        fprintf(buf, "%d", bit);

        int slt = rand() % 5;
        sleep(slt);

        fclose(buf);
    }

    return 0;
}
