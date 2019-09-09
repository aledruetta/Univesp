/*
 * File: Fila_Estatica/fila_estatica.h
 * @author: Alejandro Druetta
 */

#ifndef FILA_ESTATICA_H
#define FILA_ESTATICA_H
#define MAX 50
#include <stdbool.h>

typedef int Chave;

typedef struct
{
    Chave chave;
    // outros membros
} Registro;

typedef struct
{
    Registro reg[MAX];
    unsigned inicio;
    unsigned tamanho;
} FilaEst;

void inicializar_filaEst ( FilaEst* );
void mostrar_filaEst ( const FilaEst* );
unsigned  tamanho_filaEst ( const FilaEst* );
bool inserir_filaEst ( FilaEst*, const Registro );
bool excluir_filaEst ( FilaEst*, Registro** );
void reinicializar_filaEst ( FilaEst* );

#endif /* FILA_ESTATICA_H */
