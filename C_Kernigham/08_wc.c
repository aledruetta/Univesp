#include <stdio.h>

#define IN 1
#define OUT 0

main() {
    int c;
    int state = OUT;
    long nc, nw, nl;

    nc = nw = nl = 0;

    while ((c = getchar()) != EOF) {
        ++nc;
        if (c == '\n')
            ++nl;
        if (c == ' ' || c == '\n' || c == '\t')
            state = OUT;
        else if (state == OUT) {
            ++nw;
            state = IN;
        }
    }

    printf("%ld %ld %ld\n", nc, nw, nl);
}
