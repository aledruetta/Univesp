/*
 * File: Duas_Pilhas_Cpp/duas_pilhas.hpp
 * @author: Alejandro Druetta
 */

#ifndef DUAS_PILHAS_HPP
#define DUAS_PILHAS_HPP
#define MAX 20

namespace pilhaDupla
{
    typedef int Chave;

    typedef struct
    {
        Chave chave;
        // outros membros
    } Registro;

    typedef struct
    {
        int topo1;
        int topo2;
        Registro reg[MAX];
    } DPilhas;

    void inicializar ( DPilhas& );
    void mostrar_esquerda ( const DPilhas& );
    void mostrar_direita ( const DPilhas& );
    unsigned tamanho_esquerda ( const DPilhas& );
    unsigned tamanho_direita ( const DPilhas& );
    bool inserir_esquerda ( DPilhas&, const Registro );
    bool inserir_direita ( DPilhas&, const Registro );
    bool excluir_esquerda ( DPilhas&, Registro& );
    bool excluir_direita ( DPilhas&, Registro& );
    void reinicializar ( DPilhas& );
}

#endif /* DUAS_PILHAS_HPP */
