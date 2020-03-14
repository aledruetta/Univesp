/*
 * =====================================================================================
 *
 *       Filename:  clogicos.c
 *
 *    Description:  Funções para a disciplina de Circuitos Lógicos.
 *
 *        Version:  1.0
 *        Created:  25/10/2019 20:23:50
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. da Computação
 *
 * =====================================================================================
 */

#include <stdlib.h>
#include <stdio.h>
#include "clogicos.h"

int main()
{
    char binpos[] = {'0','1','1','0','0'};
    size_t len = 5;
    binToStr(binpos, len);
    char * c1pos = binToC1(binpos, len);
    binToStr(c1pos, len);
    char * c2pos = binToC2(binpos, len);
    binToStr(c2pos, len);

    printf("\n");

    char bineg[] = {'1','1','1','0','0'};
    len = 5;
    binToStr(bineg, len);
    char * c1neg = binToC1(bineg, len);
    binToStr(c1neg, len);
    char * c2neg = binToC2(bineg, len);
    binToStr(c2neg, len);

    return 0;
}

