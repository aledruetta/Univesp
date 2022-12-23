/*
 * =====================================================================================
 *
 *       Filename:  m1_sem2_menu1.cpp
 *
 *    Description:  Modelo de menu usando Switch/Case
 *
 *        Version:  1.0
 *        Created:  28/07/2019 16:34:00
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
    bool flag = true;
    char op;

    while (flag)
    {
        cout << "\n    *** Menu ***\n\n"
             << "    Opção 1\n"
             << "    Opção 2\n"
             << "    Opção 3\n"
             << "    Opção 4\n"
             << "    Opção 5\n"
             << "    Sair  S\n"
             << endl;

        cout << "    Opção? ", op = getchar();
        op = tolower(op);

        switch (op)
        {
            case '1':
                cout << "    Você digitou a opção " << op << endl;
                break;
            case '2':
                cout << "    Você digitou a opção " << op << endl;
                break;
            case '3':
                cout << "    Você digitou a opção " << op << endl;
                break;
            case '4':
                cout << "    Você digitou a opção " << op << endl;
                break;
            case '5':
                cout << "    Você digitou a opção " << op << endl;
                break;
            case 's':
                cout << "    Saíndo..." << endl;
                flag = false;
                break;
            default:
                cout << "    Opção inválida!" << endl;
        }
    }

    return 0;
}

