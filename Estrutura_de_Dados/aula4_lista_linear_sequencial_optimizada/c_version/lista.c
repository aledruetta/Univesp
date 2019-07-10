/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C)
 *
 * Arquivo:     lista.c
 * Disciplina:  ESTRUTURA DE DADOS
 * Bimestre:    9°
 * Autor:       Alejandro Druetta
 * Data:        10/07/2019
 */

#include "lista.h"


void initList (LIST * list)
/*
 * INICIALIZA uma lista com zero elementos.
 */
{
    list->len = 0;
}


int lenList (LIST list)
/*
 * Retorna o número de elementos da lista.
 */
{
    return list.len;
}


void showList (LIST list)
/*
 * IMPRIME uma representação da lista no formato:
 * List: [ 4 12 8 ] Length: 3
 */
{
    printf("\nList: [ ");
    for (int i=0; i<list.len; i++)
        printf("%i ", list.regs[i].key);
    printf("] Length: %i\n", list.len);
}


int findSeqList (LIST list, KEY key)
/*
 * PROCURA por uma chave de forma sequencial. A lista
 * NÃO precisa estar ordenada.
 */
{
    for (int pos=0; pos<list.len; pos++)
        if (list.regs[pos].key == key) return pos;
    return -1;
}


int findSentList (LIST * list, KEY key)
/*
 * PROCURA por uma chave usando a busca por sentinela. A lista
 * NÃO precisa estar ordenada.
 */
{
    int len = list->len;
    list->regs[len].key = key;
    int pos = 0;
    while (list->regs[pos].key != key) pos++;
    if (pos == len) return -1;
    return pos;
}

int findBinList (LIST list, KEY key)
/*
 * PROCURA por uma chave usando busca binária. A lista
 * SIM precisa estar ordenada.
 */
{
    int mid;
    int ini = 0;
    int end = list.len - 1;

    while (ini <= end)
    {
        mid = (ini + end) / 2;
        if (list.regs[mid].key == key) return mid;
        if (list.regs[mid].key < key) ini = mid + 1;
        else ini = mid - 1;
    }
    return -1;
}


bool insPosList (LIST * list, REGISTER reg, int pos)
/*
 * INSERTA um elemento na posição dada, sempre que a lista
 * não estiver cheia. A lista NÃO precisa estar ordenada.
 */
{
    int len = list->len;
    if (len >= MAX || pos < 0 || pos >= len) return false;
    for (int i=len-1; i>=pos; i--)
        list->regs[i+1] = list->regs[i];
    list->regs[pos] = reg;
    list->len++;
    return true;
}


bool insOrdList (LIST * list, REGISTER reg)
{
}


bool delList (LIST * list, KEY key)
{
}


void sortInsList (LIST * list)
/*
 * ORDENA os elementos da lista em função das suas chaves
 * usando o algoritmo INSERTION SORT.
 */
{
}


void sortBubList (LIST * list)
/*
 * ORDENA os elementos da lista em função das suas chaves
 * usando o algoritmo BUBBLE SORT.
 */
{
}


bool addList (LIST * list, REGISTER reg)
/*
 * ADICIONA um elemento na última posição sempre que
 * a lista não estiver cheia.
 */
{
    int len = list->len;
    if (len >= MAX) return false;
    list->regs[len] = reg;
    list->len++;
    return true;
}

