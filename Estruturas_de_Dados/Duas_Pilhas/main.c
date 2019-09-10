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

void carregar_pilhas ( DPilhas*, unsigned );

int main ()
{
    srand (time (NULL));
    unsigned ntest = 1;

    printf ("\n *** Testes ***\n");

    // inicializar
    printf ("\n Teste %u: inicializar uma pilhas vacia.\n", ntest++);
    DPilhas pilhas;
    inicializar_dPilhas (&pilhas);
    mostrar_dPilhas (&pilhas);

    // Adicionar à direita
    unsigned quant = 10;
    printf ("\n Teste %u: Adicionar registros pela direita.\n", ntest++);
    carregar_pilhas ( &pilhas, quant );
    mostrar_dPilhas ( &pilhas );

    // Deletar
    printf ("\n Teste %u: Deletar registros pela esquerda.\n", ntest++);
    Registro registro;
    for (unsigned i=0; i<quant-4; i++) {
        bool res = excluir_dPilhas (&pilhas, &registro);
        if ( res )
            printf (" Deletando registro chave: %d\n", registro.chave);
        else
            printf (" Erro: A lista está vacia!\n");
    }
    mostrar_dPilhas (&pilhas);

    // Adicionar à direita
    quant = 7;
    printf ("\n Teste %u: Adicionar registros pela direita.\n", ntest++);
    carregar_pilhas ( &pilhas, quant );
    mostrar_dPilhas ( &pilhas );

    reinicializar_dPilhas (&pilhas);
    mostrar_dPilhas (&pilhas);

    return 0;
}

void carregar_pilhas ( DPilhas *pilhas, unsigned num )
{
    for (unsigned i=0; i<num; i++) {
        Registro registro = {(rand () % 100) - 50};
        bool res = inserir_dPilhas ( pilhas, registro );
        if ( res )
            printf (" Adicionando chave: %d\n", registro.chave);
        else
            printf (" Erro: A pilhas está completa! chave: %d\n", registro.chave);
    }
}
