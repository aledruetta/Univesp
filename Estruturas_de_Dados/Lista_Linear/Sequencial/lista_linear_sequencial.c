/*
 * File: Lista_Linear/Sequencial/lista_linear_sequencial.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include "lista_linear_sequencial.h"

#define BUBBLE_SORT 'b'
#define INSERTION_SORT 'i'

void insertion_sort (LLSeq*);
void bubble_sort (LLSeq*);

void inicializar_llseq (LLSeq *lista)
{
    lista->tamanho = 0;
}

bool adicionar_llseq (LLSeq *lista, const Registro registro)
{
    if (lista->tamanho >= MAX) return false;
    lista->regs[lista->tamanho] = registro;
    lista->tamanho++;

    return true;
}

void mostrar_llseq (const LLSeq* lista)
{
    printf (" Lista [ ");
    for (unsigned i=0; i<lista->tamanho; i++)
        printf ("%d ", lista->regs[i].chave);
    printf ("] Tamanho: %u\n", lista->tamanho);
}

bool inserir_llseq (LLSeq *lista, const Registro registro, const unsigned index)
{
    if (lista->tamanho >= MAX || index >= lista->tamanho) return false;

    unsigned i;
    for (i=lista->tamanho; i>index; i--)
        lista->regs[i] = lista->regs[i-1];
    lista->regs[i] = registro;
    lista->tamanho++;

    return true;
}

int procurar_llseq (const LLSeq* lista, const Chave chave)
{
    unsigned i = 0;
    while (i < lista->tamanho) {
        if (chave == lista->regs[i].chave)
            return i;
        i++;
    }
    return -1;
}

void ordenar_llseq (LLSeq* lista, char algoritmo)
{
    if (algoritmo == INSERTION_SORT) {
        insertion_sort (lista);
    }
    else if (algoritmo == BUBBLE_SORT) {
        //bubble_sort (lista);
    }
}

bool deletar_llseq (LLSeq* lista, const Chave chave)
{
    int pos = procurar_llseq (lista, chave);
    if (pos == -1) return false;
    for (unsigned i=pos; i<lista->tamanho-1; i++)
        lista->regs[i] = lista->regs[i+1];
    lista->tamanho--;

    return true;
}

void insertion_sort (LLSeq* lista)
{
    if (lista->tamanho > 1) {
        for (unsigned i=1; i<lista->tamanho; i++) {
            int j = i - 1;
            Registro tmp = lista->regs[i];
            while (j >= 0 && tmp.chave < lista->regs[j].chave) {
                lista->regs[j+1] = lista->regs[j];
                j--;
            }
            lista->regs[j+1] = tmp;
        }
    }
}

void bubble_sort (LLSeq* lista)
{

}
