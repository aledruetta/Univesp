/*
 * =====================================================================================
 *
 *       Filename:  Trig.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  20/07/2019 12:03:45
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Eng. Computação - Univesp
 *
 * =====================================================================================
 */

#include <cmath>


namespace mylibs
{
    double rad(double deg)
    {
        return deg * M_PI / 180;
    }

    double deg(double rad)
    {
        return rad * 180 / M_PI;
    }
}

