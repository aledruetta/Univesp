/*
 * File: Lista_Linear/Sequencial/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdbool.h>
#include "lista_linear_sequencial.h"

int main ()
{
    // inicializar lista
    LLSeq lista;
    inicializar_llseq (&lista);
    printf ("Tamanho máximo: %d elementos\n", MAX);

    // adicionar elementos à lista
    Chave chaves1[MAX+1] = {5, 3, 0, 9, 8};
    for (unsigned i=0; i<MAX+1; i++) {
        Registro registro = {chaves1[i]};
        printf ("Adicionando: %d\n", registro.chave);
        bool adicionado = adicionar_llseq (&lista, &registro);
        if (!adicionado)
            printf ("Erro: Lista cheia!\n");
    }

    // mostrar lista
    mostrar_llseq (&lista);

    // inserir elemento na lista
    Registro registro = {2};
    bool inserido = inserir_llseq (&lista, &registro, 2);
    if (!inserido)
        printf ("Erro: Lista cheia ou ídice inválido!\n");
    mostrar_llseq (&lista);

    inicializar_llseq (&lista);
    Chave chaves2[MAX-1] = {5, 3, 0, 9};
    for (unsigned i=0; i<MAX-1; i++) {
        Registro registro = {chaves2[i]};
        printf ("Adicionando: %d\n", registro.chave);
        bool adicionado = adicionar_llseq (&lista, &registro);
        if (!adicionado)
            printf ("Erro: Lista cheia!\n");
    }
    inserido = inserir_llseq (&lista, &registro, 3);
    if (!inserido)
        printf ("Erro: Lista cheia ou ídice inválido!\n");
    mostrar_llseq (&lista);

    // procurar elemento na lista
    // remover elemento da lista

    return 0;
}
