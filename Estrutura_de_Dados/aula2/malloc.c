#include <stdio.h>
#include <malloc.h>

#define ALTURA_MAX 255

// Definindo uma estrutura de tipo PesoAltura
typedef struct
{
    int peso;
    int altura;
} PesoAltura;

int main()
{
    // Alocando memória de forma dinâmica.
    PesoAltura * joao = (PesoAltura *) malloc(sizeof(PesoAltura));
    printf("sizeof PesoAltura = %li\n", sizeof(PesoAltura));
    // Acessando os membros do ponteiro a uma estrutura.
    joao->peso = 67;
    joao->altura = 178;

    printf("Peso: %d, Altura: %d, Máxima: %d\n",
            joao->peso, joao->altura, ALTURA_MAX);

    if (joao->altura > ALTURA_MAX)
    {
        printf("Altura acima da máxima.\n");
    }
    else if (joao->altura == ALTURA_MAX)
    {
        printf("Altura igual à máxima.\n");
    }
    else
    {
        printf("Altura abaixo da máxima.\n");
    }

    return 0;
}

