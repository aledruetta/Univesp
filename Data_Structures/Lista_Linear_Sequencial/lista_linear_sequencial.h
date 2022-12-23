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
} LSeq;

void inicializar_lSeq (LSeq*);
bool adicionar_lSeq (LSeq*, const Registro);
bool inserir_lSeq (LSeq*, const Registro, const unsigned);
int procurar_lSeq (const LSeq*, const Chave);
bool deletar_lSeq (LSeq*, const Chave);
void ordenar_lSeq (LSeq*, char);
void mostrar_lSeq (const LSeq*);

#endif /* LISTA_LINEAR_SEQUENCIAL_H */
