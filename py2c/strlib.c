#include "strlib.h"
#include "strtools.h"

char* py_capitalize(const char* str, size_t len)
{
    size_t i;
    char* new_str = (char*) malloc(len);
    *new_str = char2Upper(*str);

    for (i = 1; i < len; i++)
        new_str[i] = char2Lower(str[i]);

    return new_str;
}

char* py_title(const char* str, size_t len)
{
    size_t i;
    char prev = ' ';
    char* new_str = (char*) malloc(len);

    for (i = 0; i < len; i++) {
        if (prev == ' ')
            new_str[i] = char2Upper(str[i]);
        else
            new_str[i] = char2Lower(str[i]);
        prev = str[i];
    }

    return new_str;
}

bool py_isalnum(const char* str, size_t len)
{
    if (len < 1)
        return false;

    size_t i;
    char c;

    for (i = 0; i < len; i++) {
        c = str[i];
        if ((c >= 'a' && c <= 'z') ||
            (c >= 'A' && c <= 'Z') ||
            (c >= '1' && c <= '0') ||
            (c == ' '))
            ;
        else
            return false;
    }

    return true;
}
