/*
 * File: Lista_Linear/Sequencial/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdbool.h>
#include "lista_linear_sequencial.h"

void carregar_lista (LSeq*, const Chave*, unsigned num);

int main ()
{
    unsigned ntest = 1;

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma lista vacia.\n", ntest++);
    LSeq lista;
    inicializar_lseq (&lista);

    // mostrar
    printf ("\n Teste %u: mostrar lista.\n", ntest++);
    mostrar_lseq (&lista);

    // Adicionar
    printf ("\n Teste %u: adicionar 5 elementos à lista.\n", ntest++);
    printf (" Tamanho máximo: %d elementos.\n", MAX);
    unsigned num = 5;
    Chave chaves[] = {5, 3, 0, 9, 8};
    carregar_lista (&lista, chaves, num);
    mostrar_lseq (&lista);

    printf ("\n Teste %u: adicionar mais 8 elementos à lista para estorar o limite.\n", ntest++);
    Chave mais_chaves[8] = {};
    carregar_lista (&lista, mais_chaves, 8);
    mostrar_lseq (&lista);

    // inserir
    Registro registro = {2};
    printf ("\n Teste %u: inserir elemento chave %d numa lista cheia.\n", ntest++, registro.chave);
    bool inserido = inserir_lseq (&lista, registro, 2);
    if (!inserido)
        printf (" Erro: Lista cheia ou índice inválido!\n");
    mostrar_lseq (&lista);

    // procurar
    int chave = chaves[3];
    printf ("\n Teste %u: procurar chave %d na lista.\n", ntest++, chave);
    int indice = procurar_lseq (&lista, chave);
    if (indice >= 0)
        printf (" O elemento com chave %d está na posição %d.\n", chave, indice);
    else
        printf (" Erro: O elemento com chave %d não existe!\n", chave);

    chave = 104;
    printf ("\n Teste %u: procurar chave %d na lista.\n", ntest++, chave);
    indice = procurar_lseq (&lista, chave);
    if (indice >= 0)
        printf (" O elemento com chave %d está na posição %d.\n", chave, indice);
    else
        printf (" Erro: O elemento com chave %d não existe!\n", chave);

    // remover
    printf ("\n Teste %u: deletar chave 104 da lista.\n", ntest++);
    bool deletado = deletar_lseq (&lista, chave);
    if (!deletado)
        printf (" Erro: O elemento com chave %d não existe!\n", chave);

    printf ("\n Teste %u: deletar primeira ocorrência elemento chave 0 da lista.\n", ntest++);
    deletado = deletar_lseq (&lista, 0);
    if (!deletado)
        printf (" Erro: O elemento com chave %d não existe!\n", chave);
    mostrar_lseq (&lista);

    printf ("\n Teste %u: Ordenar lista.\n", ntest++);
    char algoritmo;
    printf (" Insertion [i] ou Bubble [b] sort? ");
    scanf ("%c", &algoritmo);
    ordenar_lseq (&lista, algoritmo);
    mostrar_lseq (&lista);

    return 0;
}

void carregar_lista (LSeq* lista, const Chave* chaves, unsigned num)
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {chaves[i]};
        printf (" Adicionando chave %d ", chaves[i]);
        bool adicionado = adicionar_lseq (lista, registro);
        if (!adicionado)
            printf (" Erro: Lista cheia!\n");
        else
            printf ("\n");
    }
}
