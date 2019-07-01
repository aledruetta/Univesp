/*
 * file: aula3_lista_linear_sequencial.h
 *
 * LISTA LINEAR SEQUENCIAL (versão inicial)
 */

#include <stdio.h>
#include <stdbool.h>

#define MAX 50
typedef int CHAVE;


typedef struct
{
    CHAVE chave;
    // outros campos
} REGISTRO;


typedef struct
{
    REGISTRO A[MAX];
    int nroElem;
} LISTA;


void inicializarLista(LISTA * lista);
int tamanho(LISTA lista);
void exibirLista(LISTA lista);
int buscaSequencial(LISTA lista, CHAVE chave);
bool inserirElemLista(LISTA * lista, REGISTRO reg, int pos);
bool excluirElemLista(LISTA * lista, CHAVE chave);
void reinicializarLista(LISTA * lista);


void inicializarLista(LISTA * lista)
{
    lista->nroElem = 0;
}


void reinicializarLista(LISTA * lista)
{
    lista->nroElem = 0;
}


int tamanho(LISTA lista)
{
    return lista.nroElem;
}


void exibirLista(LISTA lista)
{
    printf("Lista: [ ");
    for (int i=0; i<lista.nroElem; i++)
        printf("%i ", lista.A[i].chave);
    printf("] tamanho: %i\n", tamanho(lista));
}


int buscaSequencial(LISTA lista, CHAVE chave)
{
    for (int i=0; i<lista.nroElem; i++)
    {
        if (lista.A[i].chave == chave) return i;
    }
    return -1;
}


bool inserirElemLista(LISTA * lista, REGISTRO reg, int pos)
{
    bool pos_invalida = (pos < 0) && (pos > lista->nroElem);
    bool cheia = (lista->nroElem == MAX);

    if (cheia)
    {
        printf("A lista está cheia!\n");
        return false;
    }
    if (pos_invalida)
    {
        printf("A posição não é válida!\n");
        return false;
    }

    for (int i=lista->nroElem; i>pos; i--)
        lista->A[i] = lista->A[i-1];

    lista->A[pos] = reg;
    lista->nroElem++;

    return true;
}

bool excluirElemLista(LISTA * lista, CHAVE chave)
{
    int pos, i;
    pos = buscaSequencial(* lista, chave);

    if (pos < 0)
    {
        printf("O elemento não existe!\n");
        return false;
    }

    for (i=pos; i<lista->nroElem-1; i++)
        lista->A[i] = lista->A[i+1];

    lista->nroElem--;

    return true;
}

