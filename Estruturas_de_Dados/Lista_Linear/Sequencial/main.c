/*
 * File: Lista_Linear/Sequencial/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdbool.h>
#include "lista_linear_sequencial.h"

void carregar_lista (LLSeq*, const Chave*, unsigned num);

int main ()
{
    unsigned ntest = 1;

    // inicializar
    printf ("\n*** Testes ***\n");
    printf ("\nTeste %u: inicializar uma lista vacia\n", ntest++);
    LLSeq lista;
    inicializar_llseq (&lista);

    // mostrar
    printf ("\nTeste %u: mostrar lista\n", ntest++);
    mostrar_llseq (&lista);

    // Adicionar
    printf ("\nTeste %u: adicionar 5 elementos à lista\n", ntest++);
    printf ("Tamanho máximo: %d elementos\n", MAX);
    unsigned num = 5;
    Chave chaves[] = {5, 3, 0, 9, 8};
    carregar_lista (&lista, chaves, num);
    mostrar_llseq (&lista);

    printf ("\nTeste %u: adicionar mais 8 elementos à lista para estorar o limite\n", ntest++);
    Chave mais_chaves[8] = {};
    carregar_lista (&lista, mais_chaves, 8);
    mostrar_llseq (&lista);

    // inserir
    printf ("\nTeste %u: inserir elemento numa lista cheia\n", ntest++);
    Registro registro = {2};
    bool inserido = inserir_llseq (&lista, &registro, 2);
    if (!inserido)
        printf ("Erro: Lista cheia ou ídice inválido!\n");
    mostrar_llseq (&lista);

    // procurar
    printf ("\nTeste %u: procurar elementos na lista\n", ntest++);
    int chave = chaves[3];
    int indice = procurar_llseq (&lista, chave);
    printf ("O elemento com chave %d está na posição %d\n", chave, indice);
    chave = 104;
    indice = procurar_llseq (&lista, chave);
    if (indice >= 0)
        printf ("O elemento com chave %d está na posição %d\n", chave, indice);
    else
        printf ("Erro: O elemento com chave %d não existe!\n", chave);

    // remover

    return 0;
}

void carregar_lista (LLSeq* lista, const Chave* chaves, unsigned num)
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {chaves[i]};
        printf ("Adicionando chave %d ", chaves[i]);
        bool adicionado = adicionar_llseq (lista, &registro);
        if (!adicionado)
            printf ("Erro: Lista cheia!\n");
        else
            printf ("\n");
    }
}