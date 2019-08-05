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
    list->available = 0;

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
    unsigned available = list->available;
    // A lista está cheia.
    if (available == INVALID) return false;
    list->available = list->arr[available].next;

    unsigned next = list->start,
        previous = INVALID;
    KEY key = node.reg.key;

    /* Se a lista está vacia nunca entra no loop.
     * Sai do loop se:
     *  - chegar no último elemento da lista;
     *  - ou achar um elemento maior ou igual ao
     *    que será inserido.
     */
    while (next != INVALID && list->arr[next].reg.key < key) {
        previous = next;
        next = list->arr[next].next;
    }

    // O elemento já existe.
    if (next != INVALID && list->arr[next].reg.key == key)
        return false;

    // Insere o elemento
    list->arr[available] = node;

    // Não há elemento prévio.
    if (previous == INVALID) {
        list->arr[available].next = next;
        list->start = available;
    }
    // Há um elemento prévio.
    else {
        list->arr[previous].next = available;
        list->arr[available].next = next;
    }

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
 * Retorna o índice do elemento.
 * A lista precisa estar ordenada.
 */
{
    int i = list.start;
    while (i != INVALID && list.arr[i].reg.key < key)
        i = list.arr[i].next;
    if (i == INVALID || list.arr[i].reg.key != key) return INVALID;
    return i;
}

bool delFromList (LIST *list, KEY key)
/*
 * Deleta um elemento da lista e atualiza a lista de disponíveis.
 * Recebe um ponteiro para LISTA e a chave do elemento.
 * Retorna true se o elemento foi achado e deletado ou false se o elemento
 * não existe.
 */
{
    int i = list->start,
        previous = INVALID;

    while (i != INVALID && list->arr[i].reg.key < key) {
        previous = i;
        i = list->arr[i].next;
    }

    // Se o elemento não existir ele não pode ser excluído.
    if (i == INVALID || list->arr[i].reg.key != key) return false;

    // Se o elemento tiver um outro precedendo ele, o anterior
    // tem que apontar pro próximo.
    if (previous != INVALID)
        list->arr[previous].next = list->arr[i].next;
    // Se não tiver, o início da lista será o próximo.
    else list->start = list->arr[i].next;

    // O elemento deletado aponta pro atualmente primeiro disponível e
    // torna-se o primeiro disponível.
    list->arr[i].next = list->available;
    list->available = i;

    return true;
}

