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
    inicializar_listaLinear (&lista);
    printf ("Tamanho lista: %d\n", lista.tamanho);

    // adicionar elementos à lista
    Chave chaves[MAX] = {5, 3, 0, 9, 8};
    for (unsigned i=0; i<MAX; i++) {
        Registro registro = {chaves[i]};
        bool adicionado = adicionar_listaLinear (&lista, &registro);
        if (adicionado)
            printf ("Chave elemento %u: %d\n", i, lista.regs[i].chave);
        else
            printf ("Erro: Lista cheia!");
    }
    printf ("Tamanho lista: %d\n", lista.tamanho);

    // mostrar lista
    // procurar elemento na lista
    // remover elemento da lista

    return 0;
}
