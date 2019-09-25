#include <stdio.h>
#include "matriz.h"

int main ()
{
    Matriz A;
    iniMat ( &A, 3, 3 );

    printf ( "Formato de A: " );
    forMat ( &A );
    printf ( "\n" );

    printf ( "Representação de A:\n" );
    impMat ( &A );

    return 0;
}

