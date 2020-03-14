/*
 * =====================================================================================
 *
 *       Filename:  m2_classeExemplo.cpp
 *
 *    Description:  Exemplo Classe
 *
 *        Version:  1.0
 *        Created:  16/09/2019 11:38:14
 *       Revision:  none
 *       Compiler:  g++
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. Computação
 *
 * =====================================================================================
 */

#include <iostream>
using namespace std;

class MinhaClasse
{
    public:
        int atributo;
        void metodo ( int parametro );
};

void MinhaClasse::metodo ( int parametro )
{
    cout << "Atributo: " << atributo << endl;
    cout << "Parâmetro do método: " << parametro << endl;
}

int main ()
{
    MinhaClasse mc = { 5 };
    mc.metodo ( 7 );

    return 0;
}

