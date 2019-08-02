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

void initialize_list (LIST *list)
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

int len_list (LIST list)
/*
 * Retorna o tamanho da lista.
 */
{
    int len = 0;
    int next = list.start;
    while (next != INVALID) {
        next = list.arr[next].next;
        len++;
    }
    return len;
}

void show_list (LIST list)
/*
 * Imprime na saída padrão uma representação da lista no formato:
 * List [ 1, 2, 8, ... ] Lenght: 7
 */
{
    int next = list.start;
    printf ("List [ ");
    while (next != INVALID) {
        printf ("%d ", list.arr[next].reg.key);
        next = list.arr[next].next;
    }
    printf ("] Length: %d\n", len_list (list));
}

int search_list (LIST list, KEY key)
/*
 * Procura por um elemento da lista.
 * Recebe uma lista e uma chave.
 * A lista precisa estar ordenada.
 */
{
    int next = list.start;
    while (next != INVALID && list.arr[next].reg.key < key)
        next = list.arr[next].next;
    if (next != INVALID && list.arr[next].reg.key == key) return next;
    return INVALID;
}

