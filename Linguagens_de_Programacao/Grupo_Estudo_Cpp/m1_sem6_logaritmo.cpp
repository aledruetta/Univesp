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
#include <cmath>   // log, log2 e log10
#include <cstdlib> // rand, srand
#include <ctime>   // time
using namespace std;

double logaritmo (double, double);

int main ()
{
    srand (time (NULL));
    cout << endl;
    // Gera 5 números aleatórios e
    // imprime o resultado
    double n, b;
    for (int i=0; i<5; i++) {
        n = double(rand () % 30);
        b = double(rand () % 30);
        cout << " Log" << b << " ( " << n << " ) = "
             << logaritmo (n, b) << endl;
    }
    cout << endl;

    return 0;
}

double logaritmo (double num, double base)
{
    // Aplica as restrições dos logaritmos
    // base e logaritmando positivos
    // base diferente de 1
    if (num <= 0 || base <= 0 || base == 1 ) return -1;
    // Logaritmo de 1 em qualquer base = 0
    if (num == 1) return 0;
    // base igual logaritmando = 1
    if (num == base) return 1;
    // base 10
    if (base == 10) return log10 (num);
    // base 2
    if (base == 2) return log2 (num);

    // Aplica mudança de base para qualquer
    // outro caso
    return log (num) / log (base);
}

