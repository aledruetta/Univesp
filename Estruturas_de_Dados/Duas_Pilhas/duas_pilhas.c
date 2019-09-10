/*
 * File: Duas_Pilhas/duas_pilhas.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include "duas_pilhas.h"

void inicializar_pilhasDim ( DPilhas *pilhas )
{
    pilhas->inicio = 0;
    pilhas->tamanho = 0;
}

void reinicializar_pilhasDim ( DPilhas *pilhas )
{
    inicializar_pilhasDim ( pilhas );
}

bool inserir_pilhasDim ( DPilhas *pilhas, const Registro registro )
{
    if ( pilhas->tamanho >= MAX ) return false;
    unsigned pos = ( pilhas->inicio + pilhas->tamanho ) % MAX;
    pilhas->reg[pos] = registro;
    pilhas->tamanho++;

    return true;
}

unsigned tamanho_pilhasDim ( const DPilhas *pilhas )
{
    return pilhas->tamanho;
}

void mostrar_pilhasDim ( const DPilhas *pilhas )
{
    printf (" Fila [ ");
    unsigned pos = pilhas->inicio;
    unsigned tamanho = pilhas->tamanho;
    while ( tamanho > 0 ) {
        printf ("%d ", pilhas->reg[pos].chave);
        tamanho--;
        pos = ( pos + 1 ) % MAX;
    }
    printf ("] Tamanho: %u\n", tamanho_pilhasDim (pilhas));
}

bool excluir_pilhasDim ( DPilhas *pilhas, Registro *registro )
{
    if ( pilhas->tamanho <= 0 ) return false;
    *registro = pilhas->reg[pilhas->inicio];
    pilhas->inicio = ( pilhas->inicio + 1 ) % MAX;
    pilhas->tamanho--;

    return true;
}

