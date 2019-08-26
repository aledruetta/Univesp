/*
 * File: Lista_Linear/Ordenada/lista_sequencial_ordenada.h
 * @author: Alejandro Druetta
 */

#ifndef LISTA_LINEAR_ORDENADA_H
#define LISTA_LINEAR_ORDENADA_H

#include <stdbool.h>

#define MAX 10

typedef int Chave;

typedef struct
{
    Chave chave;
    // outros membros
} Registro;

typedef struct
{
    Registro regs[MAX];
    unsigned tamanho;
} LOrd;

void inicializar_lord (LOrd*);
bool adicionar_lord (LOrd*, const Registro);
int procurar_lord (const LOrd*, const Chave);
bool deletar_lord (LOrd*, const Chave);
void mostrar_lord (const LOrd*);

#endif /* LISTA_LINEAR_ORDENADA_H */
