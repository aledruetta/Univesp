/*
 * =====================================================================================
 *
 *       Filename:  m1_sem_4_soma_vetores.cpp
 *
 *    Description:  Soma de vetores.
 *
 *        Version:  1.0
 *        Created:  10/08/2019 21:00:28
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. Computação
 *
 * =====================================================================================
 */

#include <iostream>
using namespace std;

// define uma constante MAX_SIZE de valor 50 para
// inicializar os arrays
#define MAX_SIZE 50

int main ()
{
    // size_t é o tipo recomendado para iterar arrays
    size_t sz = 0;
    // inicializa os arrays de tamanho MAX_SIZE
    // atribuindo o valor 0 a cada elemento
    int A[MAX_SIZE] = {};
    int B[MAX_SIZE] = {};
    int R[MAX_SIZE] = {};

    cout << "\n\t*** Soma de vetores ***\n"
         << "\n\tEntrada: 2 vetores de tipo inteiros.\n"
         << "\tFormato: X1 X2 X3 ... Xn\n\n"
         << "\tTamanho? ", cin >> sz;

    // entra os valores de A
    cout << "\n\tA? ";
    for (size_t i=0; i<sz; i++)
        cin >> A[i];

    // entra os valores de B
    cout << "\tB? ";
    for (size_t i=0; i<sz; i++)
        cin >> B[i];
    cout << endl;

    // imprime A formatado
    cout << "\tA = { ";
    for (size_t i=0; i<sz; i++) {
        cout << A[i];
        cout << ((i < sz - 1) ? ", " : " ");
    }
    cout << "}" << endl;

    // imprime B formatado
    cout << "\tB = { ";
    for (size_t i=0; i<sz; i++) {
        cout << B[i];
        cout << ((i < sz - 1) ? ", " : " ");
    }
    cout << "}" << endl;

    // soma elemento a elemento e atribui o
    // resultado pro vetor R
    for (size_t i=0; i<sz; i++)
        R[i] = A[i] + B[i];

    // imprime R formatado
    cout << "\n\tA + B = { ";
    for (size_t i=0; i<sz; i++) {
        cout << R[i];
        cout << ((i < sz - 1) ? ", " : " ");
    }
    cout << "}\n" << endl;

    return 0;
}

