/*
 * File: Fila_Dinamica/fila_dinamica.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include "fila_dinamica.h"

void inicializar_filaDim ( FilaDim *fila )
{
    fila->inicio = NULL;
    fila->fim = NULL;
}

void reinicializar_filaDim ( FilaDim *fila )
{
    Celula *celula = fila->inicio;
    while ( celula != NULL ) {
        Celula *prox = celula->prox;
        free ( celula );
        celula = prox;
    }
    inicializar_filaDim ( fila );
}

bool inserir_filaDim ( FilaDim *fila, const Registro registro )
{
    Celula *celula = (Celula*) malloc (sizeof (Celula));
    celula->reg = registro;
    celula->prox = NULL;

    if ( fila->inicio == NULL )
        fila->inicio = celula;
    else
        fila->fim->prox = celula;
    fila->fim = celula;

    return true;
}

unsigned tamanho_filaDim ( const FilaDim *fila )
{
    unsigned cont = 0;
    Celula *celula = fila->inicio;
    while ( celula != NULL ) {
        cont++;
        celula = celula->prox;
    }

    return cont;
}

void mostrar_filaDim ( const FilaDim *fila )
{
    printf (" Fila [ ");
    Celula *celula = fila->inicio;
    while ( celula != NULL ) {
        printf ("%d ", celula->reg.chave);
        celula = celula->prox;
    }
    printf ("] Tamanho: %u\n", tamanho_filaDim (fila));
}

bool excluir_filaDim ( FilaDim *fila, Registro *registro )
{
    if ( fila->inicio == NULL ) return false;
    *registro = fila->inicio->reg;
    fila->inicio = fila->inicio->prox;

    return true;
}

