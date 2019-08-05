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
#include <stdbool.h>

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
} NODE;

// Lista
typedef struct
{
    NODE arr[MAX];
    int start;          // Primeiro elemento da lista.
    int available;      // Próximo elemento disponível para adicionar
                        // um novo elemento.
} LIST;

NODE Node (KEY key);                        // Criar elemento.
void initializeList (LIST *list);           // Inicializar lista.
bool addToList (LIST *list, NODE node);     // Adicionar elemento.
int lenList (LIST list);                    // Tamanho da lista.
void showList (LIST list);                  // Visualizar a lista.
int searchList (LIST list, KEY key);        // Procura um elemento da lista.
bool delFromList (LIST *list, KEY key);     // Deleta um elemento.

#endif /* STATIC_LINKED_LIST_H */

