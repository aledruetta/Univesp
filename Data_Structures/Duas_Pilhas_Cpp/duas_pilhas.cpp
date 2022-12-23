/*
 * File: Duas_Pilhas_Cpp/duas.cpp
 * @author: Alejandro Druetta
 *
 * Build: g++ -g -Wall main.cpp duas_pilhas.cpp
 */

#include <iostream>
#include "duas_pilhas.hpp"
using namespace std;

DPilhas::DPilhas ( )
{
    esquerda = -1;
    direita = MAX;
}

void DPilhas::reinicializar ()
{
    esquerda = -1;
    direita = MAX;
}

void DPilhas::mostrar ( unsigned extremo ) const
{
    cout << " Pilha " << (( extremo == ESQUERDA ) ? "Esquerda" : "Direita ") << " [ ";
    unsigned pos = ( extremo == ESQUERDA ) ? 0 : MAX - 1;
    unsigned tamanho =  ( extremo == ESQUERDA ) ? tamanho_esquerda ()
                                                : tamanho_direita ();
    unsigned cont = tamanho;
    while ( cont > 0 ) {
        cout << reg[pos].chave << " ";
        cont--;
        ( extremo == ESQUERDA ) ? pos++ : pos--;
    }
    cout << "] Tamanho: " << tamanho << endl;
}

bool DPilhas::inserir ( const Registro registro, unsigned extremo )
{
    if ( direita == esquerda + 1 ) return false;
    ( extremo == ESQUERDA ) ? esquerda++ : direita--;
    int topo = ( extremo == ESQUERDA ) ? esquerda : direita;
    reg[ topo ] = registro;

    return true;
}

bool DPilhas::excluir ( Registro &registro, unsigned extremo )
{
    int topo = ( extremo == ESQUERDA ) ? esquerda : direita;
    if ( topo == -1 || topo == MAX ) return false;
    registro = reg[ topo ];
    ( extremo == ESQUERDA ) ? esquerda-- : direita++;
    return true;
}

bool DPilhas::inserir_esquerda ( const Registro registro )
{
    return inserir ( registro, ESQUERDA);
}

bool DPilhas::inserir_direita ( const Registro registro )
{
    return inserir ( registro, DIREITA);
}

unsigned DPilhas::tamanho_esquerda () const
{
    return esquerda + 1;
}

unsigned DPilhas::tamanho_direita () const
{
    return MAX - direita;
}

void DPilhas::mostrar_esquerda () const
{
    mostrar ( ESQUERDA );
}

void DPilhas::mostrar_direita () const
{
    mostrar ( DIREITA );
}

bool DPilhas::excluir_esquerda ( Registro &registro )
{
    return excluir ( registro, ESQUERDA );
}

bool DPilhas::excluir_direita ( Registro &registro )
{
    return excluir ( registro, DIREITA );
}

