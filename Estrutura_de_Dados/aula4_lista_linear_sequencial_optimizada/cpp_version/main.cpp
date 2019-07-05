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
using namespace std;

const int MAX = 50;


struct Register
{
    int key;
};


class LinearSeqList
{
        int len;
        Register regs[MAX];
    public:
        LinearSeqList();
        int getLen();
        int getRegKey(int index);
        void show();
};

LinearSeqList::LinearSeqList()
{
    len = 0;
}

int LinearSeqList::getLen()
{
    return len;
}

int LinearSeqList::getRegKey(int index)
{
    return regs[index].key;
}

void LinearSeqList::show()
{
    int len = getLen();
    cout << "List: [ ";
    for (int i=0; i<len; i++)
    {
        cout << getRegKey(i) << " ";
    }
    cout << "] Length: " << len << endl;
}


int main()
{
    LinearSeqList list;
    list.show();

    return 0;
}

