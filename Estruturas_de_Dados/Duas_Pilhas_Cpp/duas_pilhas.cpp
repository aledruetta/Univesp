/*
 * File: Duas_Pilhas_Cpp/duas.cpp
 * @author: Alejandro Druetta
 */

#include <iostream>
#include "duas_pilhas.hpp"
using namespace std;

DPilhas::DPilhas ( )
{
    topo1 = -1;
    topo2 = MAX;
}

void DPilhas::reinicializar ()
{
    topo1 = -1;
    topo2 = MAX;
}

void DPilhas::mostrar ( unsigned extremo ) const
{
    cout << " Pilha " << (( extremo == 1 ) ? "Esquerda" : "Direita ") << " [ ";
    unsigned pos = ( extremo == 1 ) ? 0 : MAX - 1;
    unsigned tamanho =  ( extremo == 1 ) ? tamanho_esquerda ()
                                       : tamanho_direita ();
    unsigned cont = tamanho;
    while ( cont > 0 ) {
        cout << reg[pos].chave << " ";
        cont--;
        ( extremo == 1 ) ? pos++ : pos--;
    }
    cout << "] Tamanho: " << tamanho << endl;
}

bool DPilhas::inserir ( const Registro registro, unsigned extremo )
{
    if ( topo2 == topo1 + 1 ) return false;
    ( extremo == 1 ) ? topo1++ : topo2--;
    int topo = ( extremo == 1 ) ? topo1 : topo2;
    reg[ topo ] = registro;

    return true;
}

bool DPilhas::excluir ( Registro &registro, unsigned extremo )
{
    int topo = ( extremo == 1 ) ? topo1 : topo2;
    if ( topo == -1 || topo == MAX ) return false;
    registro = reg[ topo ];
    ( extremo == 1 ) ? topo1-- : topo2++;
    return true;
}

bool DPilhas::inserir_esquerda ( const Registro registro )
{
    return inserir ( registro, 1);
}

bool DPilhas::inserir_direita ( const Registro registro )
{
    return inserir ( registro, 2);
}

unsigned DPilhas::tamanho_esquerda () const
{
    return topo1 + 1;
}

unsigned DPilhas::tamanho_direita () const
{
    return MAX - topo2;
}

void DPilhas::mostrar_esquerda () const
{
    mostrar ( 1 );
}

void DPilhas::mostrar_direita () const
{
    mostrar ( 2 );
}

bool DPilhas::excluir_esquerda ( Registro &registro )
{
    return excluir ( registro, 1 );
}

bool DPilhas::excluir_direita ( Registro &registro )
{
    return excluir ( registro, 2 );
}

