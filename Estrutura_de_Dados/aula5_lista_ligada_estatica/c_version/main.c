/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LIGADA - IMPLEMENTAÇÃO ESTÁTICA (versão C)
 *
 * Arquivo:    main.c
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   9vo
 * Autor:      Alejandro Druetta
 * Data:       09/07/2019
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "static_linked_list.h"

void printAvailablePositions (LIST list);

int main()
{
    LIST list;
    initializeList (&list);

    printf ("\nStart: %d\n", list.start);
    printf ("available: %d\n", list.available);
    showList (list);
    NODE node = Node (5);
    printf("\nAdding element of key 5...\n");
    addToList (&list, node);
    showList (list);

    printf("\nAdding more elements...\n");
    srand (time (NULL));
    int r;
    for (int i=0; i<10; i++) {
        r = rand () % 100 - 50;
        printf ("%2d element of key: %3d\n", i+1, r);
        addToList (&list, Node (r));
    }
    showList (list);

    printf("\nYielding a new sequencial list...\n");
    addToList (&list, node);
    initializeList (&list);
    for (int i=0; i<10; i++) {
        addToList (&list, Node (i + 1));
    }
    showList (list);
    printf("\n");
    printf ("Index of element of key 1: %d\n", searchList (list, 1));
    printf ("Index of element of key 5: %d\n", searchList (list, 5));
    printf ("Index of element of key 10: %d\n", searchList (list, 10));

    printAvailablePositions (list);
    printf("\n");

    printf ("Deleting element of key 1...");
    (delFromList (&list, 1)) ? printf (" OK!\n") : printf (" Down!\n");
    printf ("Deleting element of key 5...");
    (delFromList (&list, 5)) ? printf (" OK!\n") : printf (" Down!\n");
    printf ("Deleting element of key 10...");
    (delFromList (&list, 10)) ? printf (" OK!\n") : printf (" Down!\n");
    showList (list);

    printAvailablePositions (list);
    printf("\n");

    return 0;
}

void printAvailablePositions (LIST list) {
    printf("\n");
    printf ("Posições disponíveis: \n");
    int av = list.available;
    do {
        printf ("%d ", av);
        av = list.arr[av].next;
    } while (av != INVALID);
    printf("\n");
}

