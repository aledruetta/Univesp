/*
 * =====================================================================================
 *
 *       Filename:  m1_sem5_determinante.cpp
 *
 *    Description:  Calcula o determinante de uma matriz 3x3
 *
 *        Version:  1.0
 *        Created:  20/08/2019 22:27:01
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. Computação
 *
 * =====================================================================================
 */

#include <iostream>
#define SIZE 3
using namespace std;

int main ()
{
    int M[SIZE][SIZE+2];

    cout << "\n*** Cálculo Determinante *** \n" << endl;
    for (unsigned i=0; i<SIZE; i++) {
        cout << "Linha " << i << ": ";
        cin >> M[i][0]
            >> M[i][1]
            >> M[i][2];
    }

    for (unsigned i=0; i<SIZE; i++) {
        for (unsigned j=0; j<SIZE-1; j++) {
            M[i][j+SIZE] = M[i][j];
        }
    }

    int deter = 0;
    for (unsigned i=0; i<SIZE; i++) {
        deter += M[0][i] * (M[1][i+1] * M[2][i+2] - M[1][i+2] * M[2][i+1]);
    }

    cout << "\nDeterminante = " << deter << "\n" << endl;

    return 0;
}

