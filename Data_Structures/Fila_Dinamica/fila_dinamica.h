/*
 * File: Fila_Dinamica/fila_dinamica.h
 * @author: Alejandro Druetta
 */

#ifndef FILA_DINAMICA_H
#define FILA_DINAMICA_H
#include <stdbool.h>

typedef int Chave;

typedef struct
{
    Chave chave;
    // outros membros
} Registro;

typedef struct aux
{
    Registro reg;
    struct aux *prox;
} Celula;

typedef struct
{
    Celula *inicio;
    Celula *fim;
} FilaDim;

void inicializar_filaDim ( FilaDim* );
void mostrar_filaDim ( const FilaDim* );
unsigned tamanho_filaDim ( const FilaDim* );
bool inserir_filaDim ( FilaDim*, const Registro );
bool excluir_filaDim ( FilaDim*, Registro* );
void reinicializar_filaDim ( FilaDim* );

#endif /* FILA_DINAMICA_H */
