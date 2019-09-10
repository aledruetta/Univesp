/*
 * File: Duas_Pilhas/duas_pilhas.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include "duas_pilhas.h"

bool inserir ( DPilhas*, const Registro, unsigned );
bool excluir ( DPilhas*, Registro*, unsigned );
void mostrar ( const DPilhas*, unsigned );

void inicializar ( DPilhas *pilhas )
{
    pilhas->topo1 = -1;
    pilhas->topo2 = MAX;
}

void reinicializar ( DPilhas *pilhas )
{
    inicializar ( pilhas );
}

void mostrar ( const DPilhas *pilhas, unsigned pilha )
{
    printf (" Pilha %s [ ", ( pilha == 1 ) ? "Esquerda" : "Direita ");
    unsigned pos = ( pilha == 1 ) ? 0 : MAX - 1;
    unsigned tamanho =  ( pilha == 1 ) ? tamanho_esquerda ( pilhas )
                                       : tamanho_direita ( pilhas );
    unsigned cont = tamanho;
    while ( cont > 0 ) {
        printf ("%d ", pilhas->reg[pos].chave);
        cont--;
        ( pilha == 1 ) ? pos++ : pos--;
    }
    printf ("] Tamanho: %u\n", tamanho);
}

bool inserir ( DPilhas *pilhas, const Registro registro, unsigned pilha )
{
    if ( pilhas->topo2 == pilhas->topo1 + 1 ) return false;
    ( pilha == 1 ) ? pilhas->topo1++ : pilhas->topo2--;
    int topo = ( pilha == 1 ) ? pilhas->topo1 : pilhas->topo2;
    pilhas->reg[ topo ] = registro;

    return true;
}

bool excluir ( DPilhas *pilhas, Registro *registro, unsigned pilha )
{
    int topo = ( pilha == 1 ) ? pilhas->topo1 : pilhas-> topo2;
    if ( topo == -1 || topo == MAX ) return false;
    *registro = pilhas->reg[ topo ];
    ( pilha == 1 ) ? pilhas->topo1-- : pilhas->topo2++;
    return true;
}

bool inserir_esquerda ( DPilhas *pilhas, const Registro registro )
{
    return inserir ( pilhas, registro, 1);
}

bool inserir_direita ( DPilhas *pilhas, const Registro registro )
{
    return inserir ( pilhas, registro, 2);
}

unsigned tamanho_esquerda ( const DPilhas *pilhas )
{
    return pilhas->topo1 + 1;
}

unsigned tamanho_direita ( const DPilhas *pilhas )
{
    return MAX - pilhas->topo2;
}

void mostrar_esquerda ( const DPilhas *pilhas )
{
    mostrar ( pilhas, 1 );
}

void mostrar_direita ( const DPilhas *pilhas )
{
    mostrar ( pilhas, 2 );
}

bool excluir_esquerda ( DPilhas *pilhas, Registro *registro )
{
    return excluir ( pilhas, registro, 1 );
}

bool excluir_direita ( DPilhas *pilhas, Registro *registro )
{
    return excluir ( pilhas, registro, 2 );
}

