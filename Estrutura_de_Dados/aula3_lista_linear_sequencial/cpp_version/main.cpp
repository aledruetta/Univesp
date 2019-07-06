/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL
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
    char op = '6';

    do {

        switch (op)
        {
            case '1':
            {
                cout << "Chave? ";
                cin >> key;
                flushCin();
                Register reg(key);
                list.append(reg);
                list.show();
                break;
            }
            case '2':
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
            case '3':
            {
                cout << "Chave? ";
                cin >> key;
                cout << "Posição: " << list.find(key) << endl;
                list.show();
                break;
            }
            case '4':
            {
                cout << "Chave? ";
                cin >> key;
                flushCin();
                list.del(key);
                list.show();
                break;
            }
            case '5':
                list.show();
                break;
            case '6':
                printMenu();
                break;
            default:
                cout << "Opção inválida!" << endl;
        }

        cout << "\nOpção: ";
        cin.get(op);
        flushCin();

    } while (op != '7');

    return 0;
}

void printMenu()
{
        cout << "\nMenu:"        << endl
             << "=====\n"        << endl
             << "1. Adicionar"   << endl
             << "2. Inserir"     << endl
             << "3. Procurar"    << endl
             << "4. Deletar"     << endl
             << "5. Mostrar"     << endl
             << "6. Menu"        << endl
             << "7. Sair"        << endl;
}

void flushCin()
{
    cin.clear();
    cin.ignore(numeric_limits<streamsize>::max(),'\n');
}

