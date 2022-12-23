/*
 * File: Deque_Dinamico/deque_dinamico.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include "deque_dinamico.h"

void inicializar_dequeDim ( DequeDim *deque )
{
    Celula *cabeca = (Celula*) malloc (sizeof (Celula));
    cabeca->ant = cabeca;     // último
    cabeca->prox = cabeca;     // primeiro
    deque->cabeca = cabeca;
}

void reinicializar_dequeDim ( DequeDim *deque )
{
    Celula *cabeca = deque->cabeca;
    Celula *atual = cabeca->prox;
    Celula *prox = NULL;

    while (atual != cabeca) {
        prox = atual->prox;
        free (atual);
        atual = prox;
    }

    cabeca->ant = cabeca;     // último
    cabeca->prox = cabeca;     // primeiro
}

void adicionarPrimeiro_dequeDim ( DequeDim *deque, const Registro registro )
{
    Celula *novo = (Celula*) malloc (sizeof (Celula));
    Celula *cabeca = deque->cabeca;
    Celula *primeiro = cabeca->prox;

    novo->reg = registro;
    novo->ant = cabeca;
    novo->prox = primeiro;

    primeiro->ant = novo;
    cabeca->prox = novo;
}

void adicionarUltimo_dequeDim ( DequeDim *deque, const Registro registro )
{
    Celula *novo = (Celula*) malloc (sizeof (Celula));
    Celula *cabeca = deque->cabeca;
    Celula *ultimo = cabeca->ant;

    novo->reg = registro;
    novo->prox = cabeca;
    novo->ant = ultimo;

    ultimo->prox = novo;
    cabeca->ant = novo;
}

int tamanho_dequeDim ( const DequeDim deque )
{
    unsigned cont = 0;
    Celula *prox = deque.cabeca->prox;
    while (prox != deque.cabeca) {
        cont++;
        prox = prox->prox;
    }
    return cont;
}

void mostrar_dequeDim ( const DequeDim deque )
{
    Celula *prox = deque.cabeca->prox;
    printf (" Pilha [ ");
    while (prox != deque.cabeca) {
        printf ("%d ", prox->reg.chave);
        prox = prox->prox;
    }
    printf ("] Tamanho: %u\n", tamanho_dequeDim (deque));
}

bool deletarPrimeiro_dequeDim ( DequeDim *deque, Registro *registro )
{
    Celula *cabeca = deque->cabeca;
    Celula *primeiro = cabeca->prox;
    Celula *segundo = primeiro->prox;

    if (primeiro == cabeca) return false;

    *registro = primeiro->reg;
    cabeca->prox = segundo;
    segundo->ant = cabeca;
    free (primeiro);

    return true;
}

bool deletarUltimo_dequeDim ( DequeDim *deque, Registro *registro )
{
    Celula *cabeca = deque->cabeca;
    Celula *ultimo = cabeca->ant;
    Celula *penultimo = ultimo->ant;

    if (ultimo == cabeca) return false;

    *registro = ultimo->reg;
    cabeca->ant = penultimo;
    penultimo->prox = cabeca;
    free (ultimo);

    return true;
}

