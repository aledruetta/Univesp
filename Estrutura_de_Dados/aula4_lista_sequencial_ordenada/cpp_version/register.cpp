/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    register.cpp
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:    9°
 * Autor:      Alejandro Druetta
 * Data:       08/07/2019
 */

#include "register.h"

Register::Register()
/*
 * Construtor padrão da classe Register.
 * Instancia o objeto e atribui o valor 0 à chave.
 */
{
    key = 0;
}

Register::Register(int key)
/*
 * Construtor parametrizado da classe Register.
 * Instancia o objeto e atribui o valor do parámetro à chave.
 */
{
    this->key = key;
}

int Register::getKey()
{
    return key;
}

