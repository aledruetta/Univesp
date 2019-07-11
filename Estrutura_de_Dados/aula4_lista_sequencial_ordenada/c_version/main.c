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
    int keys[] = {4, 9, 0, 3, 7, 12, 4, 28, 19, 8};
    LIST list;
    initList(&list);
    for (int i=0; i<10; i++)
    {
        REGISTER reg;
        reg.key = keys[i];
        addList(&list, reg);
    }
    showList(list);
    REGISTER reg;
    reg.key = 99;
    insPosList(&list, reg, 5);
    showList(list);

    return 0;
}

