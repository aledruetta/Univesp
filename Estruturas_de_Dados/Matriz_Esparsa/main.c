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
    unsigned ntest = 0;

    printf ("\n Teste %u: inicializar uma matriz vacia.\n", ntest++);
    MatrizE matriz;
    inicializar ( &matriz, 3, 3 );

    printf ("\n Teste %u: atribuir valores.\n", ntest++);
    atribuir ( &matriz, 0, 2, 0.2 );
    atribuir ( &matriz, 0, 1, 0.1 );
    atribuir ( &matriz, 0, 0, 0.0 );
    mostrar ( &matriz );

    return 0;
}

