#include <iostream>
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

double Resistor::getCondutancia () const
{
    return 1 / (double) resistencia_;
}

void Resistor::getCodigoCores () const
{
    if (resistencia_ <= 0) return;

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

    cout << "[ ";
    for (auto cod : codigo) {
        switch (cod) {
            case preto:    cout << "preto "    ; break;
            case marrom:   cout << "marrom "   ; break;
            case vermelho: cout << "vermelho " ; break;
            case laranja:  cout << "laranja "  ; break;
            case amarelo:  cout << "amarelo "  ; break;
            case verde:    cout << "verde "    ; break;
            case azul:     cout << "azul "     ; break;
            case roxo:     cout << "roxo "     ; break;
            case cinza:    cout << "cinza "    ; break;
            case branco:   cout << "branco "   ; break;
        }
    }
    cout << "]" << endl;
}
