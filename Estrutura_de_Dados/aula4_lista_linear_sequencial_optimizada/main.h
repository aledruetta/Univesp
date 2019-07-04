/*
 * file: main.h
 *
 * LISTA LINEAR SEQUENCIAL (optimizada)
 * - Busca por Sentinela;
 */

#include <stdio.h>
#include <stdbool.h>

#define MAX 50
typedef int KEY;


typedef struct
{
    KEY key;
    // outros campos
} REGISTER;


typedef struct
{
    REGISTER A[MAX+1];
    int len;
} LIST;


void initialize(LIST * list);
int len(LIST list);
void show(LIST list);
int searchSeq(LIST list, KEY key);
int searchSent(LIST * list, KEY key);
bool append(LIST * list, REGISTER reg, int pos);
bool delete(LIST * list, KEY key);
void sort(LIST * list);
bool insert(LIST * list, REGISTER reg);
void reinitialize(LIST * list);


void initialize(LIST * list)
{
    list->len = 0;
}


void reinitialize(LIST * list)
{
    list->len = 0;
}


int len(LIST list)
{
    return list.len;
}


void show(LIST list)
{
    printf("\nList: [ ");
    for (int i=0; i<list.len; i++)
        printf("%i ", list.A[i].key);
    printf("] len: %i\n", len(list));
}


int searchSeq(LIST list, KEY key)
{
    for (int pos=0; pos<list.len; pos++)
        if (list.A[pos].key == key) return pos;
    return -1;
}


int searchSent(LIST * list, KEY key)
{
    list->A[list->len].key = key;
    int pos = 0;
    while (list->A[pos].key != key) pos++;
    if (pos == list->len) return -1;
    return pos;
}


bool append(LIST * list, REGISTER reg, int pos)
{
    bool pos_invalida = (pos < 0) && (pos > list->len);
    bool is_full = (list->len == MAX);

    if (is_full)
    {
        printf("A lista está cheia!\n");
        return false;
    }
    if (pos_invalida)
    {
        printf("A posição não é válida!\n");
        return false;
    }

    for (int i=list->len; i>pos; i--)
        list->A[i] = list->A[i-1];

    list->A[pos] = reg;
    list->len++;

    return true;
}

bool delete(LIST * list, KEY key)
{
    int pos, i;
    pos = searchSeq(* list, key);

    if (pos < 0)
    {
        printf("O elemento com chave [%i] não existe!\n", key);
        return false;
    }

    for (i=pos; i<list->len-1; i++)
        list->A[i] = list->A[i+1];

    list->len--;

    return true;
}

void sort(LIST * list)
// Algoritmo: insertion sort
{
    if (list->len <= 1) return;
    for (int i=1; i<list->len; i++)
    {
        REGISTER tmp = list->A[i];
        int j = 1;
        while ((tmp.key < list->A[i-j].key) && (i-j >= 0))
        {
            list->A[i-j+1] = list->A[i-j];
            j++;
        }
        list->A[i-j+1] = tmp;
        show( * list);
    }
}

bool insert(LIST * list, REGISTER reg)
{
    bool is_full = (list->len == MAX);

    if (is_full)
    {
        printf("A lista está cheia!\n");
        return false;
    }

    int pos = list->len - 1;
    while (pos >= 0 && list->A[pos].key > reg.key)
    {
        list->A[pos+1] = list->A[pos];
        pos--;
    }
    list->A[pos+1] = reg;
    list->len++;

    return true;
}

