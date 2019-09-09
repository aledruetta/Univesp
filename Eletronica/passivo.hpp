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
        double getZ () const;
        double getI ( double v ) const;
        double getV ( double i ) const;
    private:
        double impedancia_;
};

#endif /* PASSIVO_HPP */

