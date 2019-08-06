/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  Lista Ligada (Implementação Estática)
 *
 *        Version:  1.0
 *        Created:  06/08/2019 08:05:51
 *       Revision:  none
 *       Compiler:  g++
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. Computação
 *
 * =====================================================================================
 */

#include <iostream>
#include "static_linked_list.h"

using namespace std;

int main ()
{
    User user = userConstructor (209, "Alejandro");
    Node <User> node (user);

    cout << "Name: " << node.record.name << "\n"
         << "Id:   " << node.record.key  << "\n"
         << "Posição do próximo usuário: " << node.next_node
         << endl;

    return 0;
}

