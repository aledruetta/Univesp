/*
 * File: Matriz_Esparsa/matriz_esparsa.c
 * @author: Alejandro Druetta
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "matriz_esparsa.h"

void inicializar ( MatrizE *matriz, unsigned lin, unsigned col )
{
    matriz->lin = lin;
    matriz->col = col;
    matriz->nos = ( No** ) malloc ( lin * sizeof ( No* ));
    for (unsigned i=0; i<lin; i++) matriz->nos[i] = NULL;
}

void mostrar (const MatrizE *matriz)
{
    printf ("[");
    for (unsigned i=0; i<matriz->lin; i++) {
        No *no = matriz->nos[i];
        unsigned col = 0;
        ( i > 0 ) ? printf ("  ") : printf (" ");
        while ( col < matriz->col ) {
            if ( no != NULL && no->col == col ) {
                printf ("%.2f ", no->valor);
                no = no->prox;
            }
            else {
                printf ("NULL ");
            }
            col++;
        }
        ( i < matriz->lin - 1 ) ? printf ("\n") : printf ("]\n");
    }
}

bool atribuir ( MatrizE *matriz, unsigned lin, unsigned col, double valor )
{
    if ( lin > matriz->lin - 1 || col > matriz->col - 1 ) return false;
    No *pre = NULL;
    No *no = matriz->nos[lin];
    while ( no != NULL && no->col < col ) {
        pre = no;
        no = pre->prox;
    }
    if ( no != NULL && no->col == col ) {
        if ( valor == 0.0 ) {
            if ( pre == NULL ) matriz->nos[lin] = no->prox;
            else pre->prox = no->prox;
            free ( no );
        }
        else no->valor = valor;
    }
    else if ( valor != 0.0 ) {
        No *novo = ( No* ) malloc ( sizeof ( No ));
        novo->col = col;
        novo->valor = valor;
        novo->prox = no;
        if ( pre == NULL ) matriz->nos[lin] = novo;
        else pre->prox = novo;
    }

    return true;
}

double acessar (MatrizE *matriz, unsigned lin, unsigned col )
{
    if ( lin > matriz->lin - 1 || col > matriz->col - 1 ) return false;
    No *no = matriz->nos[lin];
    while ( no != NULL && no->col < col ) no = no->prox;
    if ( no == NULL || no->col > col ) return 0.0;
    return no->valor;
}

