#include <stdio.h>

const int cg = 5;

int main()
{
    const int cl;

    printf("%d\n", cg);

    cl = 7;

    printf("%d\n", cl);

    return 0;
}