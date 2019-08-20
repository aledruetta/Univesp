/*
 * =====================================================================================
 *
 *       Filename:  m1_sem1_fatorial.cpp
 *
 *    Description:  Cálculo do fatorial de um número inteiro
 *
 *        Version:  1.0
 *        Created:  23/07/2019 15:28:09
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Eng. Computação - Univesp
 *
 * =====================================================================================
 */

#include <iostream>
#include <iomanip>
using namespace std;

int main ()
{
    unsigned num, numd;
    long double fac;
    cout << "\nIngrese um inteiro possitivo menor ou igual do que 25." << endl;
    cout << "Número: ", cin >> num;
    numd = num;

    /* *
     * Loop FOR
     * */
    fac = 1;
    for (int i=1; i<=num; i++) fac *= i;
    cout << setw(24) << "Fatorial loop FOR: " << fac << endl;

    /* *
     * Loop WHILE
     * */
    fac = 1;
    while (num > 0) fac *= num--;
    cout << setw(24) << "Fatorial loop WHILE: " << fac << endl;

    /* *
     * Loop DO/WHILE
     * */
    fac = 1;
    do fac *= numd--;
    while (numd > 0);
    cout << setw(24) << "Fatorial loop DO/WHILE: " << fac << "\n"
         << endl;

    cout << to_string(fac) << endl;

    return 0;
}

