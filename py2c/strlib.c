#include "strlib.h"
#include "strtools.h"

char * capitalize(char * str, size_t len)
{
    char * new_str = (char *) malloc(len);
    *new_str = char2Upper(*str);

    size_t i;
    for (i=1; i<len; i++)
        new_str[i] = char2Lower(str[i]);

    return new_str;
}
