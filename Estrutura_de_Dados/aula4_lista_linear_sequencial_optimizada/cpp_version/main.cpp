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
#include <cstdlib>                  // rand()
using namespace std;

const int MAX = 50;                 // Quantidade máxima de registros


class Register
/*
 * Classe: Register
 */
{
        int key;

    public:

        Register();
        Register(int key);
        int getKey();
};

Register::Register()
/*
 * Construtor padrão da classe Register.
 * Instancia o objeto e atribui o valor 0 à chave.
 */
{
    this->key = 0;
}

Register::Register(int key)
/*
 * Construtor parametrizado da classe Register.
 * Instancia o objeto e atribui o valor do parámetro à chave.
 */
{
    this->key = key;
}

int Register::getKey()
{
    return key;
}


class LinearSeqList
/*
 * Classe: LinearSeqList
 *
 * A classe LinearSeqList é uma lista linear sequencial
 * de elementos do tipo Register.
 */
{
        int len;
        Register regs[MAX];

    public:

        LinearSeqList();
        int getLen();
        void show();
        bool append(Register reg);
};

LinearSeqList::LinearSeqList()
{
    len = 0;
}

int LinearSeqList::getLen()
{
    return len;
}

void LinearSeqList::show()
{
    int len = getLen();
    cout << "List: [ ";
    for (int i=0; i<len; i++)
    {
        cout << regs[i].getKey() << " ";
    }
    cout << "] Length: " << len << endl;
}

bool LinearSeqList::append(Register reg)
/*
 * Método append da classe LinearSeqList.
 * Adiciona um registro no final da lista se a lista não estiver cheia.
 */
{
    if (len < MAX)
    {
        regs[len] = reg;
        len++;
        return true;
    }
    return false;
}


int main()
/*
 * Função: main.
 */
{
    LinearSeqList list;
    list.show();
    for (int i=0; i<10; i++)
    {
        Register reg(rand() % 100);
        if (!list.append(reg)) cout << "Não há mais espaço na lista!" << endl;
    }
    list.show();

    return 0;
}

