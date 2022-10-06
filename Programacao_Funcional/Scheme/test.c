# include <stdio.h>

typedef int (*IntProc)();

int divByZero()
{
    return 1 / 0;
}

int p(int x, IntProc y)
{
    if (x) return 1;
    else return y();
}

int main()
{
    int r = p(1, divByZero);
    printf("%i\n", r);
    if (0) return 1;
    else return divByZero();
}