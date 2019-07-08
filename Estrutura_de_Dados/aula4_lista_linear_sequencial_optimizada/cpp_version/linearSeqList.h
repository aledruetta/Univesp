/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    linearSeqList.h
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   8vo
 * Autor:      Alejandro Druetta
 * Data:       06/07/2019
 */

#ifndef UNIVESP_LINEARSEQLIST_H
#define UNIVESP_LINEARSEQLIST_H

#include <iostream>
#include <cstdlib>                  // rand, srand
#include <ctime>                    // time
#include "register.h"

using namespace std;
const int MAX = 50;                 // Quantidade máxima de registros


class LinearSeqList
/*
 * Classe: LinearSeqList
 *
 * A classe LinearSeqList é uma lista linear sequencial
 * de elementos do tipo Register.
 */
{
        int len;
        Register regs[MAX+1];

    public:

        LinearSeqList();
        bool generate(int num);
        void sortIns();                 // Insertion sort
        void sortBub();                 // Bubble sort
        bool append(Register reg);
        bool insert(Register reg, int pos);
        int findSent(int key);          // Busca por sentinela
        int findBin(int key);           // Busca binária
        bool del(int key);
        void show();
};

#endif

