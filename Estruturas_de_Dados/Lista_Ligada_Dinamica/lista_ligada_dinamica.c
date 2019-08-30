/*
 * File: Lista_Ligada_Dinamica/lista_ligada_dinamica.c
 * @author: Alejandro Druetta
 */

#include <stdlib.h>
#include <stdio.h>
#include "lista_ligada_dinamica.h"

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

