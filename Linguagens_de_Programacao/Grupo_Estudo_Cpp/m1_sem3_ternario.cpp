/*
 * =====================================================================================
 *
 *       Filename:  m1_sem3_ternario.cpp
 *
 *    Description:  Uso do operador ternário em C++.
 *
 *        Version:  1.0
 *        Created:  07/08/2019 19:43:59
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. Computação
 *
 * =====================================================================================
 */

#include <iostream>
#include <string>

using namespace std;

int main ()
{
    string resp = "";
    cout << "\nQual seu nome?\n>> ", getline (cin, resp);
    cout << "Prazer, " << resp << "! "
         << "Quantos anos você tem?\n>> ", getline (cin, resp);
    cout << "Entendi, então você é "
         << ((stoi (resp, nullptr, 10) < 18) ? "menor" : "maior") << " de idade.\n"
         << "Fala uma coisa, vc torce pro Corintians (sim/não)?\n>> ",
            getline (cin, resp);
    cout << "Olha só! Eu também" << ((resp == "sim") ? "!" : " não!")
         << " Que coincidência, não é?\n"
         << "Y fala outra coisa, vc já tem as notas do 8vo bimestre (sim/não)?\n>> ",
            getline (cin, resp);
    cout << ((resp == "sim") ? "Fala sério seu otário!" : "Sacanagem, não é?") << "\n"
         << endl;

    return 0;
}

