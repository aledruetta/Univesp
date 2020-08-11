#include <stdio.h>

main() {
    int c = getchar();
    while ((c = getchar()) != EOF)
        printf("%c\n", c);
}
