/* exercise 1-13 */

#include <stdio.h>

#define MAXBUF 15

int main()
{
    char c;
    int buf[MAXBUF];
    int max = 0, len = 0;

    for (int i=0; i<MAXBUF; i++)
        buf[i] = 0;

    while ((c = getchar()) != EOF) {
        if ((c == ' ' || c == '\t' || c == '\n') && len < MAXBUF) {
            buf[len]++;
            if (buf[len] > max)
                max = buf[len];
            len = 0;
        }
        else
            len++;
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
        printf("%3d", i);
    putchar('\n');

    return 0;
}
