/*
 * File: Duas_Pilhas_Cpp/main.cpp
 * @author: Alejandro Druetta
 */

#include <iostream>
#include <ctime>
#include <string>
#include "duas_pilhas.hpp"

using namespace std;

void carregar_esquerda ( pilhaDupla::DPilhas &pilhas, unsigned num );
void carregar_direita ( pilhaDupla::DPilhas &pilhas, unsigned num );

int main ()
{
    srand (time (nullptr));
    unsigned ntest = 1;

    cout << "\n *** Testes ***" << endl;

    // inicializar
    cout << "\n Teste " << ntest << ": inicializar uma pilhas vacia." << endl;
    pilhaDupla::DPilhas pilhas;
    inicializar ( pilhas );
    mostrar_esquerda ( pilhas );
    mostrar_direita ( pilhas );

    // Inserir pela direita
    unsigned quant = 12;
    cout << "\n Teste " << ntest << ": Inserir registros pela direita." << endl;
    carregar_direita ( pilhas, quant );
    mostrar_esquerda ( pilhas );
    mostrar_direita ( pilhas );

    // Excluit pela direita
    cout << "\n Teste " << ntest << ": Excluir registros pela direita." << endl;
    pilhaDupla::Registro registro;
    for (unsigned i=0; i<quant-4; i++) {
        bool res = excluir_direita ( pilhas, registro );
        if ( res )
            cout << " Excluir registro chave: " << registro.chave << endl;
        else
            cout << " Erro: A lista está vacia!" << endl;
    }
    mostrar_esquerda ( pilhas );
    mostrar_direita ( pilhas );

    // Inserir pela esquerda
    quant = 18;
    cout << "\n Teste " << ntest << ": Inserir registros pela esquerda." << endl;
    carregar_esquerda ( pilhas, quant );
    mostrar_esquerda ( pilhas );
    mostrar_direita ( pilhas );

    // Excluir pela esquerda
    cout << "\n Teste " << ntest << ": Excluir registros pela esquerda." << endl;
    for (unsigned i=0; i<quant-4; i++) {
        bool res = excluir_esquerda ( pilhas, registro);
        if ( res )
            cout << " Excluir registro chave: " << registro.chave << endl;
        else
            cout << " Erro: A lista está vacia!" << endl;
    }
    mostrar_esquerda ( pilhas );
    mostrar_direita ( pilhas );

    // Reinicializar
    cout << "\n Teste " << ntest << ": Reinicializar Pilhas." << endl;
    reinicializar ( pilhas );
    mostrar_esquerda ( pilhas );
    mostrar_direita ( pilhas );

    return 0;
}

void carregar_pilhas ( pilhaDupla::DPilhas &pilhas, unsigned num, unsigned pilha )
{
    for (unsigned i=0; i<num; i++) {
        pilhaDupla::Registro registro = {(rand () % 100) - 50};
        bool res = ( pilha == 1 ) ? inserir_esquerda ( pilhas, registro )
                                  : inserir_direita ( pilhas, registro );
        if ( res )
            cout << " Adicionando chave: " << registro.chave << endl;
        else
            cout << " Erro: A pilhas está completa! chave: " << endl;
    }
}

void carregar_esquerda ( pilhaDupla::DPilhas &pilhas, unsigned num )
{
    carregar_pilhas ( pilhas, num, 1 );
}

void carregar_direita ( pilhaDupla::DPilhas &pilhas, unsigned num )
{
    carregar_pilhas ( pilhas, num, 2);
}

