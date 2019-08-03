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

int main()
{
    LIST list;
    initializeList (&list);

    printf ("Start: %d\n", list.start);
    printf ("vacancy: %d\n", list.vacancy);
    showList (list);
    ELEMENT elem = Element (5);
    printf("Adding element of key 5...\n");
    addToList (&list, elem);
    showList (list);
    printf ("Index of element of key 5: %d\n", searchList (list, 5));

    printf("Adding more elements...\n");
    srand (time (NULL));
    int r;
    for (int i=0; i<10; i++) {
        r = rand () % 100 - 50;
        printf ("Element of key: %d\n", r);
        addToList (&list, Element (r));
    }
    showList (list);


    return 0;
}

