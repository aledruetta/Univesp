/* exercise 1-13 */

#include <stdio.h>

#define MAXBUF 26

char touppercase(char c);

int main()
{
    char c;
    int buf[MAXBUF];
    int index, max = 0;

    for (int i=0; i<MAXBUF; i++)
        buf[i] = 0;

    while ((c = getchar()) != EOF) {
        c = touppercase(c);

        if (c >= 'A' && c <= 'Z') {
            index = c - 'A';
            buf[index]++;
            if (buf[index] > max)
                max = buf[index];
        }
    }

    for (int i=max; i>0; i--) {
        for (int j=0; j<MAXBUF; j++) {
            if (buf[j] == i) {
                printf("  *");
                buf[j]--;
            }
            else
                printf("   ");
        }
        putchar('\n');
    }

    for (int i=0; i<MAXBUF; i++)
        printf("%3c", i + 'a');
    putchar('\n');

    return 0;
}

char touppercase(char c)
{
    if (c >= 'a' && c <= 'z')
        return c -= 'a' - 'A';
    return c;
}
