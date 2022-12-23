/*
 * File: Fila_Dinamica/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include <string.h>
#include "fila_dinamica.h"

void carregar_fila ( FilaDim*, unsigned );

int main ()
{
    srand (time (NULL));
    unsigned ntest = 1;

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma fila vacia.\n", ntest++);
    FilaDim fila;
    inicializar_filaDim (&fila);
    mostrar_filaDim (&fila);

    // Adicionar à direita
    unsigned quant = 10;
    printf ("\n Teste %u: Adicionar registros pela direita.\n", ntest++);
    carregar_fila ( &fila, quant );
    mostrar_filaDim ( &fila );

    // Deletar
    printf ("\n Teste %u: Deletar registros pela esquerda.\n", ntest++);
    Registro registro;
    for (unsigned i=0; i<quant-4; i++) {
        bool res = excluir_filaDim (&fila, &registro);
        if ( res )
            printf (" Deletando registro chave: %d\n", registro.chave);
        else
            printf (" Erro: A lista está vacia!\n");
    }
    mostrar_filaDim (&fila);

    // Adicionar à direita
    quant = 7;
    printf ("\n Teste %u: Adicionar registros pela direita.\n", ntest++);
    carregar_fila ( &fila, quant );
    mostrar_filaDim ( &fila );

    reinicializar_filaDim (&fila);
    mostrar_filaDim (&fila);

    return 0;
}

void carregar_fila ( FilaDim *fila, unsigned num )
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {(rand () % 100) - 50};
        bool res = inserir_filaDim ( fila, registro );
        if ( res )
            printf (" Adicionando chave: %d\n", registro.chave);
        else
            printf (" Erro: A fila está completa! chave: %d\n", registro.chave);
    }
}
