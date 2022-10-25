/*
 * =====================================================================================
 *
 *       Filename:  m1_sem6_ponteiro.cpp
 *
 *    Description:  Exemplo ponteiro sem inicialização
 *
 *        Version:  1.0
 *        Created:  27/08/2019 15:39:20
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

int main ()
{
    int *ptr;
    cout << "ptr aponta para:       " << ptr << endl;

    int a = 7;
    cout << "Endereço de a:         " << &a << endl;
    ptr = &a;
    cout << "ptr agora aponta para: " << ptr << endl;

    return 0;
}

