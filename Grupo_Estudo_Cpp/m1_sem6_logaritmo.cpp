/*
 * =====================================================================================
 *
 *       Filename:  m1_sem6_logaritmo.cpp
 *
 *    Description:  Calcula logaritmo de um número.
 *
 *        Version:  1.0
 *        Created:  26/08/2019 09:26:00
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. Computação
 *
 * =====================================================================================
 */

#include <iostream>
#include <cstdlib>
#include <cmath>
#include <ctime>
using namespace std;

double logaritmo (double, double);

int main ()
{
    srand (time (NULL));
    cout << endl;
    for (int i=0; i<5; i++) {
        double n = double(rand () % 30);
        double b = double(rand () % 30);
        cout << " Log" << b << " ( " << n << " ) = "
             << logaritmo (n, b) << endl;
    }
    cout << endl;

    return 0;
}

double logaritmo (double num, double base)
{
    if (num <= 0 || base <= 0 || base == 1 ) return -1;
    if (num == 1) return 0;
    if (num == base) return 1;
    if (base == 10) return log10 (num);
    if (base == 2) return log2 (num);
    if (base >= 2.7182 && base <= 2.7183) return log (num);

    return log (num) / log (base);
}

