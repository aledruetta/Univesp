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
    printf ("\n*** Testes ***\n");
    printf ("\nTeste %u: inicializar uma lista vacia\n", ntest++);
    LLSeq lista;
    inicializar_llseq (&lista);

    printf ("\nTeste %u: mostrar lista\n", ntest++);
    mostrar_llseq (&lista);

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

    printf ("\nTeste %u: inserir elemento na lista cheia\n", ntest++);
    Registro registro = {2};
    bool inserido = inserir_llseq (&lista, &registro, 2);
    if (!inserido)
        printf ("Erro: Lista cheia ou ídice inválido!\n");
    mostrar_llseq (&lista);

    // procurar elemento na lista
    // remover elemento da lista

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
