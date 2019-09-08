/*
 * File: resistor.hpp
 * @author: Alejandro Druetta
 * Organization: Univesp - Eng. Computação
 *
 * Description: Uma classe para modelar resistores.
 */

#ifndef RESISTOR_HPP
#define RESISTOR_HPP

using namespace std;

class Resistor
{
    public:
        Resistor ( unsigned resistencia );
        unsigned getResistencia () const;
        double getCondutancia () const;
        string getEngSimbol () const;
        string getCodigoCores () const;
        Resistor& conectSerie ( Resistor r ) const;
        Resistor& conectParalelo ( Resistor r ) const;
        friend ostream& operator<< ( ostream& os, const Resistor res);
        friend Resistor& operator+ ( const Resistor &res1, const Resistor &res2 );
    private:
        unsigned resistencia_;
};

#endif /* RESISTOR_HPP */
