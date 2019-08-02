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
    int nxt;           // Próximo elemento na lista.
} ELEMENT;

// Lista
typedef struct
{
    ELEMENT arr[MAX];
    int start;          // Primeiro elemento da lista.
    int empty;          // Próximo elemento disponível para adicionar
                        // um novo elemento.
} LIST;

void initialize_list (LIST *list);          // Inicializar lista.
REGISTER Register (KEY key);                // Criar registro.
ELEMENT Element (KEY key, int nxt);         // Criar elemento.
int len_list (LIST list);                   // Tamanho da lista.
void show_list (LIST list);                 // Visualizar a lista.
int search_list (LIST list, KEY key);       // Procura um elemento da lista.

#endif /* STATIC_LINKED_LIST_H */

