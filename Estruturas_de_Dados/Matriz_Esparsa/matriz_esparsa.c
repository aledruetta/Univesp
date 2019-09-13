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
    unsigned pos = 0;
    No **nop = &matriz->nos[lin];
    No **pre = NULL;
    while ( *nop != NULL && (*nop)->col < col ) {
        pre = nop;
        *nop = (*nop)->prox;
        pos++;
    }
    if ( *nop == NULL ) *nop = ( No* ) malloc ( sizeof ( No ));
    if ( pre != NULL ) {
        (*nop)->prox = (*pre)->prox;
        (*pre)->prox = *nop;
    }
    (*nop)->valor = valor;
    (*nop)->col = col;

    return true;
}

// bool acessar (MatrizE *matriz, Chave chave)
// {
// }

