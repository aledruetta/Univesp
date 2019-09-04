/*
 * File: Pilha_Dinamica/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include "pilha_dinamica.h"

void carregar_pilha (PilhaDim*, unsigned);

int main ()
{
    srand (time (NULL));
    unsigned ntest = 1;

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma pilha vacia.\n", ntest++);
    PilhaDim pilha = {NULL};
    inicializar_pilhaDim (&pilha);
    mostrar_pilhaDim (pilha);

    // Adicionar
    unsigned quant = 10;
    printf ("\n Teste %u: Adicionar registros.\n", ntest++);
    carregar_pilha (&pilha, quant);
    mostrar_pilhaDim (pilha);

    // Deletar
    printf ("\n Teste %u: Deletar registros.\n", ntest++);
    Registro registro;
    for (unsigned i=0; i<quant-4; i++) {
        deletar_pilhaDim (&pilha, &registro);
        printf (" Deletando registro chave: %d\n", registro.chave);
    }
    mostrar_pilhaDim (pilha);

    reinicializar_pilhaDim (&pilha);
    mostrar_pilhaDim (pilha);

    return 0;
}

void carregar_pilha (PilhaDim *pilha, unsigned num)
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {(rand () % 100) - 50};
        printf (" Adicionando chave: %d\n", registro.chave);
        adicionar_pilhaDim (pilha, registro);
    }
}
