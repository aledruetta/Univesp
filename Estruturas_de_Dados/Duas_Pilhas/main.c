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

void carregar_pilhas ( DPilhas*, unsigned, unsigned );

int main ()
{
    srand (time (NULL));
    unsigned ntest = 1;

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma pilhas vacia.\n", ntest++);
    DPilhas pilhas;
    inicializar_dPilhas (&pilhas);
    mostrar1_dPilhas (&pilhas);
    mostrar2_dPilhas (&pilhas);

    // Adicionar pilha 2
    unsigned quant = 12;
    printf ("\n Teste %u: Adicionar registros pela direita.\n", ntest++);
    carregar_pilhas ( &pilhas, quant, 2 );
    mostrar1_dPilhas ( &pilhas );
    mostrar2_dPilhas (&pilhas);

    // Deletar pilha 2
    printf ("\n Teste %u: Deletar registros pela direita.\n", ntest++);
    Registro registro;
    for (unsigned i=0; i<quant-4; i++) {
        bool res = excluir2_dPilhas (&pilhas, &registro);
        if ( res )
            printf (" Deletando registro chave: %d\n", registro.chave);
        else
            printf (" Erro: A lista está vacia!\n");
    }
    mostrar1_dPilhas ( &pilhas );
    mostrar2_dPilhas (&pilhas);

    // Adicionar pilha 1
    quant = 18;
    printf ("\n Teste %u: Adicionar registros pela esquerda.\n", ntest++);
    carregar_pilhas ( &pilhas, quant, 1 );
    mostrar1_dPilhas ( &pilhas );
    mostrar2_dPilhas (&pilhas);

    // Deletar pilha 1
    printf ("\n Teste %u: Deletar registros pela esquerda.\n", ntest++);
    for (unsigned i=0; i<quant-4; i++) {
        bool res = excluir1_dPilhas (&pilhas, &registro);
        if ( res )
            printf (" Deletando registro chave: %d\n", registro.chave);
        else
            printf (" Erro: A lista está vacia!\n");
    }
    mostrar1_dPilhas (&pilhas);
    mostrar2_dPilhas (&pilhas);

    printf ("\n Teste %u: Reinicializar Pilhas.\n", ntest++);
    reinicializar_dPilhas (&pilhas);
    mostrar1_dPilhas (&pilhas);
    mostrar2_dPilhas (&pilhas);

    return 0;
}

void carregar_pilhas ( DPilhas *pilhas, unsigned num, unsigned pilha )
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {(rand () % 100) - 50};
        bool res = ( pilha == 1 ) ? inserir1_dPilhas ( pilhas, registro )
                                  : inserir2_dPilhas ( pilhas, registro );
        if ( res )
            printf (" Adicionando chave: %d\n", registro.chave);
        else
            printf (" Erro: A pilhas está completa! chave: %d\n", registro.chave);
    }
}

