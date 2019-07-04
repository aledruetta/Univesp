/*
 * file: aula3_lista_linear_sequencial.c
 *
 * LISTA LINEAR SEQUENCIAL (versão inicial)
 */

#include "aula3_lista_linear_sequencial.h"

int main()
{
    CHAVE chaves[] = {2, 34, 8, 10, 23, 65, 4};
    //CHAVE chaves[] = {1, 2, 3, 4, 5, 6, 7};
    LISTA lista;

    inicializarLista(&lista);
    exibirLista(lista);

    for (int i=0; i<7; i++)
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

    for (int i=3; i<7; i++)
    {
        REGISTRO registro;
        registro.chave = chaves[i];
        inserirElemLista(&lista, registro, 10);
    }
    exibirLista(lista);

    int resto = MAX - lista.nroElem;

    for (int i=0; i<resto; i++)
    {
        REGISTRO registro;
        registro.chave = 0;
        inserirElemLista(&lista, registro, lista.nroElem);
    }
    exibirLista(lista);

    CHAVE ch = 10;
    int pos = buscaSequencial(lista, ch);
    printf("A chave \"%i\" aparece na posição [%i]\n", ch, pos);

    bool eliminado = excluirElemLista(&lista, ch);
    if (eliminado)
        printf("A primeira ocorrência do elemento com chave "
               "\"%i\" foi eliminada da lista!\n", ch);
    exibirLista(lista);

    reinicializarLista(&lista);
    exibirLista(lista);

    return 0;
}

