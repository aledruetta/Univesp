/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C)
 *
 * Arquivo:     main.c
 * Disciplina:  ESTRUTURA DE DADOS
 * Bimestre:    9°
 * Autor:       Alejandro Druetta
 * Data:        10/07/2019
 */

#include "lista.h"

int main()
{
    int chaves[] = {21, 5, 88, 1, 9, 19, 0, 45, 12, 90};
    LIST lista;
    initialize(&lista);
    show(lista);
    for (int i=0; i<10; i++)
    {
        REGISTER registro;
        registro.key = chaves[i];
        append(&lista, registro, len(lista));
    }
    show(lista);
    printf("Eliminar chave? ");
    int chave, pos;
    scanf("%i", &chave);
    pos = sentinelSearch(&lista, chave);
    if (pos == -1) printf("Chave inválida!\n");
    else
    {
        printf("A chave \"%i\" está na posição [%i].\n", chave, pos);
        if (delete(&lista, chave)) printf("Chave eliminada!\n");
        show(lista);
    }
    printf("\nLista ordenada:\n");
    sort(&lista);
    printf("\nInsertar um registro:\n");
    REGISTER registro;
    registro.key = 18;
    if (insert(&lista, registro)) show(lista);
    printf("\nProcurar chave? ");
    scanf("%i", &chave);
    pos = binarySearch(lista, chave);
    if (pos == -1) printf("Chave inválida!\n");
    else printf("A chave \"%i\" está na posição [%i].\n", chave, pos);

    return 0;
}

