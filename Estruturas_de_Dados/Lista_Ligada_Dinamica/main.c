/*
 * File: Lista_Ligada_Dinamica/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include "lista_ligada_dinamica.h"

int main ()
{
    LDim lista;
    inicializar_lDim (&lista);
    printf ("Tamanho lista: %u\n", tamanho_lDim (&lista));

    Registro reg2 = {7};
    Celula cel2 = {reg2, NULL};

    Registro reg1 = {2};
    Celula cel1 = {reg1, &cel2};

    lista.ini = &cel1;
    printf ("Tamanho lista: %u\n", tamanho_lDim (&lista));

    mostrar_lDim (&lista);

    return 0;
}

