#ifndef MATRIZ_H
#define MATRIZ_H

typedef struct
{
    double **elem;
    unsigned m;
    unsigned n;
} Matriz;

void iniMat ( Matriz *mat, unsigned m, unsigned n );
void forMat ( const Matriz *mat );
void impMat ( const Matriz *mat );

#endif /* MATRIZ_H */
