/*
 * file: aula3_lista_linear_sequencial_optimizada.h
 *
 * LISTA LINEAR SEQUENCIAL (optimizada)
 * - Busca por Sentinela;
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
    REGISTRO A[MAX+1];
    int nroElem;
} LISTA;


void inicializarLista(LISTA * lista);
int tamanho(LISTA lista);
void exibirLista(LISTA lista);
int buscaSequencial(LISTA lista, CHAVE chave);
int buscaSentinela(LISTA * lista, CHAVE chave);
bool inserirElemLista(LISTA * lista, REGISTRO reg, int pos);
bool excluirElemLista(LISTA * lista, CHAVE chave);
void ordenarLista(LISTA * lista);
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
    printf("\nLista: [ ");
    for (int i=0; i<lista.nroElem; i++)
        printf("%i ", lista.A[i].chave);
    printf("] tamanho: %i\n", tamanho(lista));
}


int buscaSequencial(LISTA lista, CHAVE chave)
{
    for (int pos=0; pos<lista.nroElem; pos++)
        if (lista.A[pos].chave == chave) return pos;
    return -1;
}


int buscaSentinela(LISTA * lista, CHAVE chave)
{
    lista->A[lista->nroElem].chave = chave;
    int pos = 0;
    while (lista->A[pos].chave != chave) pos++;
    if (pos == lista->nroElem) return -1;
    return pos;
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
        printf("O elemento com chave [%i] não existe!\n", chave);
        return false;
    }

    for (i=pos; i<lista->nroElem-1; i++)
        lista->A[i] = lista->A[i+1];

    lista->nroElem--;

    return true;
}

// Algoritmo: insertion sort
void ordenarLista(LISTA * lista)
{
    if (lista->nroElem <= 1) return;
    for (int i=1; i<lista->nroElem; i++)
    {
        REGISTRO tmp = lista->A[i];
        int j = 1;
        while ((tmp.chave < lista->A[i-j].chave) && (i-j >= 0))
        {
            lista->A[i-j+1] = lista->A[i-j];
            j++;
        }
        lista->A[i-j+1] = tmp;
        exibirLista( * lista);
    }
}

