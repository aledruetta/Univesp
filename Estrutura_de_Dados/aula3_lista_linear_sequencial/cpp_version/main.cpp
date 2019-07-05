/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL
 *
 * Arquivo:    main.cpp
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   8vo
 * Autor:      Alejandro Druetta
 * Data:       05/07/2019
 */

#include <iostream>
#include <cstdlib>                  // rand, srand
#include <ctime>                    // time
#include "Register.hpp"
#include "LinearSeqList.hpp"


int main()
/*
 * Função: main.
 */
{
    LinearSeqList list;
    list.show();
    srand(time(nullptr));

    for (int i=0; i<10; i++)
    {
        Register reg(rand() % 100);
        if (!list.append(reg)) cout << "Não há mais espaço na lista!" << endl;
    }
    list.show();

    int key;
    int pos;

    cout << "Adicionar? ";
    cin >> key;
    list.append(key);
    list.show();

    cout << "Adicionar? ";
    cin >> key;
    cout << "Posição? ";
    cin >> pos;
    list.append(key, pos);
    list.show();

    cout << "Deletar? ";
    cin >> pos;
    list.del(pos);
    list.show();

    return 0;
}

