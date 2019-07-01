/*
 * file: aula3_lista_linear_sequencial_optimizada.c
 *
 * LISTA LINEAR SEQUENCIAL (optimizada)
 */

#include "aula3_lista_linear_sequencial_optimizada.h"

int main()
{
    CHAVE chaves[] = {2, 34, 8, 10, 23, 65, 4};
    int len = sizeof(chaves) / sizeof(int);
    LISTA lista;

    inicializarLista(&lista);
    exibirLista(lista);

    for (int i=0; i<len; i++)
    {
        REGISTRO registro;
        registro.chave = chaves[i];
        inserirElemLista(&lista, registro, 0);
    }
    exibirLista(lista);

    for (int i=0; i<3; i++)
    {
        REGISTRO registro;
        registro.chave = chaves[i];
        inserirElemLista(&lista, registro, 4);
    }
    exibirLista(lista);

    for (int i=3; i<len; i++)
    {
        REGISTRO registro;
        registro.chave = chaves[i];
        inserirElemLista(&lista, registro, 10);
    }
    exibirLista(lista);

    //int resto = MAX - lista.nroElem;
    //for (int i=0; i<resto; i++)
    //{
    //    REGISTRO registro;
    //    registro.chave = 0;
    //    inserirElemLista(&lista, registro, lista.nroElem);
    //}
    //exibirLista(lista);

    int ch, pos;
    CHAVE outras_chaves[] = {5, 8, 2, 10, 11, 37, 65};
    len = sizeof(outras_chaves) / sizeof(int);

    printf("\nBusca sequencial:\n\n");
    for (int i=0; i<len; i++)
    {
        ch = outras_chaves[i];
        pos = buscaSequencial(lista, ch);
        if (pos < 0)
            printf("O elemento com chave \"%i\" não pertence à lista.\n", ch);
        else
            printf("A chave \"%i\" está na posição [%i].\n", ch, pos);
    }

    printf("\nBusca por sentinela:\n\n");
    for (int i=0; i<len; i++)
    {
        ch = outras_chaves[i];
        pos = buscaSentinela(&lista, ch);
        if (pos < 0)
            printf("O elemento com chave \"%i\" não pertence à lista.\n", ch);
        else
            printf("A chave \"%i\" está na posição [%i].\n", ch, pos);
    }

    ch = 10;
    bool eliminado = excluirElemLista(&lista, ch);
    if (eliminado)
        printf("\nA primeira ocorrência do elemento com chave "
               "\"%i\" foi eliminada da lista!\n", ch);
    exibirLista(lista);

    printf("\nOrdenar lista (insert sort):\n");
    ordenarLista(&lista);

    printf("\nReinicializar lista:\n");
    reinicializarLista(&lista);
    exibirLista(lista);

    return 0;
}

