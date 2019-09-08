#include <iostream>
#include <sstream>
#include <string>
#include "eletronica.hpp"

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

ostream& operator<< ( ostream& os, const Resistor res)
{
    os << res.getEngSimbol () << " "
       << res.getCodigoCores ();

    return os;
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
    ss << "]" << endl;

    return ss.str();
}
