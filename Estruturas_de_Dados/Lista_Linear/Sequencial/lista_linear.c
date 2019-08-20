/*
 * File: Lista_Linear/Sequencial/lista_linear.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include "lista_linear.h"

void inicializar_llin (ListaLinear *lista)
{
    lista->tamanho = 0;
}

bool adicionar_llin (ListaLinear *lista, const Registro *registro)
{
    if (lista->tamanho >= MAX) return false;
    lista->regs[lista->tamanho] = *registro;
    lista->tamanho++;

    return true;
}

void mostrar_llin (const ListaLinear* lista)
{
    printf ("Lista [ ");
    for (unsigned i=0; i<lista->tamanho; i++) {
        printf ("%d ", lista->regs[i].chave);
    }
    printf ("] Tamanho: %u\n", lista->tamanho);
}
