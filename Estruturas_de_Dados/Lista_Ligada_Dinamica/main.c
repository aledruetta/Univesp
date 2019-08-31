/*
 * File: Lista_Ligada_Dinamica/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include "lista_ligada_dinamica.h"

void povoar_lDim (LDim*, unsigned);

int main ()
{
    srand (time (NULL));
    LDim lista;
    inicializar_lDim (&lista);
    mostrar_lDim (&lista);
    povoar_lDim (&lista, 10);
    mostrar_lDim (&lista);

    return 0;
}

void povoar_lDim (LDim *lista, unsigned tamanho)
{
    for (unsigned i=0; i<tamanho; i++) {
        Chave chave = rand () % 100 - 50;
        Registro reg = {chave};
        bool res = inserir_lDim (lista, reg);
        if (!res)
            printf ("Erro chave: %d\n", chave);
    }
}

