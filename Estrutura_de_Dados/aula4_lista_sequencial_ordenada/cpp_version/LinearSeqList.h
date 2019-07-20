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
        LinearSeqList (int);
        bool generate (int);
        Register& operator[] (int);
        bool append (Register);
        bool insert (Register, int);
        void sort ();
        int find (int);
        bool del (int);
        void show ();
    private:
        int _maxSize;
        int _len;
        Register* _regs;
        bool _is_sorted;
        int _findSent (int);         // Busca por sentinela
        int _findBin (int);          // Busca binária
        void _sortIns ();                // Insertion sort
        void _sortBub ();                // Bubble sort
};

#endif

