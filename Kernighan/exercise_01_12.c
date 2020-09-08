/* exercise 1-12 */

#include <stdio.h>

int main()
{
    char c;

    while ((c = getchar()) != EOF)
        if (c == ' ' || c == '\t')
            putchar('\n');
        else
            putchar(c);

    return 0;
}
