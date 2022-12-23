/*
 * File: Arvore_AVL/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include "arvore_avl.h"

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
    Chave chave[] = {45,27,90,75,60,76,87,78,77,79,100};
    unsigned num = sizeof ( chave ) / sizeof ( Chave );
    for (unsigned i=0; i<num; i++) {
        raiz = inserirNo ( raiz, chave[i] );
        printf (" Adicionando chave: %d\n", chave[i]);
    }

    // Mostrar
    printf ("\n Teste %u: mostrarNo elementos.\n", ntest++);
    mostrarNo ( raiz );
    printf ("\n");

    // Tamanho
    // printf ("\n Teste %u: número de elementos.\n", ntest++);
    // printf ("Nós: %u\n", tamanho ( raiz ));

    // Procurar
    // printf ("\n Teste %u: procurar por cada um dos elementos.\n", ntest++);
    // No *res = {NULL};
    // unsigned pos = 0;
    // for (pos=0; pos<num; pos++) {
    //     res = procurar ( raiz, chave[pos] );
    //     if ( res != NULL )
    //         printf (" Chave achada: %d\n", res->chave);
    //     else
    //         printf (" Chave inexistente: %d\n", chave[pos]);
    // }

    // printf ("\n Teste %u: procurar por elemento aleatório.\n", ntest++);
    // pos = rand () % 100;
    // res = procurar ( raiz, pos );
    // if ( res != NULL )
    //     printf (" Chave achada: %d\n", res->chave);
    // else
    //     printf (" Chave inexistente: %d\n", pos);

    // printf ("\n Teste %u: remover elemento.\n", ntest++);
    // res = remover ( raiz, chave[3] );

    return 0;
}

