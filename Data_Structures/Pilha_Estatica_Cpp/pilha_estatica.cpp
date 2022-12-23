/*
 * File: Pilha_Estatica/pilha_estatica.cpp
 * @author: Alejandro Druetta
 */

#include <iostream>
#include "pilha_estatica.hpp"

PilhaEstatica::PilhaEstatica ()
{
    max_reg = 255;
    topo = -1;
    reg = new Registro[max_reg];
}

PilhaEstatica::PilhaEstatica ( unsigned max )
{
    max_reg = max;
    topo = -1;
    reg = new Registro[max_reg];
}

bool PilhaEstatica::adicionar ( const Registro registro )
{
    if (( topo + 1 ) >= (int) max_reg) return false;
    topo++;
    reg[ topo ] = registro;
    return true;
}

unsigned PilhaEstatica::getMax () const
{
    return max_reg;
}

unsigned PilhaEstatica::tamanho () const
{
    return topo + 1;
}

void PilhaEstatica::mostrar () const
{
    printf (" Lista [ ");
    for (int i=0; i<topo+1; i++)
        printf ("%d ", reg[i].chave);
    printf ("] Tamanho: %u\n", topo+1);
}

Registro* PilhaEstatica::extrair ()
{
    if (topo >= 0) {
        Registro* registro = &reg[ topo ];
        topo--;
        return registro;
    }
    return nullptr;
}

