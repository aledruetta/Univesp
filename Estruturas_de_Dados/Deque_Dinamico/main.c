/*
 * File: Deque_Dinamico/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include <string.h>
#include "deque_dinamico.h"

void carregar_deque (DequeDim*, unsigned, char[10]);

int main ()
{
    srand (time (NULL));
    unsigned ntest = 1;

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma deque vacia.\n", ntest++);
    DequeDim deque = {NULL};
    inicializar_dequeDim (&deque);
    mostrar_dequeDim (deque);

    // Adicionar Esquerda
    unsigned quant = 10;
    printf ("\n Teste %u: Adicionar registros pela esquerda.\n", ntest++);
    carregar_deque (&deque, quant, "esquerda");
    mostrar_dequeDim (deque);

    // Deletar
    printf ("\n Teste %u: Deletar registros pela esquerda.\n", ntest++);
    Registro registro;
    for (unsigned i=0; i<quant-4; i++) {
        deletarPrimeiro_dequeDim (&deque, &registro);
        printf (" Deletando registro chave: %d\n", registro.chave);
    }
    mostrar_dequeDim (deque);

    // Adicionar Direita
    quant = 10;
    printf ("\n Teste %u: Adicionar registros pela direita.\n", ntest++);
    carregar_deque (&deque, quant, "direita");
    mostrar_dequeDim (deque);

    // Deletar
    printf ("\n Teste %u: Deletar registros pela direita.\n", ntest++);
    for (unsigned i=0; i<quant-4; i++) {
        deletarUltimo_dequeDim (&deque, &registro);
        printf (" Deletando registro chave: %d\n", registro.chave);
    }
    mostrar_dequeDim (deque);

    reinicializar_dequeDim (&deque);
    mostrar_dequeDim (deque);

    return 0;
}

void carregar_deque (DequeDim *deque, unsigned num, char extremo[])
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {(rand () % 100) - 50};
        printf (" Adicionando chave: %d\n", registro.chave);
        if (strncmp (extremo, "esquerda", 10) == 0)
            adicionarPrimeiro_dequeDim (deque, registro);
        else
            adicionarUltimo_dequeDim (deque, registro);
    }
}
