/*
 * =====================================================================================
 *
 *       Filename:  struct_test.c
 *
 *    Description:  Testando sintaxe do struct em C
 *
 *        Version:  1.0
 *        Created:  02/08/2019 09:25:43
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. Computação
 *
 * =====================================================================================
 */

#include <stdlib.h>
#include <stdio.h>

typedef struct {
    int x;
    int y;
} Point;

Point makePoint (int x, int y) {
    Point this;
    this.x = x;
    this.y = y;
    return this;
}

void showPoint (Point pt) {
    printf("[%d, %d]", pt.x, pt.y);
}

int main ()
{
    Point pt = makePoint (5, 9);
    printf("Point: ");
    showPoint(pt);
    printf("\n");

    return 0;
}

