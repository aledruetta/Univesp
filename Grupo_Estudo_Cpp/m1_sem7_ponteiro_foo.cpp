/*
 * =====================================================================================
 *
 *       Filename:  m1_sem7_ponteiro_foo.cpp
 *
 *    Description:  Ponteiros e funções
 *
 *        Version:  1.0
 *        Created:  02/09/2019 21:50:07
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

void foo (int *ptr);

int main ()
{
    int var = 0;
    int *ptr = &var;
    cout << "ENDEREÇO de ptr ANTES  de foo: " << &ptr << endl
         << "VALOR    de ptr ANTES  de foo: " << ptr << "\n"
         << endl;
    foo (ptr);
    cout << "ENDEREÇO de ptr DEPOIS de foo: " << &ptr << endl
         << "VALOR    de ptr DEPOIS de foo: " << ptr << "\n"
         << endl;

    return 0;
}

void foo (int *ptr)
{
    cout << "ENDEREÇO de ptr DENTRO de foo: " << &ptr << endl
         << "VALOR    de ptr DENTRO de foo: " << ptr << "\n"
         << endl;
}

