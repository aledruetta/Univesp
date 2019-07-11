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


void initList (LIST * list);                            // Inicializar
void showList (LIST list);                              // Mostrar
int lenList (LIST list);                                // Cumprimento
int findSeqList (LIST list, KEY key);                   // Busca Sequencial
int findSentList (LIST * list, KEY key);                // Busca por Sentinela
int findBinList (LIST list, KEY key);                   // Busca Binária
bool addList (LIST * list, REGISTER reg);               // Adicionar
bool delList (LIST * list, KEY key);                    // Deletar
void sortInsList (LIST * list);                         // Insertion Sort
void sortBinList (LIST * list);                         // Binary Sort
bool insPosList (LIST * list, REGISTER reg, int pos);   // Inserir Posicional
bool insOrdList (LIST * list, REGISTER reg);            // Inserir Ordenada

#endif

