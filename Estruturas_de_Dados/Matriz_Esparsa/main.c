/*
 * File: Matriz_Esparsa/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include "matriz_esparsa.h"

int main ()
{
    srand (time (NULL));
    unsigned ntest = 0,
             lin = 3,
             col = 3;

    printf ("\n Teste %u: inicializar uma matriz vacia.\n", ntest++);
    MatrizE matriz;
    inicializar ( &matriz, lin, col );

    printf ("\n Teste %u: atribuir valores.\n", ntest++);
    atribuir ( &matriz, 0, 2, 0.2 );
    atribuir ( &matriz, 0, 1, 0.1 );
    atribuir ( &matriz, 0, 0, 0.0 );
    atribuir ( &matriz, 2, 1, 2.1 );
    atribuir ( &matriz, 1, 2, 1.2 );
    mostrar ( &matriz );

    printf ("\n Teste %u: acessar valores.\n", ntest++);
    for ( unsigned i=0; i<lin; i++ )
        for ( unsigned j=0; j<col; j++ )
            printf (" [%u, %u] %.1f\n", i, j, acessar ( &matriz, i, j ));

    return 0;
}

