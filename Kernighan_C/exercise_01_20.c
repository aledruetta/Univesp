/* Exercise 1-20 */

#include <stdio.h>
#define MAXLINE 1000
#define TABSTOP 8

int get_line(char line[], int maxline);
void detab(char line[], int len);
void clear();

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

int get_line(char line[], int maxline)
{
    char c;
    int len = 0;

    while ((c = getchar()) != '\n' && c != EOF && len < maxline-1) {
        line[len] = c;
        len++;
    }

    line[len] = '\0';

    if (c == EOF)
        return EOF;

    if (len >= maxline-1 && c != '\n')
        clear();

    return len;
}

void clear()
{
    char c;
    while ((c = getchar()) != '\n' && c != EOF);
}
