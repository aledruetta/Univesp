/*
 * File: passivo.cpp
 * @author: Alejandro Druetta
 * Organization: Univesp - Eng. Computação
 *
 * Description: Uma classe para modelar elementos passivos.
 */

#include "passivo.hpp"

ElementoPassivo::ElementoPassivo ( double impedancia )
{
    impedancia_ = impedancia;
}

double ElementoPassivo::getZ () const
{
    return impedancia_;
}

double ElementoPassivo::getV ( double i ) const
{
    return impedancia_ * i;
}

double ElementoPassivo::getI ( double v ) const
{
    return  v / impedancia_;
}

