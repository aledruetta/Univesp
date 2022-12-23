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
    mylibs::Complex z (4, 6.9);
    cout << z << endl;
    cout << "Parte real:       " << z.real() << endl;
    cout << "Parte imaginária: " << z.imag() << "j\n" << endl;
    mylibs::Complex w (3, 3);
    cout << w << endl;
    cout << "Módulo: " << w.module() << endl;
    cout << "Fase:   " << w.fase() << "°" << endl;

    return 0;
}

