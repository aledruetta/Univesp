/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  19/07/2019 22:55:54
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Eng. Computação - Univesp
 *
 * =====================================================================================
 */

#include <iostream>
#include "Complex.h"

using namespace std;

int main ()
{
    Complex z (4, 6.9);
    cout << z << endl;
    cout << "Parte real:       " << z.real() << endl;
    cout << "Parte imaginária: " << z.imag() << "j" << endl;
    Complex w (3, 3);
    cout << z << endl;
    cout << "Módulo: " << z.module() << endl;
    cout << "Fase:   " << z.fase() << "°" << endl;

    return 0;
}

