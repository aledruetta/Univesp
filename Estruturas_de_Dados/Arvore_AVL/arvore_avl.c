/*
 * File: Arvore_AVL/arvore_avl.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include "arvore_avl.h"

int max ( int h1, int h2 );
int altura ( No* no );

No* inicializar ()
{
    return NULL;
}

No* criarNo ( Chave chave )
{
    No* novo = ( No* ) malloc ( sizeof ( No ));
    novo->chave = chave;
    novo->altura = 0;
    novo->dir = NULL;
    novo->esq = NULL;

    return novo;
}

No* rotarDir ( No *raiz )
{
    No *aux = raiz->esq;
    raiz->esq = aux->dir;
    aux->dir = raiz;

    raiz->altura = max ( altura ( raiz->dir ),
                         altura ( raiz->esq )) + 1;
    aux->altura = max ( altura ( aux->esq ),
                        raiz->altura ) + 1;

    return aux;
}

No* rotarEsq ( No *raiz )
{
    No *aux = raiz->dir;
    raiz->dir = aux->esq;
    aux->esq = raiz;

    raiz->altura = max ( altura ( raiz->dir ),
                         altura ( raiz->esq )) + 1;
    aux->altura = max ( altura ( aux->dir ),
                        raiz->altura ) + 1;

    return aux;
}

int max ( int h1, int h2 )
{
    if ( h1 > h2) return h1;
    return h2;
}

int altura ( No* no )
{
    return ( no == NULL ) ? -1 : no->altura;
}

// No* adicionar ( No *raiz, No *novo )
// {
//     if ( raiz == NULL ) return novo;
//     if ( novo->chave < raiz->chave )
//         raiz->esq = adicionar ( raiz->esq, novo );
//     else
//         raiz->dir = adicionar ( raiz->dir, novo );
//
//     return raiz;
// }
//
// unsigned tamanho ( const No *raiz )
// {
//     if ( raiz == NULL ) return 0;
//     return (tamanho ( raiz->esq ) + tamanho ( raiz->dir ) + 1);
// }
//
// void mostrar ( const No *raiz )
// {
//     if ( raiz != NULL ) {
//         printf ("%d", raiz->chave);
//         printf ("(");
//         mostrar ( raiz->esq );
//         mostrar ( raiz->dir );
//         printf (")");
//     }
// }
//
// No* procurar ( No *raiz, Chave chave )
// {
//     if ( raiz == NULL ) return NULL;
//     if ( raiz->chave == chave ) return raiz;
//
//     if ( raiz->chave > chave )
//         return procurar ( raiz->esq, chave );
//     return procurar ( raiz->dir, chave );
// }

// No* remover ( No *raiz, Chave chave )
// {
//     No* pai, no, p, q;
//     no = procurar ( raiz, chave );
// }

