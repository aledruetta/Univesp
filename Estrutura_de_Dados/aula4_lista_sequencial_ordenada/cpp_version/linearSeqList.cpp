/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    linearSeqList.cpp
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   9°
 * Autor:      Alejandro Druetta
 * Data:       08/07/2019
 */

#include "linearSeqList.h"

LinearSeqList::LinearSeqList(int maxSize):
    _maxSize {maxSize},
    _regs {new Register[maxSize+1]},
    _len {0},
    _is_sorted {false}
/*
 * CONSTRUTOR da Lista.
 */
{
    //_maxSize = maxSize;
    //_regs = new Register[maxSize+1];
    //_len = 0;
    //_is_sorted = false;
}

bool LinearSeqList::generate(int num)
{
/*
 * GERA uma lista randômica de comprimento "num".
 */
    if (num > _maxSize)
    {
        cout << "Tamanho máximo 50 elementos!" << endl;
        return false;
    }

    srand(time(nullptr));
    _len = 0;                    // inicializar lista

    for (int i=0; i<num; i++)
    {
        Register reg(rand() % 100);
        if (!append(reg)) cout << "Não há mais espaço na lista!" << endl;
    }

    return true;
}

void LinearSeqList::show()
/*
 * IMPRIME uma representação da Lista no formato:
 * List: [ 2 7 23 ] Length: 3
 */
{
    cout << "List: [ ";
    for (int i=0; i<_len; i++)
    {
        cout << _regs[i].getKey() << " ";
    }
    cout << "] Length: " << _len << endl;
}

void LinearSeqList::_sortIns()
/*
 * ORDENA a lista usando o algoritmo INSERTION SORT.
 */
{
    for (int i=1; i<_len; i++)
    {
        Register tmp = _regs[i];
        int j = i - 1;
        while (_regs[j].getKey() > tmp.getKey() && j >= 0)
        {
            _regs[j+1] = _regs[j];
            j--;
        }
        _regs[j+1] = tmp;
    }
    _is_sorted = true;
}

void LinearSeqList::_sortBub()
/*
 * ORDENA a lista usando o algoritmo BUBBLE SORT.
 */
{
    for (int i=_len-1; i>0; i--)
        for (int j=0; j<i; j++)
            if (_regs[j].getKey() > _regs[j+1].getKey())
            {
                Register tmp = _regs[j];
                _regs[j] = _regs[j+1];
                _regs[j+1] = tmp;
            }
    _is_sorted = true;
}

void LinearSeqList::sort()
{
    _sortBub();
}

bool LinearSeqList::append(Register reg)
/*
 * ADICIONA um registro no FINAL da lista se a lista não estiver cheia.
 */
{
    if (_len >= _maxSize) return false;
    _regs[_len] = reg;
    _len++;
    _is_sorted = false;
    return true;
}

bool LinearSeqList::insert(Register reg, int pos)
/*
 * INSERE um registro em uma posição determinada se a lista não
 * estiver cheia e a posição for válida.
 */
{
    if (_len >= _maxSize || pos < 0 || pos > _len-1) return false;
    for (int i=_len; i>pos; i--) _regs[i] = _regs[i-1];
    _regs[pos] = reg;
    _len++;
    _is_sorted = false;
    return true;
}

int LinearSeqList::_findSent(int key)
/*
 * PROCURA uma chave usando o algoritmo de BUSCA POR SENTINELA.
 */
{
    int pos = 0;
    _regs[_len] = Register(key);
    while (_regs[pos].getKey() != key) pos++;
    if (pos == _len) return -1;
    return pos;
}

int LinearSeqList::_findBin(int key)
/*
 * PROCURA uma chave usando o algoritmo de BUSCA BINÁRIA.
 */
{
    int mid;
    int ini = 0;
    int end = _len - 1;

    while (ini <= end)
    {
        mid = (ini + end) / 2;
        if (_regs[mid].getKey() == key) return mid;
        if (_regs[mid].getKey() > key) end = mid - 1;
        else ini = mid + 1;
    }
    return -1;
}

int LinearSeqList::find(int key)
/*
 * Chama os métodos de busca binária ou por sentinela segundo
 * se a lista estiver ordenada ou não.
 */
{
    if (_is_sorted) return _findBin(key);
    else return _findSent(key);
}

bool LinearSeqList::del(int key)
/*
 * DELETA um elemento da lista procurado pela chave.
 */
{
    int pos = find(key);
    if (pos < 0) return false;
    for (int i=pos; i<_len-1; i++) _regs[i] = _regs[i+1];
    _len--;
    return true;
}

