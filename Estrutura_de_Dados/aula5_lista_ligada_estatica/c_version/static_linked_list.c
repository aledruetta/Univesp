/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LIGADA - IMPLEMENTAÇÃO ESTÁTICA (versão C)
 *
 * Arquivo:    static_linked_list.c
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   9vo
 * Autor:      Alejandro Druetta
 * Data:       01/08/2019
 */

#include "static_linked_list.h"

void list_initialize (LIST *list)
/*
 * Inicializa uma lista nova sem elementos.
 * Recebe um ponteiro a um struct LIST.
 */
{
    // A lista está vacia por tanto não tem um elemento inicial.
    list->start = INVALID;
    // O elemento de índice 0 é o primeiro disponível para adicionar
    // um novo elemento.
    list->empty = 0;

    for (int i=0; i<MAX-1; i++)
        list->arr[i].next = i + 1;
    list->arr[MAX-1].next = INVALID;
}

int list_len (LIST list)
{
    int len = 0;
    int next = list.start;
    while (next != INVALID) {
        next = list.arr[next].next;
        len++;
    }
    return len;
}

