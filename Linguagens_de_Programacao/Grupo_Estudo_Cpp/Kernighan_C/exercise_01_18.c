/* Exercise 1-18 */

#include <stdio.h>
#define MAXLINE 10

int my_getline(char line[], int maxline);
void trailing(char line[], int len);

int main()
{
    char line[MAXLINE];
    int len = my_getline(line, MAXLINE);
    trailing(line, len);

    printf("\"%s\"", line);

    return 0;
}

int my_getline(char line[], int maxline)
{
    char c;
    int len = 0;

    while ((c = getchar()) != EOF && len < maxline-1 && c != '\n') {
        line[len] = c;
        len++;
    }

    if (c == '\n') {
        line[len] = '\n';
        len++;
    }

    line[len] = '\0';

    return len;
}

void trailing(char line[], int len)
{
    char c;

    while (len > 0 && ((c = line[--len]) == ' ' || c == '\t' || c == '\n'))
        line[len] = '\0';
}
