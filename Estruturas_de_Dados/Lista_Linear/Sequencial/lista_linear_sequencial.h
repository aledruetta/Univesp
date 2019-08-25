/*
 * File: Lista_Linear/Sequencial/lista_linear_sequencial.h
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
    // outros membros
} Registro;

typedef struct
{
    Registro regs[MAX];
    unsigned tamanho;
} LLSeq;

void inicializar_llseq (LLSeq*);
bool adicionar_llseq (LLSeq*, const Registro*);
bool inserir_llseq (LLSeq*, const Registro*, const unsigned);
int procurar_llseq (const LLSeq*, const Chave);
bool deletar_llseq (LLSeq*, const Chave);
void ordenar_llseq (LLSeq*, char);
void mostrar_llseq (const LLSeq*);

#endif /* LISTA_LINEAR_SEQUENCIAL_H */
