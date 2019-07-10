/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C)
 *
 * Arquivo:     lista.h
 * Disciplina:  ESTRUTURA DE DADOS
 * Bimestre:    9°
 * Autor:       Alejandro Druetta
 * Data:        10/07/2019
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
    REGISTER regs[MAX+1];
    int len;
} LIST;


void initList(LIST * list);
void showList(LIST list);
int lenList(LIST list);
int findSeqList(LIST list, KEY key);
int findSentList(LIST * list, KEY key);
int findBinList(LIST list, KEY key);
bool addList(LIST * list, REGISTER reg);
bool delList(LIST * list, KEY key);
void sortInsList(LIST * list);
void sortBinList(LIST * list);
bool insPosList(LIST * list, REGISTER reg, int pos);
bool insOrdList(LIST * list, REGISTER reg);

#endif

