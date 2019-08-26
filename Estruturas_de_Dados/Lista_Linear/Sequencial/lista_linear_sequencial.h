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

void inicializar_lseq (LSeq*);
bool adicionar_lseq (LSeq*, const Registro);
bool inserir_lseq (LSeq*, const Registro, const unsigned);
int procurar_lseq (const LSeq*, const Chave);
bool deletar_lseq (LSeq*, const Chave);
void ordenar_lseq (LSeq*, char);
void mostrar_lseq (const LSeq*);

#endif /* LISTA_LINEAR_SEQUENCIAL_H */
