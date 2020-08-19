#include "py_strlib.h"
#include "strtools.h"

void py_capitalize(const char str[], char new_str[], size_t len)
{
    size_t i;
    *new_str = char2Upper(*str);

    for (i = 1; i < len; i++)
        new_str[i] = char2Lower(str[i]);
}

void py_title(const char str[], char new_str[], size_t len)
{
    size_t i;
    char prev = ' ';

    for (i = 0; i < len; i++) {
        if (prev == ' ')
            new_str[i] = char2Upper(str[i]);
        else
            new_str[i] = char2Lower(str[i]);
        prev = str[i];
    }
}

bool py_isalnum(const char str[], size_t len)
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
