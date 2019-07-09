/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    linearSeqList.cpp
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   8vo
 * Autor:      Alejandro Druetta
 * Data:       08/07/2019
 */

#include "linearSeqList.h"

LinearSeqList::LinearSeqList()
/*
 * Construtor da Lista.
 */
{
    len = 0;
}

bool LinearSeqList::generate(int num)
{
    if (num > MAX)
    {
        cout << "Tamanho máximo 50 elementos!" << endl;
        return false;
    }

    srand(time(nullptr));
    len = 0;                    // inicializar lista

    for (int i=0; i<num; i++)
    {
        Register reg(rand() % 100);
        if (!append(reg)) cout << "Não há mais espaço na lista!" << endl;
    }

    return true;
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

void LinearSeqList::sortIns()
/*
 * Ordena a lista usando o algoritmo INSERTION SORT.
 */
{
    for (int i=1; i<len; i++)
    {
        Register tmp = regs[i];
        int j = i - 1;
        while (regs[j].getKey() > tmp.getKey() && j >= 0)
        {
            regs[j+1] = regs[j];
            j--;
        }
        regs[j+1] = tmp;
    }
}

void LinearSeqList::sortBub()
/*
 * Ordena a lista usando o algoritmo BUBBLE SORT.
 */
{
    for (int i=len-1; i>0; i--)
        for (int j=0; j<i; j++)
            if (regs[j].getKey() > regs[j+1].getKey())
            {
                Register tmp = regs[j];
                regs[j] = regs[j+1];
                regs[j+1] = tmp;
            }
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

bool LinearSeqList::insert(Register reg, int pos)
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

int LinearSeqList::findSent(int key)
/*
 * Procura uma chave usando o algoritmo de BUSCA POR SENTINELA.
 */
{
    int pos = 0;
    regs[len] = Register(key);
    while (regs[pos].getKey() != key) pos++;
    if (pos == len) return -1;
    return pos;
}

int LinearSeqList::findBin(int key)
/*
 * Procura uma chave usando o algoritmo de BUSCA BINÁRIA.
 */
{
    int mid;
    int ini = 0;
    int end = len - 1;
    sortBub();

    while (ini <= end)
    {
        mid = (ini + end) / 2;
        if (regs[mid].getKey() == key) return mid;
        if (regs[mid].getKey() > key) end = mid - 1;
        else ini = mid + 1;
    }
    return len - 1;
}

bool LinearSeqList::del(int key)
/*
 * Deleta um elemento da lista procurado pela chave.
 */
{
    int pos = findSent(key);
    if (pos < 0) return false;
    for (int i=pos; i<len-1; i++) regs[i] = regs[i+1];
    len--;
    return true;
}

