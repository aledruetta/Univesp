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
} LLOrd;

void inicializar_llord (LLOrd*);
bool adicionar_llord (LLOrd*, const Registro*);
bool inserir_llord (LLOrd*, const Registro*, const unsigned);
int procurar_llord (const LLOrd*, const Chave);
bool deletar_llord (LLOrd*, const Chave);
void mostrar_llord (const LLOrd*);

#endif /* LISTA_LINEAR_ORDENADA_H */
