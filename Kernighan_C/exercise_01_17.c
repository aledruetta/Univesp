/* Exercise 1-17 */

#include <stdio.h>
#define MAXBUF 1000
#define MAXLINE 80

int custom_getline(char line[], int max);

int main()
{
    char line[MAXBUF];
    int len;

    while ((len = custom_getline(line, MAXBUF)) > 0) {
        if (len > MAXLINE) {
            printf("%s", line);
            printf("%d\n", len);
        }
    }

    return 0;
}

int custom_getline(char line[], int max)
{
    char c;
    int len = 0;

    while ((c = getchar()) != EOF && c != '\n' && len < max) {
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
