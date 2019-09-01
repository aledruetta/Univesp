/*
 * File: Pilha_Estatica/pilha_estatica.hpp
 * @author: Alejandro Druetta
 */

#ifndef PILHA_ESTATICA_HPP
#define PILHA_ESTATICA_HPP

typedef int Chave;

struct Registro
{
    Chave chave;
    // outros membros
};

class PilhaEstatica
{
    public:
        PilhaEstatica ();
        PilhaEstatica ( unsigned max );
        unsigned getMax () const;
        void mostrar () const;
        unsigned tamanho () const;
        bool adicionar ( const Registro );
        Registro* extrair ();
    private:
        unsigned max_reg;
        Registro *reg;
        int topo;
};

#endif /* PILHA_ESTATICA_HPP */
