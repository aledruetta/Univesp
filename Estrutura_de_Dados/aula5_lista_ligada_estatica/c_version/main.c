/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LIGADA - IMPLEMENTAÇÃO ESTÁTICA (versão C)
 *
 * Arquivo:    main.c
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   9vo
 * Autor:      Alejandro Druetta
 * Data:       09/07/2019
 */

#include <stdio.h>
#include <stdlib.h>

#include "static_linked_list.h"

int main()
{
    LIST list;
    list_initialize (&list);
    printf ("%d\n", list.start);
    printf ("%d\n", list.empty);
    printf ("%d\n", list_len(list));

    return 0;
}

