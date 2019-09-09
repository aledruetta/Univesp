/*
 * File: passivo.hpp
 * @author: Alejandro Druetta
 * Organization: Univesp - Eng. Computação
 *
 * Description: Uma classe para modelar elementos passivos.
 */

#ifndef PASSIVO_HPP
#define PASSIVO_HPP

class ElementoPassivo
{
    public:
        ElementoPassivo ( double impedancia );
        double getImpedancia () const;
    private:
        double impedancia_;
};

#endif /* PASSIVO_HPP */

