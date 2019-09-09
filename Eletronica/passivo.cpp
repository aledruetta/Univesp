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

double ElementoPassivo::getImpedancia () const
{
    return impedancia_;
}

