/*
 * File: Matriz_Esparsa/matriz_esparsa.h
 * @author: Alejandro Druetta
 */

#ifndef MATRIZ_ESPARSA_H
#define MATRIZ_ESPARSA_H

typedef struct aux
{
    double valor;
    unsigned col;
    struct aux *prox;
} No;

typedef struct
{
    No **nos;
    unsigned lin;
    unsigned col;
} MatrizE;

void inicializar ( MatrizE*, unsigned, unsigned );
void mostrar ( const MatrizE* );
bool atribuir ( MatrizE*, unsigned, unsigned, double );
// bool acessar (MatrizE*, Chave);

#endif /* MATRIZ_ESPARSA_H */

