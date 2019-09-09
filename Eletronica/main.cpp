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
    double res = 0,
           ten = 0,
           cor = 0;

    cout << "\n ********** Resistores ********** " << endl;
    cout << "\n Introduzir valor de R1 em Ohms? "; cin >> res;

    Resistor r1 ( res );

    cout << "\n Representação: "
         << r1
         << endl;
    cout << " Valor de R: "
         << r1.getResistencia() << endl;
    cout << " Valor de Z: "
         << r1.getZ() << endl;
    cout << " Valor de G: "
         << r1.getCondutancia() << endl;

    cout << "\n Tensão em volts? "; cin >> ten;
    cout << " O valor da corrente será: " << r1.getI ( ten ) << endl;

    cout << "\n Corrente em ampéres? "; cin >> cor;
    cout << " O valor da tensão será: " << r1.getV ( cor ) << endl;

    cout << "\n Introduzir valor de R2 em Ohms? "; cin >> res;
    Resistor r2 ( res );

    cout << " R1 + R2 = " << r1.conectSerie ( r2 ) << endl;
    cout << " R1 // R2 = " << r1.conectParalelo ( r2 ) << endl;
    cout << endl;

    return 0;
}
