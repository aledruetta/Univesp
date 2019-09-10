/*
 * File: Duas_Pilhas/main.c
 * @author: Alejandro Druetta
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include <string.h>
#include "duas_pilhas.h"

void carregar_esquerda ( DPilhas *pilhas, unsigned num );
void carregar_direita ( DPilhas *pilhas, unsigned num );

int main ()
{
    srand (time (NULL));
    unsigned ntest = 1;

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma pilhas vacia.\n", ntest++);
    DPilhas pilhas;
    inicializar (&pilhas);
    mostrar_esquerda (&pilhas);
    mostrar_direita (&pilhas);

    // Inserir pela direita
    unsigned quant = 12;
    printf ("\n Teste %u: Inserir registros pela direita.\n", ntest++);
    carregar_direita ( &pilhas, quant );
    mostrar_esquerda ( &pilhas );
    mostrar_direita (&pilhas);

    // Excluit pela direita
    printf ("\n Teste %u: Excluir registros pela direita.\n", ntest++);
    Registro registro;
    for (unsigned i=0; i<quant-4; i++) {
        bool res = excluir_direita (&pilhas, &registro);
        if ( res )
            printf (" Excluir registro chave: %d\n", registro.chave);
        else
            printf (" Erro: A lista está vacia!\n");
    }
    mostrar_esquerda ( &pilhas );
    mostrar_direita (&pilhas);

    // Inserir pela esquerda
    quant = 18;
    printf ("\n Teste %u: Inserir registros pela esquerda.\n", ntest++);
    carregar_esquerda ( &pilhas, quant );
    mostrar_esquerda ( &pilhas );
    mostrar_direita (&pilhas);

    // Excluir pela esquerda
    printf ("\n Teste %u: Excluir registros pela esquerda.\n", ntest++);
    for (unsigned i=0; i<quant-4; i++) {
        bool res = excluir_esquerda (&pilhas, &registro);
        if ( res )
            printf (" Excluir registro chave: %d\n", registro.chave);
        else
            printf (" Erro: A lista está vacia!\n");
    }
    mostrar_esquerda (&pilhas);
    mostrar_direita (&pilhas);

    // Reinicializar
    printf ("\n Teste %u: Reinicializar Pilhas.\n", ntest++);
    reinicializar (&pilhas);
    mostrar_esquerda (&pilhas);
    mostrar_direita (&pilhas);

    return 0;
}

void carregar_pilhas ( DPilhas *pilhas, unsigned num, unsigned pilha )
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {(rand () % 100) - 50};
        bool res = ( pilha == 1 ) ? inserir_esquerda ( pilhas, registro )
                                  : inserir_direita ( pilhas, registro );
        if ( res )
            printf (" Adicionando chave: %d\n", registro.chave);
        else
            printf (" Erro: A pilhas está completa! chave: %d\n", registro.chave);
    }
}

void carregar_esquerda ( DPilhas *pilhas, unsigned num )
{
    carregar_pilhas ( pilhas, num, 1);
}

void carregar_direita ( DPilhas *pilhas, unsigned num )
{
    carregar_pilhas ( pilhas, num, 2);
}

