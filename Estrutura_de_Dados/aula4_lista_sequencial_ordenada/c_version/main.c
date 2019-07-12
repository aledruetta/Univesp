/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C)
 *
 * Arquivo:     main.c
 * Disciplina:  ESTRUTURA DE DADOS
 * Bimestre:    9°
 * Autor:       Alejandro Druetta
 * Data:        10/07/2019
 */

#include "lista.h"

int main()
{
    LIST list;
    initList(&list);
    genList(&list, 10);
    showList(list);
    REGISTER reg;
    reg.key = 99;
    insPosList(&list, reg, 5);
    showList(list);
    sortBubList(&list);
    showList(list);

    return 0;
}

