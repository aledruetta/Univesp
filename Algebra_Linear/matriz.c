#include <stdlib.h>
#include <stdio.h>
#include "matriz.h"

void iniMat ( Matriz *mat, unsigned m, unsigned n )
{
    mat->m = m;
    mat->n = n;
    mat->elem = ( double ** ) malloc ( m * sizeof ( double * ));
    for ( unsigned i=0; i<n; i++ ) {
        mat->elem[i] = ( double * ) malloc ( n * sizeof ( double ));
    }
}

void forMat ( const Matriz *mat )
{
    printf ( "[%u, %u]", mat->m, mat->n );
}

void impMat ( const Matriz *mat )
{
    printf ( "[" );
    for ( unsigned i=0; i<mat->m; i++ ) {
        printf ( "[ " );
        for ( unsigned j=0; j<mat->n; j++ ) {
            printf ( "%f ", mat->elem[i][j] );
        }
        printf ( "]" );
        if ( i < mat->m - 1 ) printf ( "\n " );
    }
    printf ( "]\n" );
}

