/*
 * File: Lista_Ligada_Dinamica/lista_ligada_dinamica.c
 * @author: Alejandro Druetta
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "lista_ligada_dinamica.h"

void procuraPreProx (Chave, Celula**, Celula**);

void inicializar_lDim (LDim *lista)
{
    lista->ini = NULL;
}

unsigned tamanho_lDim (const LDim *lista)
{
    Celula *cel = lista->ini;
    unsigned cont = 0;
    while (cel != NULL) {
        cont++;
        cel = cel->prox;
    }
    return cont;
}

void mostrar_lDim (const LDim *lista)
{
    Celula *cel = lista->ini;
    unsigned cont = 0;
    printf ("Lista [ ");
    while (cel != NULL) {
        printf ("%d ", cel->reg.chave);
        cont++;
        cel = cel->prox;
    }
    printf ("] Tamanho: %u\n", cont);
}

Registro* buscaSeq_lDim (const LDim *lista, Chave chave)
{
    Celula *cel = lista->ini;
    while (cel != NULL) {
        if (cel->reg.chave == chave) return &(cel->reg);
        cel = cel->prox;
    }
    return NULL;
}

Registro* buscaOrd_lDim (const LDim *lista, Chave chave)
{
    Celula *cel = lista->ini;
    while (cel != NULL && cel->reg.chave < chave)
        cel = cel->prox;
    if (cel->reg.chave == chave) return &(cel->reg);
    return NULL;
}

bool inserir_lDim (LDim *lista, Registro reg)
{
    Celula *prev = NULL;
    Celula *prox = lista->ini;

    procuraPreProx (reg.chave, &prev, &prox);

    if (prox != NULL && prox->reg.chave == reg.chave) return false;

    Celula *nova = (Celula*) malloc (sizeof (Celula));
    nova->reg = reg;
    nova->prox = prox;

    if (prev == NULL) lista->ini = nova;
    else prev->prox = nova;

    return true;
}

bool deletar_lDim (LDim *lista, Chave chave)
{
    Celula *prev = NULL;
    Celula *prox = lista->ini;

    procuraPreProx (chave, &prev, &prox);

    if (prox == NULL || prox->reg.chave > chave) return false;
    if (prev != NULL)
        prev->prox = prox->prox;
    else
        lista->ini = prox->prox;

    free (prox);

    return true;
}

void procuraPreProx (Chave chave, Celula **prev, Celula **prox) {
    while (*prox != NULL && (*prox)->reg.chave < chave) {
        *prev = *prox;
        *prox = (*prox)->prox;
    }
}

