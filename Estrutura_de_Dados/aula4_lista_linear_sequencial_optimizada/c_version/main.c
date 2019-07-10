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
    REGISTER reg;
    reg.key = 5;
    LIST list;
    initList (&list);
    addList (&list, reg);
    showList (list);
    return 0;
}

