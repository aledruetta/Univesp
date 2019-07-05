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
        Register regs[MAX+1];

    public:

        LinearSeqList();
        bool append(Register reg);
        bool append(Register reg, int pos);
        int find(int key);
        bool del(int key);
        void show();
};

LinearSeqList::LinearSeqList()
/*
 * Construtor da Lista.
 */
{
    len = 0;
}

void LinearSeqList::show()
/*
 * Imprime uma representação da Lista no formato:
 * List: [ 2 7 23 ] Length: 3
 */
{
    cout << "List: [ ";
    for (int i=0; i<len; i++)
    {
        cout << regs[i].getKey() << " ";
    }
    cout << "] Length: " << len << endl;
}

bool LinearSeqList::append(Register reg)
/*
 * Adiciona um registro no final da lista se a lista não estiver cheia.
 */
{
    if (len >= MAX) return false;
    regs[len] = reg;
    len++;
    return true;
}

bool LinearSeqList::append(Register reg, int pos)
/*
 * Insere um registro em uma posição determinada se a lista não
 * estiver cheia e a posição for válida.
 */
{
    if (len >= MAX || pos < 0 || pos > len-1) return false;
    for (int i=len; i>pos; i--) regs[i] = regs[i-1];
    regs[pos] = reg;
    len++;
    return true;
}

int LinearSeqList::find(int key)
/*
 * Procura uma chave usando o algoritmo de busca por sentinela.
 */
{
    int pos = 0;
    regs[len] = Register(key);
    while (regs[pos].getKey() != key) pos++;
    if (pos == len) return -1;
    return pos;
}

bool LinearSeqList::del(int key)
/*
 * Deleta um elemento da lista procurado pela chave.
 */
{
    int pos = find(key);
    if (pos < 0) return false;
    for (int i=pos; i<len-1; i++) regs[i] = regs[i+1];
    len--;
    return true;
}

