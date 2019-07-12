/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL ORDENADA (versão C)
 *
 * Arquivo:     test.c
 * Disciplina:  ESTRUTURA DE DADOS
 * Bimestre:    9°
 * Autor:       Alejandro Druetta
 * Data:        10/07/2019
 */

#include "test.h"

void testList()
{
    LIST list;
    initList(&list);
    srand (time(NULL));
    REGISTER reg;
    reg.key = 99;
    int pos;

    // Bateria de testes unitários

    printf("\nTeste 1: GERANDO uma lista randômica de 10 elementos...");
    genList(&list, 10);
    showList(list);

    printf("\nTeste 2: ADICIONANDO o elemento de chave 99...");
    addList(&list, reg);
    showList(list);

    printf("\nTeste 3: DELETANDO o elemento de chave 99...");
    delList(&list, 99);
    showList(list);

    printf("\nTeste 4: INSERINDO o elemento de chave 99 na posição 5...");
    insPosList(&list, reg, 5);
    showList(list);

    printf("\nTeste 5: PROCURANDO (sequencialmente) o elemento de chave 99...");
    pos = findSeqList(list, 99);
    printf("\nPosição: %i\n", pos);

    printf("\nTeste 6: PROCURANDO (com sentinela) o elemento de chave 99...");
    pos = findSentList(&list, 99);
    printf("\nPosição: %i\n", pos);

    printf("\nTeste 7: ORDENANDO a lista (insertion sort)...");
    sortInsList(&list);
    showList(list);

    printf("\nTeste 8: PROCURANDO (busca binária) o elemento de chave 99...");
    pos = findBinList(list, 99);
    printf("\nPosição: %i\n", pos);

    printf("\nTeste 9: GERANDO uma nova lista e ORDENANDO (bubble sort)...");
    initList(&list);
    genList(&list, 10);
    sortBubList(&list);
    showList(list);

    //printf("\nTeste 10: INSERINDO elemento de chave 15 numa lista ordenada...");
    //reg.key = 15;
    //insOrdList(&list, reg);
    //showList(list);

}

