/* Exercise 1-19 */

#include <stdio.h>
#define MAXLINE 1000

int my_getline(char line[], int maxline);
void reverse(char line[], int len);

int main()
{
    char line[MAXLINE];
    int len;

    while ((len = my_getline(line, MAXLINE)) != EOF) {
        reverse(line, len);
        printf("%s\n", line);
    }

    return 0;
}

int my_getline(char line[], int maxline)
{
    char c;
    int len = 0;

    while ((c = getchar()) != EOF && c != '\n' && len < maxline-1) {
        line[len] = c;
        len++;
    }

    if (c == EOF)
        return EOF;
    else if (c == '\n')
        line[len] = '\0';
    else if (len >= maxline-1) {
        line[len] = '\0';
        while ((c = getchar()) != '\n');
    }

    return len;
}

void reverse(char line[], int len)
{
    char tmp;

    if (len > 0)
        for (int i=0; i<len/2; i++) {
            int head = len-i-1;
            tmp = line[i];
            line[i] = line[head];
            line[head] = tmp;
        }
}
