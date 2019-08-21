/*
 * File: Lista_Linear/Ordenada/lista_linear_ordenada.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include "lista_linear_ordenada.h"

void inicializar_llord (LLOrd *lista)
{
    lista->tamanho = 0;
}

bool adicionar_llord (LLOrd *lista, const Registro *registro)
{
    if (lista->tamanho >= MAX) return false;
    lista->regs[lista->tamanho] = *registro;
    lista->tamanho++;

    return true;
}

void mostrar_llord (const LLOrd* lista)
{
    printf (" Lista [ ");
    for (unsigned i=0; i<lista->tamanho; i++)
        printf ("%d ", lista->regs[i].chave);
    printf ("] Tamanho: %u\n", lista->tamanho);
}

bool inserir_llord (LLOrd *lista, const Registro *registro, const unsigned index)
{
    if (lista->tamanho >= MAX || index >= lista->tamanho) return false;

    unsigned i;
    for (i=lista->tamanho; i>index; i--)
        lista->regs[i] = lista->regs[i-1];
    lista->regs[i] = *registro;
    lista->tamanho++;

    return true;
}

int procurar_llord (const LLOrd* lista, const Chave chave)
{
    unsigned i = 0;
    while (i < lista->tamanho) {
        if (chave == lista->regs[i].chave)
            return i;
        i++;
    }
    return -1;
}

bool deletar_llord (LLOrd* lista, const Chave chave)
{
    int pos = procurar_llord (lista, chave);
    if (pos == -1) return false;
    for (unsigned i=pos; i<lista->tamanho-1; i++)
        lista->regs[i] = lista->regs[i+1];
    lista->tamanho--;

    return true;
}
