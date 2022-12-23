/*
 * File: Deque_Dinamico/deque_dinamico.h
 * @author: Alejandro Druetta
 */

#ifndef DEQUE_DINAMICO_H
#define DEQUE_DINAMICO_H

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
    struct aux *ant;
    struct aux *prox;
} Celula;

typedef struct
{
    Celula *cabeca;
} DequeDim;

void inicializar_dequeDim ( DequeDim* );
void mostrar_dequeDim ( const DequeDim );
int  tamanho_dequeDim ( const DequeDim );
void adicionarPrimeiro_dequeDim ( DequeDim*, const Registro );
void adicionarUltimo_dequeDim ( DequeDim*, const Registro );
bool deletarPrimeiro_dequeDim ( DequeDim*, Registro* );
bool deletarUltimo_dequeDim ( DequeDim*, Registro* );
void reinicializar_dequeDim ( DequeDim* );

#endif /* DEQUE_DINAMICO_H */
