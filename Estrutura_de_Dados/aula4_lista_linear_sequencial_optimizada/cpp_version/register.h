/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    register.h
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   8vo
 * Autor:      Alejandro Druetta
 * Data:       08/07/2019
 */

#ifndef UNIVESP_REGISTER_H
#define UNIVESP_REGISTER_H

class Register
/*
 * Classe: Register
 */
{
        int key;

    public:

        Register();
        Register(int key);
        int getKey();
};

#endif

