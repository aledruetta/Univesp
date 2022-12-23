/*
 * File: Pilha_Estatica/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include "pilha_estatica.h"

void carregar_pilha (PilhaEst*, unsigned);

int main ()
{
    srand (time (NULL));
    unsigned ntest = 1;

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma lista vacia.\n", ntest++);
    PilhaEst pilha;
    inicializar_pilhaEst (&pilha);
    mostrar_pilhaEst (&pilha);

    // Adicionar
    printf ("\n Teste %u: Adicionar registros.\n", ntest++);
    carregar_pilha (&pilha, MAX + 2);
    mostrar_pilhaEst (&pilha);

    // Deletar
    printf ("\n Teste %u: Deletar registros.\n", ntest++);
    Registro* registro = NULL;
    for (unsigned i=0; i<MAX-4; i++) {
        registro = deletar_pilhaEst (&pilha);
        printf (" Deletando registro chave: %d\n", registro->chave);
    }
    mostrar_pilhaEst (&pilha);

    return 0;
}

void carregar_pilha (PilhaEst* pilha, unsigned num)
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {(rand () % 100) - 50};
        printf (" Adicionando chave %d: ", registro.chave);
        bool adicionado = adicionar_pilhaEst (pilha, registro);
        if (!adicionado)
            printf (" Erro: Lista cheia!\n");
        else
            printf ("\n");
    }
}
