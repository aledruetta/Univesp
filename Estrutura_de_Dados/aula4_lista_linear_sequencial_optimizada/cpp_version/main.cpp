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
#include <cstdlib>                  // rand()
#include "Register.hpp"
#include "LinearSeqList.hpp"


int main()
/*
 * Função: main.
 */
{
    LinearSeqList list;
    list.show();
    for (int i=0; i<10; i++)
    {
        Register reg(rand() % 100);
        if (!list.append(reg)) cout << "Não há mais espaço na lista!" << endl;
    }
    list.show();

    return 0;
}

