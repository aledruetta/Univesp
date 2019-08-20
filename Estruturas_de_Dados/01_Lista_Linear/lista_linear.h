/*
 * File: 01_Lista_Linear/lista.h
 * @author: Alejandro Druetta
 */

#ifndef LISTA_LINEAR_H
#define LISTA_LINEAR_H

#include <stdbool.h>

#define MAX 10

typedef int Chave;

typedef struct
{
    Chave chave;
} Registro;

typedef struct
{
    Registro regs[MAX];
    unsigned tamanho;
} ListaLinear;

void inicializar_listaLinear (ListaLinear*);
bool adicionar_listaLinear (ListaLinear*, const Registro*);

#endif /* LISTA_LINEAR_H */
