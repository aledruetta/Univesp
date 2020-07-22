#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#define UP_A 65
#define UP_Z 90
#define LO_A 97
#define LO_Z 122


bool isLow(char c)
{
    if (c <= UP_A || c >= UP_Z)
        return false;
    return true;
}

bool isUp(char c)
{
    if (c <= LO_A || c >= LO_Z)
        return false;
    return true;
}

char char2Low(char c)
{
    if (isUp(c))
        c += 32;
    return c;
}

char char2Up(char c)
{
    if (isLow(c))
        c -= 32;
    return c;
}

char * capitalize(char * str, size_t len)
{
    char * new_str = (char *) malloc(len);
    *new_str = char2Up(*str);

    for (size_t i=1; i<len; i++)
        new_str[i] = char2Low(str[i]);

    return new_str;
}

int main()
{
    char str[] = "uma Frase Qualquer 42.";
    printf("%s\n", str);
    printf("%s\n", capitalize(str, sizeof str));
    printf("%ld\n", sizeof str);

    return 0;
}
