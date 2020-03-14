/*
 * File: Arvore_AVL/arvore_avl.cpp
 * @author: Alejandro Druetta
 */

#include <iostream>
#include "arvore_avl.hpp"
using namespace std;

int comparar ( No, No);

No* inicializar ()
{
    return NULL;
}

// void reinicializar ( ArvoreBB *arvore )
// {
// }

No* adicionar ( No *raiz, No *novo )
{
    if ( raiz == NULL ) return novo;
    if ( novo->chave < raiz->chave )
        raiz->esq = adicionar ( raiz->esq, novo );
    else
        raiz->dir = adicionar ( raiz->dir, novo );

    return raiz;
}

unsigned tamanho ( const No *raiz )
{
    if ( raiz == NULL ) return 0;
    return (tamanho ( raiz->esq ) + tamanho ( raiz->dir ) + 1);
}

void mostrar ( const No *raiz )
{
    if ( raiz != NULL ) {
        printf ("%d", raiz->chave);
        printf ("(");
        mostrar ( raiz->esq );
        mostrar ( raiz->dir );
        printf (")");
    }
}

No* procurar ( No *raiz, Chave chave )
{
    if ( raiz == NULL ) return NULL;
    if ( raiz->chave == chave ) return raiz;

    if ( raiz->chave > chave )
        return procurar ( raiz->esq, chave );
    return procurar ( raiz->dir, chave );
}

// No* remover ( No *raiz, Chave chave )
// {
//     No* pai, no, p, q;
//     no = procurar ( raiz, chave );
// }

