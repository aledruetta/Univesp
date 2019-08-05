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

REGISTER Register (KEY key)
{
    REGISTER this;
    this.key = key;
    return this;
}

NODE Node (KEY key)
{
    REGISTER reg = Register (key);
    NODE this;
    this.reg = reg;
    this.next = INVALID;
    return this;
}

void initializeList (LIST *list)
/*
 * Inicializa uma lista nova sem elementos.
 * Recebe um ponteiro a um struct LIST.
 */
{
    // A lista está vacia por tanto não tem um elemento inicial.
    list->start = INVALID;
    // O elemento de índice 0 é o primeiro disponível para adicionar
    // um novo elemento.
    list->vacancy = 0;

    for (int i=0; i<MAX-1; i++)
        list->arr[i].next = i + 1;
    list->arr[MAX-1].next = INVALID;
}

bool addToList (LIST *list, NODE node)
/*
 * Insere um elemento em uma lista ordenada.
 * Não admite elementos repetidos.
 */
{
    unsigned vacancy = list->vacancy;
    // A lista está cheia.
    if (vacancy == INVALID) return false;
    list->vacancy = list->arr[vacancy].next;

    unsigned start = list->start,
        previous = INVALID,
        i = start;
    KEY key = node.reg.key;

    /* Se a lista está vacia nunca entra no loop.
     * Sai do loop se:
     *  - chegar no último elemento da lista;
     *  - ou achar um elemento maior ou igual ao
     *    que será inserido.
     */
    while (i != INVALID && list->arr[i].reg.key < key) {
        previous = i;
        i = list->arr[i].next;
    }
    // O elemento já existe.
    if (i != INVALID && list->arr[i].reg.key == key)
        return false;

    // Insere o elemento
    list->arr[vacancy] = node;

    // A lista não estava vacia.
    if (start != INVALID) {
        // O elemento não é o último.
        if (i != INVALID)
            list->arr[vacancy].next = i;
        // O elemento não é o primeiro.
        if (key > list->arr[start].reg.key)
            list->arr[previous].next = vacancy;
        // O elemento SIM é o primeiro.
        else
            list->start = vacancy;
    }
    // A lista SIM estava vacia.
    else
        list->start = vacancy;

    return true;
}

int lenList (LIST list)
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

void showList (LIST list)
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
    printf ("] Length: %d\n", lenList (list));
}

int searchList (LIST list, KEY key)
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

