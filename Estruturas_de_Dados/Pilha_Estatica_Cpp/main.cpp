/*
 * File: Pilha_Estatica/main.cpp
 * @author: Alejandro Druetta
 */

#include <iostream>
#include <ctime>

#include "pilha_estatica.hpp"
using namespace std;

void carregar_pilha (PilhaEstatica*, unsigned);

int main ()
{
    srand (time (NULL));
    unsigned ntest = 1;

    cout << "\n *** Testes ***" << endl;

    // inicializar
    cout << "\n Teste " << ntest++ << ": testar construtores." << endl;
    PilhaEstatica pilha;
    pilha.mostrar ();
    PilhaEstatica pilha2 (10);
    pilha2.mostrar (); cout << endl;

    // Adicionar
    cout << "\n Teste " << ntest++ << ": Adicionar registros." << endl;
    carregar_pilha (&pilha2, pilha2.getMax() + 2);
    pilha2.mostrar (); cout << endl;
    carregar_pilha (&pilha, 12);
    pilha.mostrar (); cout << endl;

    // Extrair
    unsigned quantidade = pilha.tamanho() - 4;
    cout << "\n Teste " << ntest++ << ": Deletar " << quantidade <<" registros." << endl;
    Registro* registro = nullptr;
    for (unsigned i=0; i<quantidade; i++) {
        registro = pilha.extrair ();
        cout << " Deletando registro chave: " << registro->chave << endl;
    }
    pilha.mostrar ();

    quantidade = pilha.tamanho() + 2;
    cout << "\n Teste " << ntest++ << ": Deletar " << quantidade << " registros." << endl;
    registro = nullptr;
    for (unsigned i=0; i<quantidade; i++) {
        registro = pilha.extrair ();
        if (registro)
        cout << " Deletando registro chave: " << registro->chave << endl;
        else
            cout << " Lista vacia!" << endl;
    }
    pilha.mostrar ();

    return 0;
}

void carregar_pilha (PilhaEstatica* pilha, unsigned num)
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {(rand () % 100) - 50};
        cout << " Adicionando chave " << registro.chave;
        bool adicionado = pilha->adicionar ( registro );
        if (!adicionado)
            cout << " Erro: Lista cheia!" << endl;
        else
            cout << endl;
    }
}
