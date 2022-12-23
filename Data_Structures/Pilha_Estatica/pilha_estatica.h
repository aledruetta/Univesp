/*
 * File: Pilha_Estatica/pilha_estatica.h
 * @author: Alejandro Druetta
 */

#ifndef PILHA_ESTATICA_H
#define PILHA_ESTATICA_H

#include <stdbool.h>

#define MAX 10

typedef int Chave;

typedef struct
{
    Chave chave;
    // outros membros
} Registro;

typedef struct
{
    Registro reg[MAX];
    int topo;
} PilhaEst;

void inicializar_pilhaEst ( PilhaEst* );
void mostrar_pilhaEst ( const PilhaEst* );
int tamanho_pilhaEst ( const PilhaEst* );
bool adicionar_pilhaEst ( PilhaEst*, const Registro );
Registro* deletar_pilhaEst ( PilhaEst* );

#endif /* PILHA_ESTATICA_H */
