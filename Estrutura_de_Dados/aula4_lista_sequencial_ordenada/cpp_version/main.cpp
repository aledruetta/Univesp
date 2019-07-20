/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    main.cpp
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   9°
 * Autor:      Alejandro Druetta
 * Data:       05/07/2019
 */

#include <iostream>
#include <limits>
#include "Register.h"
#include "LinearSeqList.h"

using namespace std;

void printMenu();
void flushCin();


int main()
/*
 * Função: main.
 */
{
    LinearSeqList list(50);
    list.show();

    int key;
    int pos;
    char op = 'm';          // Menu como opção padrão
    char ops;
    int num;

    do {

        switch (tolower(op))
        {
            case 'g':
                cout << "Tamanho? ";
                cin >> num;
                flushCin();
                list.generate(num);
                list.show();
                break;
            case 'a':
            // Adicionar
            {
                cout << "Chave? ";
                cin >> key;
                flushCin();
                Register reg(key);
                list.append(reg);
                list.show();
                break;
            }
            case 'i':
            // Inserir
            {
                cout << "Chave? ";
                cin >> key;
                flushCin();
                Register reg(key);
                cout << "Posição? ";
                cin >> pos;
                flushCin();
                list.insert(reg, pos);
                list.show();
                break;
            }
            case 'p':
            // Procurar
            {
                cout << "Chave? ";
                cin >> key;
                flushCin();
                pos = list.find(key);
                if (pos == -1) cout << "Chave inválida!" << endl;
                else cout << "Posição: " << pos << endl;
                list.show();
                break;
            }
            case 'd':
            // Deletar
            {
                cout << "Chave? ";
                cin >> key;
                flushCin();
                if (!list.del(key)) cout << "Chave inválida!" << endl;
                list.show();
                break;
            }
            case 'v':
            // Visualizar
                list.show();
                break;
            case 'o':
            // Ordenar
                list.sort();
                list.show();
                break;
            case 'm':
            // Menu
                printMenu();
                break;
            default:
                cout << "Opção inválida!" << endl;
        }

        cout << "\nOpção: ";
        cin >> op;
        flushCin();

    } while (op != 's');

    return 0;
}

void printMenu()
{
        cout << "\nMenu:"        << endl
             << "=====\n"        << endl
             << "A. Adicionar"   << endl
             << "D. Deletar"     << endl
             << "G. Gerar"       << endl
             << "I. Inserir"     << endl
             << "M. Menu"        << endl
             << "S. Sair"        << endl
             << "O. Ordenar"     << endl
             << "P. Procurar"    << endl
             << "V. Visualizar"  << endl;
}

void flushCin()
{
    cin.clear();
    cin.ignore(numeric_limits<streamsize>::max(),'\n');
}

