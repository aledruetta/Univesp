/*
 * File: Duas_Pilhas_Cpp/duas_pilhas.hpp
 * @author: Alejandro Druetta
 */

#ifndef DUAS_PILHAS_HPP
#define DUAS_PILHAS_HPP
#define MAX 20

typedef int Chave;

class Registro
{
    public:
        Chave chave;
        // outros membros
};

class DPilhas
{
    public:
        DPilhas ();
        void reinicializar ();
        void mostrar_esquerda () const;
        void mostrar_direita () const;
        unsigned tamanho_esquerda () const;
        unsigned tamanho_direita () const;
        bool inserir_esquerda ( const Registro );
        bool inserir_direita ( const Registro );
        bool excluir_esquerda ( Registro& );
        bool excluir_direita ( Registro& );

    private:
        bool inserir ( const Registro, unsigned extremo );
        bool excluir ( Registro&, unsigned extremo );
        void mostrar ( unsigned extremo ) const;

        Registro reg[MAX];
        int topo1;
        int topo2;
};

#endif /* DUAS_PILHAS_HPP */
