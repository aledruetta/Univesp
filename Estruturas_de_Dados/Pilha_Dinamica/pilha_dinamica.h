/*
 * File: Pilha_Dinamica/pilha_dinamica.h
 * @author: Alejandro Druetta
 */

#ifndef PILHA_DINAMICA_H
#define PILHA_DINAMICA_H

#include <stdbool.h>

typedef int Chave;

typedef struct
{
    Chave chave;
    // outros membros
} Registro;

typedef struct aux
{
    Registro reg;
    struct aux *prox;
} Celula;

typedef struct
{
    Celula *topo;
} PilhaDim;

void inicializar_pilhaDim ( PilhaDim* );
void mostrar_pilhaDim ( const PilhaDim );
int tamanho_pilhaDim ( const PilhaDim );
void adicionar_pilhaDim ( PilhaDim*, const Registro );
bool deletar_pilhaDim ( PilhaDim*, Registro* );
void reinicializar_pilhaDim ( PilhaDim* );

#endif /* PILHA_DINAMICA_H */
