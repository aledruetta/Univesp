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
    int topo1;
    int topo2;
    Registro reg[MAX];
} DPilhas;

void inicializar_dPilhas ( DPilhas* );
void mostrar1_dPilhas ( const DPilhas* );
void mostrar2_dPilhas ( const DPilhas* );
unsigned tamanho1_dPilhas ( const DPilhas* );
unsigned tamanho2_dPilhas ( const DPilhas* );
bool inserir1_dPilhas ( DPilhas*, const Registro );
bool inserir2_dPilhas ( DPilhas*, const Registro );
bool excluir1_dPilhas ( DPilhas*, Registro* );
bool excluir2_dPilhas ( DPilhas*, Registro* );
void reinicializar_dPilhas ( DPilhas* );

#endif /* DUAS_PILHAS_H */
