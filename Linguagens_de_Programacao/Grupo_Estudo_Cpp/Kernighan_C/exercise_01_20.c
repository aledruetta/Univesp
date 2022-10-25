/* Exercise 1-20 */

#include <stdio.h>
#include "functions.h"

#define MAXLINE 1000

int main()
{
    char line[MAXLINE];
    int len;

    while ((len = get_line(line, MAXLINE)) != EOF) {
        detab(line, len);
        if (len > 0)
            printf("%s\n", line);
    }

    return 0;
}
