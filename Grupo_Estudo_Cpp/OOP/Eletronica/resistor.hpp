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
        friend ostream& operator<< ( ostream& os, const Resistor res);
    private:
        unsigned resistencia_;
};

#endif /* RESISTOR_HPP */
