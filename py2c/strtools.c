#include "strtools.h"

bool isLower(char c)
{
    if (c <= 'a' || c >= 'z')
        return false;
    return true;
}

bool isUpper(char c)
{
    if (c <= 'A' || c >= 'Z')
        return false;
    return true;
}

char char2Lower(char c)
{
    if (isUpper(c))
        c += 32;
    return c;
}

char char2Upper(char c)
{
    if (isLower(c))
        c -= 32;
    return c;
}
