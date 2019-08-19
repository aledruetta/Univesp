/*
 * =====================================================================================
 *
 *       Filename:  m1_sem5_soma_matriz.cpp
 *
 *    Description:  Soma de matrizes
 *
 *        Version:  1.0
 *        Created:  18/08/2019 20:18:50
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Eng. Computação
 *
 * =====================================================================================
 */

#include <iostream>
#include <iomanip>
#define MAX 255
typedef unsigned SIZE;
typedef double MATRIZ_T;
using namespace std;

int main ()
{
    SIZE filas = 0;
    SIZE colunas = 0;
    MATRIZ_T matriz_A [MAX][MAX];
    MATRIZ_T matriz_B [MAX][MAX];

    cout << "\n\t *** Soma de Matrizes ***\n" << endl
         << " Filas?   ", cin >> filas;
    cout << " Colunas? ", cin >> colunas;

    cout << "\n Matriz A: " << endl;
    for (SIZE i=0; i<filas; i++) {
        for (SIZE j=0; j<colunas; j++) {
            cout << " Elem [" << i << ", " << j << "]: ", cin >> matriz_A [i][j];
        }
    }

    cout << "\n Matriz B: " << endl;
    for (SIZE i=0; i<filas; i++) {
        for (SIZE j=0; j<colunas; j++) {
            cout << " Elem [" << i << ", " << j << "]: ", cin >> matriz_B [i][j];
        }
    }

    cout << "\n Matriz A + B: " << endl;
    for (SIZE i=0; i<filas; i++) {
        cout << "\t[";
        for (SIZE j=0; j<colunas; j++) {
            MATRIZ_T result = matriz_A [i][j] + matriz_B [i][j];
            cout << setw (3) << result;
        }
        cout << " ]" << endl;
    }
    cout << endl;

    return 0;
}
