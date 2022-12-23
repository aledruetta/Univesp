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

#define MAX 50

using namespace std;

int main ()
{
    char opcao = 's';

    cout << "\n **********   Menu   ********** \n" << endl
         << " R - Criar um novo resistor. \n"
         << " L - Criar um novo indutor. \n"
         << " C - Criar um novo capacitor. \n"
         << endl;
    cin >> opcao;
    opcao = tolower ( opcao );

    switch ( opcao ) {
        case 'r':
            cout << " Resistência em Ohms? "; cin >> ;
            cout << " Criado R" << index << " : " << endl
                 << " Valor de R: " << r.getResistencia () << endl
                 << endl;
            break;
    }

    return 0;
}
