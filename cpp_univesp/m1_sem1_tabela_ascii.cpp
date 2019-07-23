/*
 * =====================================================================================
 *
 *       Filename:  m1_sem1_tabela_ascii.cpp
 *
 *    Description:  Caracteres ASCII imprimíveis
 *
 *        Version:  1.0
 *        Created:  17/07/2019
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Eng. da Computação - Univesp
 *
 * =====================================================================================
 */

#include <iostream>
using namespace std;

int main()
{
    cout << "--------------------------------------------------------------" << endl
         << "                     *** Tabela ASCII ***                     " << endl
         << "--------------------------------------------------------------" << endl;
    for (unsigned char i=33; i<127; i++)
    {
        printf("%-3i: %c | ", i, i);
        if (i % 7 == 4) cout << endl;
    }
    cout << "\n--------------------------------------------------------------" << endl;

    return 0;
}

