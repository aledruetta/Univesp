/*
 * =====================================================================================
 *
 *       Filename:  m1_sem5_structs.cpp
 *
 *    Description:  Exemplo de uso de structs
 *
 *        Version:  1.0
 *        Created:  23/08/2019 09:44:41
 *       Revision:  none
 *       Compiler:  g++ -g -Wall m1_sem5_structs.cpp -lm
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. Computação
 *
 * =====================================================================================
 */

#include <iostream>
#include <cmath>
using namespace std;

typedef struct
{
    double x;
    double y;
} Ponto;

// Calcula a distância entre dois pontos
double distancia (const Ponto &a, const Ponto &b)
{
    double dx = abs (a.x - b.x);
    double dy = abs (a.y - b.y);

    return sqrt ( pow (dx, 2) + pow (dy, 2) );
}

// Soma dois pontos
void soma (const Ponto &a, const Ponto &b, Ponto &c)
{
    c.x = a.x + b.x;
    c.y = a.y + b.y;
}

// Produto escalar
double produto_escalar (const Ponto &a, const Ponto &b)
{
    return (a.x * b.x) + (a.y * b.y);
}

// Imprime uma representação do ponto
void imprime (const Ponto &p)
{
    cout << "(" << p.x << ", " << p.y << ")";
}

int main ()
{
    Ponto a = {3, 7};
    Ponto b = {1, 5};

    cout << "\n A ";
    imprime (a);
    cout << endl;

    cout << " B ";
    imprime (b);
    cout << endl;

    cout << "\n Distância entre A e B = "
         << distancia (a, b)
         << "\n"
         << endl;

    Ponto c;
    soma (a, b, c);
    cout << " A + B = ";
    imprime (c);
    cout << endl;

    cout << " A . B = "
         << produto_escalar (a, b)
         << "\n"
         << endl;

    return 0;
}

