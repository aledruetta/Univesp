/*
 * File: main.cpp
 * @author: Alejandro Druetta
 * Organization: Univesp - Eng. Computação
 *
 * Description: Testar classes de modelagem eletrônica.
 */

#include <iostream>
#include "resistor.hpp"
using namespace std;

int main ()
{
    unsigned res = 0;
    cout << "\n ********** Resistores ********** " << endl;
    cout << "\n Introduzir valor de R em Ohms? "; cin >> res;

    Resistor r1 (res);

    cout << "\n Representação: "
         << r1
         << endl;
    cout << " Valor de R: "
         << r1.getResistencia() << endl;
    cout << " Valor de G: "
         << r1.getCondutancia() << endl;
    cout << endl;

    return 0;
}
