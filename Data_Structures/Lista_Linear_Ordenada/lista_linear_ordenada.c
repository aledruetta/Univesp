/*
 * File: Lista_Linear_Ordenada/lista_linear_ordenada.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include "lista_linear_ordenada.h"

void inicializar_lOrd (LOrd *lista)
{
    lista->tamanho = 0;
}

bool adicionar_lOrd (LOrd *lista, const Registro registro)
{
    unsigned tamanho = lista->tamanho;
    bool lista_cheia = tamanho >= MAX;
    bool elemento_existe = procurar_lOrd (lista, registro.chave) != -1;

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

void mostrar_lOrd (const LOrd* lista)
{
    printf (" Lista [ ");
    for (unsigned i=0; i<lista->tamanho; i++)
        printf ("%d ", lista->regs[i].chave);
    printf ("] Tamanho: %u\n", lista->tamanho);
}

// Binary Search
int procurar_lOrd (const LOrd* lista, const Chave chave)
{
    int fim = lista->tamanho;
    if (fim > 0) {
        int inicio = 0;
        int metade = 0;
        while ((fim - inicio) >= 0) {
            metade = inicio + (fim - inicio) / 2;
            if (lista->regs[metade].chave == chave) return metade;
            else if (lista->regs[metade].chave < chave)
                inicio = metade + 1;
            else
                fim = metade - 1;
        }
    }
    return -1;
}

bool deletar_lOrd (LOrd* lista, const Chave chave)
{
    int pos = procurar_lOrd (lista, chave);
    if (pos == -1) return false;
    for (unsigned i=pos; i<lista->tamanho-1; i++)
        lista->regs[i] = lista->regs[i+1];
    lista->tamanho--;
    return true;
}

