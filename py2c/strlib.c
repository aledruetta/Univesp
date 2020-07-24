#include "strlib.h"
#include "strtools.h"

char * capitalize(const char * str, size_t len)
{
    size_t i;
    char * new_str = (char *) malloc(len);
    *new_str = char2Upper(*str);

    for (i = 1; i < len; i++)
        new_str[i] = char2Lower(str[i]);

    return new_str;
}

char * title(const char * str, size_t len)
{
    size_t i;
    char prev = ' ';
    char * new_str = (char *) malloc(len);

    for (i = 0; i < len; i++) {
        if (prev == ' ')
            new_str[i] = char2Upper(str[i]);
        else
            new_str[i] = char2Lower(str[i]);
        prev = str[i];
    }

    return new_str;
}
