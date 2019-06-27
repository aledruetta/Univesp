#include <stdio.h>

#define ALTURA_MAX 255

// Definindo uma estrutura de tipo PesoAltura
typedef struct
{
    int peso;
    int altura;
} PesoAltura;

int main()
{
    // Criando uma variável de tipo PesoAltura
    PesoAltura joao;
    joao.peso = 67;
    joao.altura = 178;

    // Usando a estrutura de tipo PesoAltura
    printf("Peso: %d, Altura: %d, Máxima: %d\n",
            joao.peso, joao.altura, ALTURA_MAX);

    if (joao.altura > ALTURA_MAX)
    {
        printf("Altura acima da máxima.\n");
    }
    else if (joao.altura == ALTURA_MAX)
    {
        printf("Altura igual à máxima.\n");
    }
    else
    {
        printf("Altura abaixo da máxima.\n");
    }

    return 0;
}

