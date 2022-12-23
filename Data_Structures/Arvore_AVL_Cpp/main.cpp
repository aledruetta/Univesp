/*
 * File: Arvore_AVL/main.cpp
 * @author: Alejandro Druetta
 */

#include <iostream>
#include <time.h>
#include "arvore_avl.hpp"
using namespace std;

No* criarRandNo () {
    No *novo = ( No* ) malloc ( sizeof ( No ));
    novo->chave = rand () % 100;
    novo->esq = NULL;
    novo->dir = NULL;
    return novo;
}

int main ()
{
    srand ( time (NULL) );
    unsigned ntest = 1;

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma arvore vacia.\n", ntest++);
    No* raiz = inicializar ();

    // Inserir
    printf ("\n Teste %u: inserir elementos.\n", ntest++);
    unsigned num = 11;
    Chave chave[] = {45,27,90,75,60,76,87,78,77,79,100};
    for (unsigned i=0; i<num; i++) {
        No *novo = ( No* ) malloc ( sizeof ( No ));
        novo->chave = chave[i];
        // No *novo = criarRandNo ();
        chave[i] = novo->chave;
        raiz = adicionar ( raiz, novo );
        printf (" Adicionando chave: %d\n", novo->chave);
    }

    // Mostrar
    printf ("\n Teste %u: mostrar elementos.\n", ntest++);
    mostrar ( raiz );
    printf ("\n");

    // Tamanho
    printf ("\n Teste %u: número de elementos.\n", ntest++);
    printf ("Nós: %u\n", tamanho ( raiz ));

    // Procurar
    printf ("\n Teste %u: procurar por cada um dos elementos.\n", ntest++);
    No *res = {NULL};
    unsigned pos = 0;
    for (pos=0; pos<num; pos++) {
        res = procurar ( raiz, chave[pos] );
        if ( res != NULL )
            printf (" Chave achada: %d\n", res->chave);
        else
            printf (" Chave inexistente: %d\n", chave[pos]);
    }

    printf ("\n Teste %u: procurar por elemento aleatório.\n", ntest++);
    pos = rand () % 100;
    res = procurar ( raiz, pos );
    if ( res != NULL )
        printf (" Chave achada: %d\n", res->chave);
    else
        printf (" Chave inexistente: %d\n", pos);

    // printf ("\n Teste %u: remover elemento.\n", ntest++);
    // res = remover ( raiz, chave[3] );

    return 0;
}

