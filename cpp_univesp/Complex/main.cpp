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
    z.real(3.1);
    z.imag(-8.02);
    cout << z << endl;

    return 0;
}

