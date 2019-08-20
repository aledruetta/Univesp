/*
 * File: Lista_Linear/Sequencial/lista_linear.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include "lista_linear_sequencial.h"

void inicializar_llseq (LLSeq *lista)
{
    lista->tamanho = 0;
}

bool adicionar_llseq (LLSeq *lista, const Registro *registro)
{
    if (lista->tamanho >= MAX) return false;
    lista->regs[lista->tamanho] = *registro;
    lista->tamanho++;

    return true;
}

void mostrar_llseq (const LLSeq* lista)
{
    printf ("Lista [ ");
    for (unsigned i=0; i<lista->tamanho; i++)
        printf ("%d ", lista->regs[i].chave);
    printf ("] Tamanho: %u\n", lista->tamanho);
}

bool inserir_llseq (LLSeq *lista, const Registro *registro, const unsigned index)
{
    if (lista->tamanho >= MAX || index >= lista->tamanho) return false;

    unsigned i;
    for (i=lista->tamanho; i>index; i--)
        lista->regs[i] = lista->regs[i-1];
    lista->regs[i] = *registro;
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

//bool deletar_llseq (LLSeq* lista, const Chave chave)
//{
//}
