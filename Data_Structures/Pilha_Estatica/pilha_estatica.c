/*
 * File: Pilha_Estatica/pilha_estatica.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include "pilha_estatica.h"

void inicializar_pilhaEst ( PilhaEst *pilha )
{
    pilha->topo = -1;
}

bool adicionar_pilhaEst ( PilhaEst *pilha, const Registro registro )
{
    if (( pilha->topo + 1 ) >= MAX) return false;
    pilha->topo++;
    pilha->reg[ pilha->topo ] = registro;
    return true;
}

int tamanho_pilhaEst ( const PilhaEst* pilha )
{
    return pilha->topo + 1;
}

 void mostrar_pilhaEst ( const PilhaEst* pilha )
 {
     printf (" Lista [ ");
     for (int i=0; i<pilha->topo+1; i++)
         printf ("%d ", pilha->reg[i].chave);
     printf ("] Tamanho: %u\n", pilha->topo+1);
 }

Registro* deletar_pilhaEst ( PilhaEst* pilha )
{
    if (pilha->topo >= 0) {
        Registro* registro = &pilha->reg[ pilha->topo ];
        pilha->topo--;
        return registro;
    }
    return NULL;
}

