/*
 * =====================================================================================
 *
 *       Filename:  Complex.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  19/07/2019 22:55:54
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Eng. Computação - Univesp
 *
 * =====================================================================================
 */

#include <iostream>
#include <cmath>
#include "Complex.h"

using namespace std;

Complex::Complex (double r, double j)
{
    _real = r;
    _imag = j;
}

double Complex::real ()
{
    return _real;
}

double Complex::imag ()
{
    return _imag;
}

void Complex::real (double r)
{
    _real = r;
}

void Complex::imag (double j)
{
    _imag = j;
}

double Complex::module ()
{
    return sqrt(pow(_real, 2) + pow(_imag, 2));
}

double Complex::fase ()
{
    return _deg(atan(_imag / _real));
}

double Complex::_rad (double deg)
{
    return deg * M_PI / 180;
}

double Complex::_deg (double rad)
{
    return rad * 180 / M_PI;
}

ostream& operator<< (ostream& os, Complex& z)
{
    char sign = '\0';
    if (z.imag() >= 0) sign = '+';
    os << z.real() << sign << z.imag() << "j";
    return os;
}

