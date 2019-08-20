/*
 * File: Lista_Linear/Sequencial/lista.h
 * @author: Alejandro Druetta
 */

#ifndef LISTA_LINEAR_H
#define LISTA_LINEAR_H

#include <stdbool.h>

#define MAX 5

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

void inicializar_llin (ListaLinear*);
bool adicionar_llin (ListaLinear*, const Registro*);
void mostrar_llin (const ListaLinear*);

#endif /* LISTA_LINEAR_H */
