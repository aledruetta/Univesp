/*
 * File: Arvore_Binaria_Busca/arvore_binaria_busca.h
 * @author: Alejandro Druetta
 */

#ifndef ARVORE_BINARIA_BUSCA_H
#define ARVORE_BINARIA_BUSCA_H

#include <stdbool.h>

typedef int Chave;

typedef struct aux
{
    Chave chave;
    struct aux *esq;
    struct aux *dir;
} No;

typedef struct
{
    No *raiz;
} ArvoreBB;

No* inicializar ();
void mostrar ( const No *raiz );
unsigned tamanho ( const No *raiz );
No* adicionar ( No *raiz, No *novo );
No* procurar ( No *raiz, Chave chave );
// No* remover ( No *raiz, Chave chave );
// void reinicializar ( ArvoreBB* );

#endif /* ARVORE_BINARIA_BUSCA_H */
