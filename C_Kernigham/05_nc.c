#include <stdio.h>

main() {
    unsigned long nc;

    for (nc=0; getchar() != EOF; ++nc)
        ;
    printf("%ld\n", nc);
}
