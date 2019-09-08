#include <iostream>
#include "eletronica.hpp"
using namespace std;

int main ()
{
    unsigned res = 0;
    cout << "\nValor de R em Ohms? "; cin >> res;
    Resistor r1 (res);
    cout << "Valor de R: "
         << r1.getResistencia() << endl;
    cout << "Valor de G: "
         << r1.getCondutancia() << endl;
    cout << "Código: ";
    r1.getCodigoCores();
    cout << endl;

    return 0;
}
