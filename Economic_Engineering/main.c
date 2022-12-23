/*
 * file: main.c
 * author: Alejandro Druetta
 * organization: Univesp
 * compile: gcc -g -Wall main.c -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

double juroSimples (double pv, double i, unsigned n);
double juroCompost (double pv, double i, unsigned n);
void menuJuros (double *pv, double *i, unsigned *n);

int main ()
{
    unsigned op = 0;

    printf ("\n");
    printf (" *** Menu *** \n");
    printf (" 1 - Juros simples\n");
    printf (" 2 - Juros compostos\n");

    printf (" Opção: ");
    scanf ("%u", &op);

    double fv, pv, i;
    unsigned n;

    switch (op) {
        case 1:
            menuJuros (&pv, &i, &n);
            for (unsigned j=0; j<n; j++) {
                fv = juroSimples (pv, i, j+1);
                printf (" %u) %.2f\n", j+1, fv);
            }
            break;
        case 2:
            menuJuros (&pv, &i, &n);
            for (unsigned j=0; j<n; j++) {
                fv = juroCompost (pv, i, j+1);
                printf (" %u) %.2f\n", j+1, fv);
            }
            break;
        default:
            printf ("Opção inválida!\n");
            return 1;
    }
    printf ("\n");

    return 0;
}

void menuJuros (double *pv, double *i, unsigned *n)
{
    printf ("\n");
    printf (" Valor aplicado: ");
    scanf ("%lf", pv);
    printf (" Taxa juros (%%): ");
    scanf ("%lf", i);
    printf (" períodos: ");
    scanf ("%u", n);
    printf ("\n");
}

double juroSimples (double pv, double i, unsigned n)
{
    return pv * (1 + i / 100 * n);
}

double juroCompost (double pv, double i, unsigned n)
{
    return pv * pow (1 + i / 100, n);
}

