/*
 * File: 01_Lista_Linear/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include "lista_linear.h"

int main ()
{
    // inicializar lista
    ListaLinear lista;
    inicializar_llin (&lista);
    printf ("Tamanho máximo: %d elementos\n", MAX);

    // adicionar elementos à lista
    Chave chaves[MAX+1] = {5, 3, 0, 9, 8};
    for (unsigned i=0; i<MAX+1; i++) {
        Registro registro = {chaves[i]};
        printf ("Adicionando: %d\n", registro.chave);
        bool adicionado = adicionar_llin (&lista, &registro);
        if (!adicionado)
            printf ("Erro: Lista cheia!\n");
    }

    // mostrar lista
    mostrar_llin (&lista);

    // procurar elemento na lista
    // remover elemento da lista

    return 0;
}
