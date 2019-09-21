/*
 * File: Arvore_AVL/arvore_avl.h
 * @author: Alejandro Druetta
 */

#ifndef ARVORE_AVL_H
#define ARVORE_AVL_H

#include <stdbool.h>

typedef int Chave;

typedef struct aux
{
    Chave chave;
    // outros campos
    struct aux *esq;
    struct aux *dir;
    int altura;
} No;

No* inicializar ();
No* criarNo ( Chave chave );
// void mostrar ( const No *raiz );
// unsigned tamanho ( const No *raiz );
// No* adicionar ( No *raiz, No *novo );
// No* procurar ( No *raiz, Chave chave );
// No* remover ( No *raiz, Chave chave );

#endif /* ARVORE_AVL_H */
