/*
 * File: 01_Lista_Linear/lista_linear.c
 * @author: Alejandro Druetta
 */

#include "lista_linear.h"

void inicializar_listaLinear (ListaLinear *lista)
{
    lista->tamanho = 0;
}

bool adicionar_listaLinear (ListaLinear *lista, const Registro *registro)
{
    if (lista->tamanho >= MAX) return false;
    lista->regs[lista->tamanho] = *registro;
    lista->tamanho++;

    return true;
}
