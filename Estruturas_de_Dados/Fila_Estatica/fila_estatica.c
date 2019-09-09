/*
 * File: Fila_Estatica/fila_estatica.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include "fila_estatica.h"

void inicializar_filaEst ( FilaEst *fila )
{
    fila->inicio = 0;
    fila->tamanho = 0;
}

void reinicializar_filaEst ( FilaEst *fila )
{
    inicializar_filaEst ( fila );
}

bool inserir_filaEst ( FilaEst *fila, const Registro registro )
{
    if ( fila->tamanho >= MAX ) return false;
    unsigned pos = ( fila->inicio + fila->tamanho ) % MAX;
    fila->reg[pos] = registro;
    fila->tamanho++;

    return true;
}

unsigned tamanho_filaEst ( const FilaEst *fila )
{
    return fila->tamanho;
}

void mostrar_filaEst ( const FilaEst *fila )
{
    printf (" Fila [ ");
    unsigned pos = fila->inicio;
    unsigned tamanho = fila->tamanho;
    while ( tamanho > 0 ) {
        printf ("%d ", fila->reg[pos].chave);
        tamanho--;
        pos = ( pos + 1 ) % MAX;
    }
    printf ("] Tamanho: %u\n", tamanho_filaEst (fila));
}

bool excluir_filaEst ( FilaEst *fila, Registro **registro )
{
    if ( fila->tamanho <= 0 ) return false;
    *registro = &fila->reg[fila->inicio];
    fila->inicio = ( fila->inicio + 1 ) % MAX;
    fila->tamanho--;

    return true;
}

