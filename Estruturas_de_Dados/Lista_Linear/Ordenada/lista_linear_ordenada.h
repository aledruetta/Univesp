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

void inicializar_lOrd (LOrd*);
bool adicionar_lOrd (LOrd*, const Registro);
int procurar_lOrd (const LOrd*, const Chave);
bool deletar_lOrd (LOrd*, const Chave);
void mostrar_lOrd (const LOrd*);

#endif /* LISTA_LINEAR_ORDENADA_H */
