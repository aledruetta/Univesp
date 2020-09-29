#include <stdio.h>      // EOF, getchar
#include "functions.h"

int get_line(char line[], int maxline)
{
    char c;
    int len = 0;

    while (len < maxline && (c = getchar()) != EOF && c != '\n') {
        line[len] = c;
        len++;
    }

    if (c == EOF)
        return EOF;
    else if (len >= maxline)
        clear_stdin();

    line[len] = '\0';

    return len;
}

void entab(char line[], int len)
{
}

void detab(char line[], int len)
{
    for (int i=0; i<len; i++)
        if (line[i] == '\t') {
            int stop = ((i / TABSTOP) + 1) * TABSTOP;
            int offset = stop - i - 1;

            for (int j=len-1; j>i; j--)
                line[j+offset] = line[j];

            for (int j=i; j<stop; j++)
                line[j] = '.';

            len += offset;
        }

    line[len] = '\0';
}

void clear_stdin()
{
    char c;
    while ((c = getchar()) != '\n' && c != EOF);
}
