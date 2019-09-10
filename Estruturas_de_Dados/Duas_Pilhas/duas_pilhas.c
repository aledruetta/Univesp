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

void inicializar_dPilhas ( DPilhas *pilhas )
{
    pilhas->topo1 = -1;
    pilhas->topo2 = MAX;
}

void reinicializar_dPilhas ( DPilhas *pilhas )
{
    inicializar_dPilhas ( pilhas );
}

bool inserir1_dPilhas ( DPilhas *pilhas, const Registro registro )
{
    return inserir ( pilhas, registro, 1);
}

bool inserir2_dPilhas ( DPilhas *pilhas, const Registro registro )
{
    return inserir ( pilhas, registro, 2);
}

bool inserir ( DPilhas *pilhas, const Registro registro, unsigned pilha )
{
    if ( pilhas->topo2 == pilhas->topo1 + 1 ) return false;
    ( pilha == 1 ) ? pilhas->topo1++ : pilhas->topo2--;
    int topo = ( pilha == 1 ) ? pilhas->topo1 : pilhas->topo2;
    pilhas->reg[ topo ] = registro;

    return true;
}

unsigned tamanho1_dPilhas ( const DPilhas *pilhas )
{
    return pilhas->topo1 + 1;
}

unsigned tamanho2_dPilhas ( const DPilhas *pilhas )
{
    return MAX - pilhas->topo2;
}

void mostrar1_dPilhas ( const DPilhas *pilhas )
{
    mostrar ( pilhas, 1 );
}

void mostrar2_dPilhas ( const DPilhas *pilhas )
{
    mostrar ( pilhas, 2 );
}

void mostrar ( const DPilhas *pilhas, unsigned pilha )
{
    printf (" Pilha%d [ ", pilha);
    unsigned pos = ( pilha == 1 ) ? 0 : MAX - 1;
    unsigned tamanho =  ( pilha == 1 ) ? tamanho1_dPilhas ( pilhas )
                                       : tamanho2_dPilhas ( pilhas );
    unsigned cont = tamanho;
    while ( cont > 0 ) {
        printf ("%d ", pilhas->reg[pos].chave);
        cont--;
        ( pilha == 1 ) ? pos++ : pos--;
    }
    printf ("] Tamanho: %u\n", tamanho);
}

bool excluir1_dPilhas ( DPilhas *pilhas, Registro *registro )
{
    return excluir ( pilhas, registro, 1 );
}

bool excluir2_dPilhas ( DPilhas *pilhas, Registro *registro )
{
    return excluir ( pilhas, registro, 2 );
}

bool excluir ( DPilhas *pilhas, Registro *registro, unsigned pilha )
{
    int topo = ( pilha == 1 ) ? pilhas->topo1 : pilhas-> topo2;
    if ( topo == -1 || topo == MAX ) return false;
    *registro = pilhas->reg[ topo ];
    ( pilha == 1 ) ? pilhas->topo1-- : pilhas->topo2++;
    return true;
}

