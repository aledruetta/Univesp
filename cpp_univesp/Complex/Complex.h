/*
 * =====================================================================================
 *
 *       Filename:  Complex.h
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

#ifndef COMPLEX_H
#define COMPLEX_H

using namespace std;

class Complex
{
    public:
        Complex (double r, double j);
        double real ();
        double imag ();
        double module ();
        double fase ();
        void real (double r);
        void imag (double j);
        friend ostream& operator<< (ostream& os, Complex& z);
    private:
        double _real;
        double _imag;
        double _module;
        double _fase;
        double _rad (double deg);
        double _deg (double rad);
};

#endif

