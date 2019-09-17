/*
 * File: Duas_Pilhas_Cpp/main.cpp
 * @author: Alejandro Druetta
 *
 * Build: g++ -g -Wall main.cpp duas_pilhas.cpp
 */

#include <iostream>
#include <ctime>
#include <string>
#include "duas_pilhas.hpp"

using namespace std;

void carregar_esquerda ( DPilhas &pilhas, unsigned num );
void carregar_direita ( DPilhas &pilhas, unsigned num );

int main ()
{
    srand (time (nullptr));
    unsigned ntest = 1;

    cout << "\n *** Testes ***" << endl;

    // inicializar
    cout << "\n Teste " << ntest << ": inicializar uma pilhas vacia." << endl;
    DPilhas pilhas;
    pilhas.mostrar_esquerda ();
    pilhas.mostrar_direita ();

    // Inserir pela direita
    unsigned quant = 12;
    cout << "\n Teste " << ntest << ": Inserir registros pela direita." << endl;
    carregar_direita ( pilhas, quant );
    pilhas.mostrar_esquerda ();
    pilhas.mostrar_direita ();

    // Excluit pela direita
    cout << "\n Teste " << ntest << ": Excluir registros pela direita." << endl;
    Registro registro;
    for (unsigned i=0; i<quant-4; i++) {
        bool res = pilhas.excluir_direita ( registro );
        if ( res )
            cout << " Excluir registro chave: " << registro.chave << endl;
        else
            cout << " Erro: A lista está vacia!" << endl;
    }
    pilhas.mostrar_esquerda ();
    pilhas.mostrar_direita ();

    // Inserir pela esquerda
    quant = 18;
    cout << "\n Teste " << ntest << ": Inserir registros pela esquerda." << endl;
    carregar_esquerda ( pilhas, quant );
    pilhas.mostrar_esquerda ();
    pilhas.mostrar_direita ();

    // Excluir pela esquerda
    cout << "\n Teste " << ntest << ": Excluir registros pela esquerda." << endl;
    for (unsigned i=0; i<quant-4; i++) {
        bool res = pilhas.excluir_esquerda ( registro);
        if ( res )
            cout << " Excluir registro chave: " << registro.chave << endl;
        else
            cout << " Erro: A lista está vacia!" << endl;
    }
    pilhas.mostrar_esquerda ();
    pilhas.mostrar_direita ();

    // Reinicializar
    cout << "\n Teste " << ntest << ": Reinicializar Pilhas." << endl;
    pilhas.reinicializar ();
    pilhas.mostrar_esquerda ();
    pilhas.mostrar_direita ();

    return 0;
}

void carregar_pilhas ( DPilhas &pilhas, unsigned num, unsigned pilha )
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {(rand () % 100) - 50};
        bool res = ( pilha == 1 ) ? pilhas.inserir_esquerda ( registro )
                                  : pilhas.inserir_direita ( registro );
        if ( res )
            cout << " Adicionando chave: " << registro.chave << endl;
        else
            cout << " Erro: A pilhas está completa! chave: " << endl;
    }
}

void carregar_esquerda ( DPilhas &pilhas, unsigned num )
{
    carregar_pilhas ( pilhas, num, 1 );
}

void carregar_direita ( DPilhas &pilhas, unsigned num )
{
    carregar_pilhas ( pilhas, num, 2);
}

