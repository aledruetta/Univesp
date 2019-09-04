/*
 * File: Pilha_Dinamica/pilha_dinamica.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include "pilha_dinamica.h"

void inicializar_pilhaDim ( PilhaDim *pilha )
{
    pilha->topo = NULL;
}

void reinicializar_pilhaDim ( PilhaDim *pilha )
{
    while (pilha->topo != NULL) {
        Celula *topo = pilha->topo;
        pilha->topo = topo->prox;
        free (topo);
    }
}

void adicionar_pilhaDim ( PilhaDim *pilha, const Registro registro )
{
    Celula *celula = (Celula*) malloc (sizeof (Celula));
    celula->reg = registro;
    celula->prox = pilha->topo;
    pilha->topo = celula;
}

int tamanho_pilhaDim ( const PilhaDim pilha )
{
    unsigned cont = 0;
    Celula *topo = pilha.topo;
    while (topo != NULL) {
        cont++;
        topo = topo->prox;
    }
    return cont;
}

void mostrar_pilhaDim ( const PilhaDim pilha )
{
    Celula *prox = pilha.topo;
    printf (" Pilha [ ");
    while (prox != NULL) {
        printf ("%d ", prox->reg.chave);
        prox = prox->prox;
    }
    printf ("] Tamanho: %u\n", tamanho_pilhaDim (pilha));
}

bool deletar_pilhaDim ( PilhaDim *pilha, Registro *registro )
{
    if (pilha->topo == NULL) return false;
    *registro = pilha->topo->reg;
    Celula *topo = pilha->topo;
    pilha->topo = pilha->topo->prox;
    free (topo);

    return true;
}

