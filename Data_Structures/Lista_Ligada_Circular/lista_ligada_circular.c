/*
 * File: Lista_Ligada_Circular/lista_ligada_circular.c
 * @author: Alejandro Druetta
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "lista_ligada_circular.h"

void procuraPreProx (Celula*, Chave, Celula**, Celula**);

void inicializar_lCir (LCir *lista)
{
    lista->cabeca = (Celula*) malloc (sizeof (Celula));
    lista->cabeca->prox = lista->cabeca;
}

void reinicializar_lCir (LCir *lista)
{
    Celula *cel = lista->cabeca;
    Celula *pre = lista->cabeca;

    while (cel != lista->cabeca) {
        pre = cel;
        cel = cel->prox;
        free (pre);
    }

    lista->cabeca->prox = lista->cabeca;
}

unsigned tamanho_lCir (const LCir *lista)
{
    Celula *cel = lista->cabeca->prox;
    unsigned cont = 0;
    while (cel != lista->cabeca) {
        cont++;
        cel = cel->prox;
    }
    return cont;
}

void mostrar_lCir (const LCir *lista)
{
    Celula *cel = lista->cabeca->prox;
    unsigned cont = 0;
    printf ("Lista [ ");
    while (cel != lista->cabeca) {
        printf ("%d ", cel->reg.chave);
        cont++;
        cel = cel->prox;
    }
    printf ("] Tamanho: %u\n", cont);
}

Registro* buscaSeq_lCir (const LCir *lista, Chave chave)
{
    Celula *cel = lista->cabeca->prox;
    while (cel != lista->cabeca) {
        if (cel->reg.chave == chave) return &(cel->reg);
        cel = cel->prox;
    }
    return NULL;
}

Registro* buscaOrd_lCir (const LCir *lista, Chave chave)
{
    Celula *cel = lista->cabeca->prox;
    while (cel != lista->cabeca && cel->reg.chave < chave)
        cel = cel->prox;
    if (cel->reg.chave == chave) return &(cel->reg);
    return NULL;
}

bool inserir_lCir (LCir *lista, Registro reg)
{
    Celula *cabeca = lista->cabeca;
    Celula *prev = cabeca;
    Celula *prox = cabeca->prox;

    procuraPreProx (cabeca, reg.chave, &prev, &prox);

    if (prox != cabeca && prox->reg.chave == reg.chave) return false;

    Celula *nova = (Celula*) malloc (sizeof (Celula));
    nova->reg = reg;
    nova->prox = prox;

    if (prev == cabeca) cabeca->prox = nova;
    else prev->prox = nova;

    return true;
}

bool deletar_lCir (LCir *lista, Chave chave)
{
    Celula *cabeca = lista->cabeca;
    Celula *prev = cabeca;
    Celula *prox = cabeca->prox;

    procuraPreProx (cabeca, chave, &prev, &prox);

    if (prox == cabeca || prox->reg.chave > chave) return false;
    prev->prox = prox->prox;

    free (prox);

    return true;
}

void procuraPreProx (Celula* cabeca, Chave chave, Celula **prev, Celula **prox) {
    while (*prox != cabeca && (*prox)->reg.chave < chave) {
        *prev = *prox;
        *prox = (*prox)->prox;
    }
}

