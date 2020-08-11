#include <stdio.h>


int getln(char buf[], int maxlen)
{
    int i;
    char c;

    for (i = 0; i < maxlen && (c = getchar()) != EOF && c != '\n'; i++)
        buf[i] = c;

    return i;
}


void detab(char in[], char out[], int maxlen)
{
    int i;
    for (int j = 0; j < maxlen || in[j] == '\0'; j++) {
        if (in[j] == '\t')
    }
}
