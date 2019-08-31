/*
 * File: Lista_Ligada_Circular/lista_ligada_circular.h
 * @author: Alejandro Druetta
 */

#ifndef LISTA_LIGADA_CIRCULAR_H
#define LISTA_LIGADA_CIRCULAR_H

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
    Celula *cabeca;
} LCir;

void inicializar_lCir (LCir*);
void reinicializar_lCir (LCir*);
unsigned tamanho_lCir (const LCir*);
void mostrar_lCir (const LCir*);
Registro* buscaSeq_lCir (const LCir*, Chave);
Registro* buscaOrd_lCir (const LCir*, Chave);
bool inserir_lCir (LCir*, Registro);
bool deletar_lCir (LCir*, Chave);

#endif /* LISTA_LIGADA_CIRCULAR_H */

