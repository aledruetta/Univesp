/*
 * File: Lista_Linear/Sequencial/lista.h
 * @author: Alejandro Druetta
 */

#ifndef LISTA_LINEAR_SEQUENCIAL_H
#define LISTA_LINEAR_SEQUENCIAL_H

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
} LLSeq;

void inicializar_llseq (LLSeq*);
bool adicionar_llseq (LLSeq*, const Registro*);
void mostrar_llseq (const LLSeq*);
bool inserir_llseq (LLSeq*, const Registro*, unsigned);

#endif /* LISTA_LINEAR_SEQUENCIAL_H */
