#include <stdio.h>
#include "matriz.h"

int main ()
{
    Matriz A;
    iniMat ( &A, 3, 3 );

    printf ( "Formato de A: " );

    forMat ( &A );
    printf ( "\n\n" );

    impMat ( &A );
    printf ( "\n" );

    return 0;
}

