/*
 * File: Lista_Ligada_Circular/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

#include "lista_ligada_circular.h"

void povoar_lCir (LCir*, unsigned);

int main ()
{
    srand (time (NULL));

    LCir lista;
    inicializar_lCir (&lista);
    mostrar_lCir (&lista);

    povoar_lCir (&lista, 10);
    mostrar_lCir (&lista);

    Chave chaves[] = {-99, 0, 99, 88};
    Registro reg = {chaves[0]};
    inserir_lCir (&lista, reg);
    reg.chave = chaves[1];
    inserir_lCir (&lista, reg);
    reg.chave = chaves[2];
    inserir_lCir (&lista, reg);
    mostrar_lCir (&lista);

    Registro *preg = buscaSeq_lCir (&lista, chaves[0]);
    if (preg)
        printf ("Chave: %d\n", preg->chave);

    preg = buscaSeq_lCir (&lista, chaves[1]);
    if (preg)
        printf ("Chave: %d\n", preg->chave);

    preg = buscaSeq_lCir (&lista, chaves[2]);
    if (preg)
        printf ("Chave: %d\n", preg->chave);

    preg = buscaSeq_lCir (&lista, chaves[3]);
    if (preg)
        printf ("Chave: %d\n", preg->chave);
    else
        printf ("Chave %d não existe!\n", chaves[3]);

    deletar_lCir (&lista, chaves[0]);
    deletar_lCir (&lista, chaves[1]);
    deletar_lCir (&lista, chaves[2]);
    deletar_lCir (&lista, chaves[3]);
    mostrar_lCir (&lista);

    reinicializar_lCir (&lista);
    mostrar_lCir (&lista);

    return 0;
}

void povoar_lCir (LCir *lista, unsigned tamanho)
{
    for (unsigned i=0; i<tamanho; i++) {
        Chave chave = rand () % 100 - 50;
        Registro reg = {chave};
        bool res = inserir_lCir (lista, reg);
        if (!res)
            printf ("Erro chave: %d\n", chave);
    }
}

