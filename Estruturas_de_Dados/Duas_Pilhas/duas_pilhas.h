/*
 * File: Duas_Pilhas/duas_pilhas.h
 * @author: Alejandro Druetta
 */

#ifndef DUAS_PILHAS_H
#define DUAS_PILHAS_H
#define MAX 20
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
} DPilhas;

void inicializar_dPilhas ( DPilhas* );
void mostrar_dPilhas ( const DPilhas* );
unsigned tamanho_dPilhas ( const DPilhas* );
bool inserir_dPilhas ( DPilhas*, const Registro );
bool excluir_dPilhas ( DPilhas*, Registro* );
void reinicializar_dPilhas ( DPilhas* );

#endif /* DUAS_PILHAS_H */
