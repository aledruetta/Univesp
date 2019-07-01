#include <stdio.h>

int main()
{
    int inteiro = 25;
    int * p_inteiro = &inteiro;

    printf("inteiro = %i\n", inteiro);
    printf("&inteiro = %p\n", &inteiro);
    printf("p_inteiro = %p\n", p_inteiro);
    printf("&p_inteiro = %p\n", &p_inteiro);

    * p_inteiro = 30;
    printf("inteiro = %i\n", inteiro);

    return 0;
}

