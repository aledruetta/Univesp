/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    LinearSeqList.h
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   9°
 * Autor:      Alejandro Druetta
 * Data:       06/07/2019
 */

#ifndef UNIVESP_LINEARSEQLIST_H
#define UNIVESP_LINEARSEQLIST_H


class LinearSeqList
/*
 * Classe: LinearSeqList
 *
 * A classe LinearSeqList é uma lista linear sequencial
 * de elementos do tipo Register.
 */
{
    public:
        LinearSeqList (int maxSize);
        bool generate (int num);
        Register& operator[] (int i);
        bool append (Register reg);
        bool insert (Register reg, int pos);
        void sort ();
        int find (int key);
        bool del (int key);
        void show ();
    private:
        int _maxSize;
        int _len;
        Register* _regs;
        bool _is_sorted;
        int _findSent (int key);         // Busca por sentinela
        int _findBin (int key);          // Busca binária
        void _sortIns ();                // Insertion sort
        void _sortBub ();                // Bubble sort
};

#endif

