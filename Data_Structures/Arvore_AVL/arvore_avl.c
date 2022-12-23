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

No* inserirNo ( No *raiz, Chave chave )
{
    if ( raiz == NULL ) return criarNo ( chave );
    if ( chave < raiz->chave ) {
        raiz->esq = inserirNo ( raiz->esq, chave );
        if ( altura ( raiz->esq ) - altura ( raiz->dir ) == 2 ) {
            if ( raiz->esq->chave > chave ) raiz = rotarDir ( raiz );
            else raiz = rotarEsqDir ( raiz );
        }
    }
    else if ( chave > raiz->chave ) {
        raiz->dir = inserirNo ( raiz->dir, chave );
        if ( altura ( raiz->esq ) - altura ( raiz->dir ) == -2 ) {
            if ( raiz->dir->chave < chave ) raiz = rotarEsq ( raiz );
            else raiz = rotarDirEsq ( raiz );
        }
    }

    if ( chave != raiz->chave )
        raiz->altura = max ( altura ( raiz->esq ), altura ( raiz->dir )) + 1;
    return raiz;
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

No* rotarEsqDir ( No *raiz )
{
    raiz->esq = rotarEsq ( raiz->esq );
    return rotarDir ( raiz );
}

No* rotarDirEsq ( No *raiz )
{
    raiz->dir = rotarDir ( raiz->dir );
    return rotarEsq ( raiz );
}

int max ( int h1, int h2 )
{
    if ( h1 > h2) return h1;
    return h2;
}

int altura ( No* raiz )
{
    return ( raiz == NULL ) ? -1 : raiz->altura;
}

void mostrarNo ( const No *raiz )
{
    if ( raiz != NULL ) {
        printf ("%d", raiz->chave);
        printf ("(");
        mostrarNo ( raiz->esq );
        mostrarNo ( raiz->dir );
        printf (")");
    }
}

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

