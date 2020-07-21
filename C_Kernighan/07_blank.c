#include <stdio.h>

main() {
    int c, last = ' ';

    while ((c = getchar()) != EOF) {
        if (c != ' ' || last != ' ')
            printf("%c", c);
        last = c;
    }
    printf("\n");
}
