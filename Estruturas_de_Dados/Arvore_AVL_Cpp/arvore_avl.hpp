/*
 * File: Arvore_AVL/arvore_avl.hpp
 * @author: Alejandro Druetta
 */

#ifndef ARVORE_AVL_HPP
#define ARVORE_AVL_HPP

typedef int Chave;

class No
{
    public:
        No ( Chave chave );
        Chave chave;
        No *esq;
        No *dir;
        int altura;
};

No::No ( Chave chave )
{
    this->chave = chave;
    esq = nullptr;
    dir = nullptr;
    altura = 0;
}

class ArvoreAVL
{
    public:
        ArvoreAVL ();
        No* procurar ( Chave chave );
        adicionar ( No *novo );
        void mostrar ();
        // unsigned tamanho ( const No *raiz );
        // No* remover ( No *raiz, Chave chave );
        // void reinicializar ( ArvoreBB* );
    private:
        No* procurar ( No *raiz, Chave chave );
        No *raiz;
};

ArvoreAVL::ArvoreAVL ()
{
    raiz = nullptr;
}

No* ArvoreAVL::procurar ( Chave chave )
{
    return procurar ( raiz, chave );
}

No* ArvoreAVL::procurar ( No *raiz, Chave chave )
{
    if ( raiz == nullptr || raiz->chave == chave ) return raiz;
    if ( chave < raiz->chave ) procurar ( raiz->esq, chave );
    return procurar ( raiz->dir, chave );
}

void ArvoreAVL::adicionar ( No *novo )
{
    No *procurar ( novo->chave );
}

#endif /* ARVORE_AVL_HPP */
