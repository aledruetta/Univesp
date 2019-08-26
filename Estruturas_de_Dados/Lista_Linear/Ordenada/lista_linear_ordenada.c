/*
 * File: Lista_Linear/Ordenada/lista_linear_ordenada.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include "lista_linear_ordenada.h"

void inicializar_lord (LOrd *lista)
{
    lista->tamanho = 0;
}

bool adicionar_lord (LOrd *lista, const Registro registro)
{
    unsigned tamanho = lista->tamanho;
    bool lista_cheia = tamanho >= MAX;
    bool elemento_existe = procurar_lord (lista, registro.chave) != -1;

    if (lista_cheia || elemento_existe) return false;

    unsigned i = tamanho;
    while (i > 0 && lista->regs[i-1].chave > registro.chave) {
        lista->regs[i] = lista->regs[i-1];
        i--;
    }
    lista->regs[i] = registro;
    lista->tamanho++;

    return true;
}

void mostrar_lord (const LOrd* lista)
{
    printf (" Lista [ ");
    for (unsigned i=0; i<lista->tamanho; i++)
        printf ("%d ", lista->regs[i].chave);
    printf ("] Tamanho: %u\n", lista->tamanho);
}

int procurar_lord (const LOrd* lista, const Chave chave)
{
    unsigned i = 0;
    while (i < lista->tamanho) {
        if (chave == lista->regs[i].chave)
            return i;
        i++;
    }
    return -1;
}

bool deletar_lord (LOrd* lista, const Chave chave)
{
    int pos = procurar_lord (lista, chave);
    if (pos == -1) return false;
    for (unsigned i=pos; i<lista->tamanho-1; i++)
        lista->regs[i] = lista->regs[i+1];
    lista->tamanho--;

    return true;
}

