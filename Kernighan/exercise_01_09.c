/* exercise 1-9 */

#include <stdio.h>

int main()
{
    char c, pre = '\0';

    while ((c = getchar()) != EOF) {
        if ((c != '\t' && c != '\n' && c != ' ') || c != pre)
            putchar(c);
        pre = c;
    }

    return 0;
}
