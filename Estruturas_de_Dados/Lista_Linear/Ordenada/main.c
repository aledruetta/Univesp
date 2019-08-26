/*
 * File: Lista_Linear/Ordenada/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include "lista_linear_ordenada.h"

void gerar_lista (LOrd*, unsigned tamanho);

int main ()
{
    unsigned ntest = 1;
    srand (time (NULL));

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma lista vacia.\n", ntest++);
    LOrd lista;
    inicializar_lOrd (&lista);

    // mostrar
    printf ("\n Teste %u: mostrar lista.\n", ntest++);
    mostrar_lOrd (&lista);

    // Adicionar
    printf ("\n Teste %u: adicionar 5 elementos à lista.\n", ntest++);
    printf (" Tamanho máximo: %d elementos.\n", MAX);
    gerar_lista (&lista, 5);
    mostrar_lOrd (&lista);

    printf ("\n Teste %u: adicionar mais 8 elementos à lista para estorar o limite.\n", ntest++);
    gerar_lista (&lista, 8);
    mostrar_lOrd (&lista);

    // procurar existente
    Chave chave = lista.regs[3].chave;
    printf ("\n Teste %u: procurar chave %d na lista.\n", ntest++, chave);
    int indice = procurar_lOrd (&lista, chave);
    if (indice >= 0)
        printf (" O elemento com chave %d está na posição %d.\n", chave, indice);
    else
        printf (" Erro: O elemento com chave %d não existe!\n", chave);

    // procurar aleatório
    chave = rand () % 100 - 50;
    printf ("\n Teste %u: procurar chave %d na lista.\n", ntest++, chave);
    indice = procurar_lOrd (&lista, chave);
    if (indice >= 0)
        printf (" O elemento com chave %d está na posição %d.\n", chave, indice);
    else
        printf (" Erro: O elemento com chave %d não existe!\n", chave);

    // remover existente
    chave = lista.regs[6].chave;
    printf ("\n Teste %u: deletar chave %d da lista.\n", ntest++, chave);
    bool deletado = deletar_lOrd (&lista, chave);
    if (!deletado)
        printf (" Erro: O elemento com chave %d não existe!\n", chave);

    // remover aleatório
    chave = rand () % 100 - 50;
    printf ("\n Teste %u: deletar primeira ocorrência elemento chave %d da lista.\n", ntest++, chave);
    deletado = deletar_lOrd (&lista, chave);
    if (!deletado)
        printf (" Erro: O elemento com chave %d não existe!\n", chave);

    mostrar_lOrd (&lista);

    return 0;
}

void gerar_lista (LOrd* lista, unsigned tamanho)
{
    for (unsigned i=0; i<tamanho; i++) {
        Chave chave = rand () % 100 - 50;
        Registro registro = {chave};
        printf (" Adicionando chave %d ", chave);
        bool adicionado = adicionar_lOrd (lista, registro);
        if (!adicionado)
            printf (" Erro: lista cheia ou item repetido!\n");
        else
            printf ("\n");
    }
}
