/*
 * File: main.cpp
 * @author: Alejandro Druetta
 * Organization: Univesp - Eng. Computação
 *
 * Description: Testar classes de modelagem eletrônica.
 *
 * Build:
 *          $ make
 *          $ ./eletronica.out
 */

#include <iostream>
#include "resistor.hpp"
using namespace std;

int main ()
{
    unsigned res = 0;
    cout << "\n ********** Resistores ********** " << endl;
    cout << "\n Introduzir valor de R1 em Ohms? "; cin >> res;

    Resistor r1 ( res );

    cout << "\n Representação: "
         << r1
         << endl;
    cout << " Valor de R: "
         << r1.getResistencia() << endl;
    cout << " Valor de Z: "
         << r1.getImpedancia() << endl;
    cout << " Valor de G: "
         << r1.getCondutancia() << endl;

    cout << "\n Introduzir valor de R2 em Ohms? "; cin >> res;
    Resistor r2 ( res );

    cout << " R1 + R2 = " << r1.conectSerie ( r2 ) << endl;
    cout << " R1 // R2 = " << r1.conectParalelo ( r2 ) << endl;
    cout << endl;

    return 0;
}
