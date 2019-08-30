/*
 * File: Lista_Ligada_Dinamica/lista_ligada_dinamica.h
 * @author: Alejandro Druetta
 */

#ifndef LISTA_LIGADA_DINAMICA_H
#define LISTA_LIGADA_DINAMICA_H

typedef int Chave;

typedef struct
{
    Chave chave;
    // outros campos
} Registro;

typedef struct aux
{
    Registro reg;
    struct aux *prox;
} Celula;

typedef struct
{
    Celula *ini;
} LDim;

void inicializar_lDim (LDim*);
unsigned tamanho_lDim (const LDim*);
void mostrar_lDim (const LDim*);

#endif /* LISTA_LIGADA_DINAMICA_H */

