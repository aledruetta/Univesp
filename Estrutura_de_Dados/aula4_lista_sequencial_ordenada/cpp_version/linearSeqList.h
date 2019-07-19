/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    linearSeqList.h
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   9°
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


class LinearSeqList
/*
 * Classe: LinearSeqList
 *
 * A classe LinearSeqList é uma lista linear sequencial
 * de elementos do tipo Register.
 */
{
    public:
        LinearSeqList(int maxSize);
        bool generate(int num);
        void sortIns();                 // Insertion sort
        void sortBub();                 // Bubble sort
        bool append(Register reg);
        bool insert(Register reg, int pos);
        int find(int key);
        bool del(int key);
        void show();
    private:
        int _maxSize;
        int _len;
        Register* _regs;
        bool _is_ordered;
        int _findSent(int key);         // Busca por sentinela
        int _findBin(int key);          // Busca binária
};

#endif

