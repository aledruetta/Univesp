/*
 * UNIVESP - ENG. DA COMPUTAÇÃO
 *
 * LISTA LINEAR SEQUENCIAL OPTIMIZADA (versão C++)
 *
 * Arquivo:    Register.hpp
 * Disciplina: ESTRUTURA DE DADOS
 * Bimestre:   8vo
 * Autor:      Alejandro Druetta
 * Data:       05/07/2019
 */


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

Register::Register()
/*
 * Construtor padrão da classe Register.
 * Instancia o objeto e atribui o valor 0 à chave.
 */
{
    this->key = 0;
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

