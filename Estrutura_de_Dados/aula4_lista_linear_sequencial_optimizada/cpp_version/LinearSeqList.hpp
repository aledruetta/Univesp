/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL
 *
 * Arquivo:    LinearSeqList.cpp
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   8vo
 * Autor:      Alejandro Druetta
 * Data:       05/07/2019
 */


using namespace std;
const int MAX = 50;                 // Quantidade máxima de registros


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

