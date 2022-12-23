/* Exercise 1-21 */

#include <stdio.h>
#include "functions.h"

#define MAXLINE 1000

int main()
{
    char line[MAXLINE];
    int len;

    while ((len = get_line(line, MAXLINE)) != EOF) {
        entab(line, len);
        printf("%s\n", line);
    }

    return 0;
}
