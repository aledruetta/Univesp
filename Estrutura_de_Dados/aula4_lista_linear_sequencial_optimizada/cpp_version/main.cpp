/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    main.cpp
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   8vo
 * Autor:      Alejandro Druetta
 * Data:       05/07/2019
 */

#include <iostream>
#include <cstdlib>                  // rand, srand
#include <ctime>                    // time
#include <limits>
#include "Register.hpp"
#include "LinearSeqList.hpp"

void printMenu();
void flushCin();


int main()
/*
 * Função: main.
 */
{
    LinearSeqList list;
    srand(time(nullptr));

    for (int i=0; i<10; i++)
    {
        Register reg(rand() % 100);
        if (!list.append(reg)) cout << "Não há mais espaço na lista!" << endl;
    }
    list.show();

    int key;
    int pos;
    char op = 'm';

    do {

        switch (tolower(op))
        {
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
                cout << "Posição: " << list.find(key) << endl;
                list.show();
                break;
            }
            case 'd':
            // Deletar
            {
                cout << "Chave? ";
                cin >> key;
                flushCin();
                list.del(key);
                list.show();
                break;
            }
            case 'v':
            // Visualizar
                list.show();
                break;
            case 'o':
            // Ordenar por Insertion Sort
                list.sortIns();
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

