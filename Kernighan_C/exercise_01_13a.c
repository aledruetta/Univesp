/* exercise 1-13 */

#include <stdio.h>

#define MAXBUF 15

int main()
{
    char c;
    int buf[MAXBUF];
    int len = 0;

    for (int i=0; i<MAXBUF; i++)
        buf[i] = 0;

    while ((c = getchar()) != EOF) {
        if ((c == ' ' || c == '\t' || c == '\n') && len < MAXBUF) {
            buf[len]++;
            len = 0;
        }
        else
            len++;
    }

    for (int i=0; i<MAXBUF; i++) {
        printf("%-3d", i);
        for (int j=0; j<buf[i]; j++)
            printf("*");
        putchar('\n');
    }

    return 0;
}
