/*
 * File: resistor.cpp
 * @author: Alejandro Druetta
 * Organization: Univesp - Eng. Computação
 *
 * Description: Uma classe para modelar resistores.
 */

#include <iostream>
#include <sstream>
#include <string>
#include "resistor.hpp"

using namespace std;

Resistor::Resistor ( unsigned resistencia )
{
    resistencia_ = resistencia;
}

unsigned Resistor::getResistencia () const
{
    return resistencia_;
}

string Resistor::getEngSimbol () const
{
    char engSim[] = "RkMGTP";
    unsigned cont = 0;
    double resto = (double) getResistencia ();
    while (resto > 1e3) {
        resto /= 1e3;
        cont++;
    }

    stringstream ss;
    ss << resto << engSim[cont];

    return ss.str();
}

double Resistor::getCondutancia () const
{
    return 1 / (double) resistencia_;
}

string Resistor::getCodigoCores () const
{
    if (resistencia_ <= 0) return "";

    enum Color { preto, marrom, vermelho, laranja, amarelo, verde, azul,
                 roxo, cinza, branco };

    unsigned digito[12];
    unsigned resto = resistencia_;
    unsigned i = 0;

    while (resto > 0) {
        digito[i] = resto % 10;
        resto /= 10;
        i++;
    }

    unsigned codigo[3] = {};
    codigo[0] = digito[i-1];        // primeira cor
    if (i >= 2) {
        codigo[1] = digito[i-2];    // segunda cor
        codigo[2] = i - 2;          // multiplicador
    }

    stringstream ss;

    ss << "[ ";
    for (auto cod : codigo) {
        switch (cod) {
            case preto:    ss << "preto "    ; break;
            case marrom:   ss << "marrom "   ; break;
            case vermelho: ss << "vermelho " ; break;
            case laranja:  ss << "laranja "  ; break;
            case amarelo:  ss << "amarelo "  ; break;
            case verde:    ss << "verde "    ; break;
            case azul:     ss << "azul "     ; break;
            case roxo:     ss << "roxo "     ; break;
            case cinza:    ss << "cinza "    ; break;
            case branco:   ss << "branco "   ; break;
        }
    }
    ss << "]";

    return ss.str();
}

Resistor& Resistor::conectSerie ( Resistor r ) const
{
    return *(new Resistor ( resistencia_ + r ));
}

Resistor& Resistor::conectParalelo ( Resistor r ) const
{
    unsigned req = ( resistencia_ * r.getResistencia() )
                 / ( resistencia_ + r.getResistencia() );
    return *(new Resistor ( req ));
}

ostream& operator<< ( ostream& os, const Resistor res)
{
    os << res.getEngSimbol () << " "
       << res.getCodigoCores ();

    return os;
}

Resistor& operator+ ( const Resistor &r1, const Resistor &r2 )
{
    unsigned req = r1.getResistencia() + r2.getResistencia();
    return *( new Resistor( req ) );
}

