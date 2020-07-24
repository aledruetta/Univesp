#include <stdio.h>
#include <string.h>
#include "strlib.h"

int main()
{
    char * buf = (char *) malloc(256);

    /* Capitalize */

    buf = strcpy(buf, "uma FraSe quaLqueR.");

    printf("=== Capitalize ===\n");
    printf("original : %s\n", buf);
    printf("formatted: %s\n", capitalize(buf, strlen(buf)));
    printf("chars    : %ld\n", strlen(buf));

    /* Title */

    buf = strcpy(buf, "  habIa una  veZ una vaca...");

    printf("=== Title ===\n");
    printf("original : %s\n", buf);
    printf("formatted: %s\n", title(buf, strlen(buf)));
    printf("chars    : %ld\n", strlen(buf));

    free(buf);

    return 0;
}
