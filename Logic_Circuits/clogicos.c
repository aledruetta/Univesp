/*
 * =====================================================================================
 *
 *       Filename:  main.c
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
#include <stdbool.h>
#include "clogicos.h"

void binToStr(char * bin, size_t n)
{
    for (size_t i=0; i<n; i++) {
        if (bin[i] == '0' || bin[i] == '1') {
            printf("%c", bin[i]);
        }
    }
    printf("\n");
}

char * add1(char * bin, size_t n)
{
    char * newbin = (char *) malloc(n);
    bool flag = false;
    newbin[n-1] = (bin[n-1] == '0') ? '1' : '0';
    for (int i=n-1; i>=0; i--) {
        char bit = bin[i] - 48;
        if (bit == 0) {
            if (!flag) newbin[i] = '1';
            else {
                newbin[i] = '0';
                flag = true;
            }
        }
        else {
            if (!flag) {
                newbin[i] = '0';
                flag = true;
            }
            else newbin[i] = '1';
        }
    }
    return newbin;
}

char * binToC1(char * bin, size_t n)
{
    if (bin[0] == '0') return bin;
    char * newbin = (char *) malloc(n);
    newbin[0] = '1';
    for (size_t i=1; i<n; i++) {
        if (bin[i] == '0') {
            newbin[i] = '1';
        }
        else if (bin[i] == '1') {
            newbin[i] = '0';
        }
    }
    return newbin;
}

char * binToC2(char * bin, size_t n)
{
    if (bin[0] == '0') return bin;
    char * newbin = (char *) malloc(n);
    newbin = binToC1(bin, n);
    return add1(newbin, n);
}

