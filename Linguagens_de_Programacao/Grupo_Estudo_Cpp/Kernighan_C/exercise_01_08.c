/* exercise 1-8 */

#include <stdio.h>

int main()
{
    int n = 0;
    char c;

    while ((c = getchar()) != EOF)
        if (c == ' ' || c == '\t' || c == '\n')
            n++;

    printf("Blanks: %d\n", n);

    return 0;
}
