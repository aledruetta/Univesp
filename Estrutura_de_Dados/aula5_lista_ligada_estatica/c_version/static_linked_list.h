/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LIGADA - IMPLEMENTAÇÃO ESTÁTICA (versão C)
 *
 * Arquivo:    static_linked_list.h
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   9vo
 * Autor:      Alejandro Druetta
 * Data:       01/08/2019
 */

#ifndef STATIC_LINKED_LIST_H
#define STATIC_LINKED_LIST_H

#include <stdio.h>
#include <stdlib.h>

#define MAX 50
#define INVALID -1

typedef int KEY;

// Registro
typedef struct
{
    KEY key;
    // outros campos
} REGISTER;

// Elemento
typedef struct
{
    REGISTER reg;
    int next;           // Próximo elemento na lista.
} ELEMENT;

// Lista
typedef struct
{
    ELEMENT arr[MAX];
    int start;          // Primeiro elemento da lista.
    int empty;          // Próximo elemento disponível para adicionar
                        // um novo elemento.
} LIST;

void list_initialize (LIST *list);      // Inicializar lista.
int list_len (LIST list);               // Tamanho da lista.
void list_show (LIST list);             // Visualizar a lista.
int list_search (LIST list, KEY key);   // Procura um elemento da lista.

#endif

