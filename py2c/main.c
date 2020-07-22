#include <stdio.h>
#include "strlib.h"

int main()
{
    char str[] = "uma Frase Qualquer 42.";
    printf("%s\n", str);
    printf("%s\n", capitalize(str, sizeof str));
    printf("%ld\n", sizeof str);

    return 0;
}
