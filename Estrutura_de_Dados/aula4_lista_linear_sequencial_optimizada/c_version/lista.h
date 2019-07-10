/*
 * file: lista.h
 *
 * LISTA LINEAR SEQUENCIAL (optimizada)
 * - Busca por Sentinela;
 */

#ifndef UNIVESP_LISTA_H
#define UNIVESP_LISTA_H

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
int sequencialSearch(LIST list, KEY key);
int sentinelSearch(LIST * list, KEY key);
int binarySearch(LIST list, KEY key);
bool append(LIST * list, REGISTER reg, int pos);
bool delete(LIST * list, KEY key);
void sort(LIST * list);
bool insert(LIST * list, REGISTER reg);
void reinitialize(LIST * list);

#endif

