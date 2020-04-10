#!/usr/bin/env python3

""" Engenharia da Computação - Univesp
    Fundamentos Matemáticos da Computação

    ===== Gerador de Matrizes Booleanas =====

    Autor: Alejandro Druetta
    Data:  09/04/2020
"""

import numpy as np
import re


class BoolM:
    """ Essa classe apresenta um permite gerar uma matriz booleana
        a partir de um conjunto de pares ordenados pertencentes
        a uma relação do tipo A x A.

        Atributos:

            self.A          - Conjunto domínio e imagem
            self.R          - Relação em A x A
            self.M          - Matriz booleana
    """

    def __init__(self, R):
        self.R = R      # relação
        self.A = []     # conjunto
        self.M = []     # matriz
        self.T = []     # transposta

        self.setA()
        self.genM()

    def setA(self):
        """ Cria um conjunto com todos os elementos pertencentes
            à relação R.
            Retorna uma lista ordenada.
        """

        self.A = list({subitem for item in self.R for subitem in item})
        self.A.sort()

    def genM(self):
        """ Gera uma matriz booleana M do produto cartesiano A x A,
            setando com o valor 'True' os elementos de cada um dos
            pares ordenados da relação R.
        """

        lenA = len(self.A)
        shape = (lenA, lenA)
        self.M = np.zeros(shape, dtype=bool)
        for a, b in self.R:
            self.M[self.A.index(a), self.A.index(b)] = True

    def genT(self):
        """ Retorna a Transposta de M """

        R = [(b, a) for a, b in self.R]
        return BoolM(R)

    def __str__(self):
        """ Imprime uma representação como string da matriz M """

        lenA = len(self.A)
        pad = 0

        for item in self.A:
            lenItem = len(str(item))
            if lenItem > pad:
                pad = lenItem

        pad += 1
        ret = f'{" ".rjust(pad)} |'

        for item in self.A:
            ret += f'{str(item).rjust(pad)}'

        ret += f'\n{"-" * pad}-+-{"-" * pad * lenA}'

        for i in range(lenA):
            line = ''
            for j in self.M[i].astype(int):
                line += f'{str(j).rjust(pad)}'
            ret += f'\n{str(self.A[i]).rjust(pad)} |{line}'

        return ret


def main():
    """ Pede pro usuário ingresar um conjunto de pares ordenados """

    pares = []
    pattern = re.compile(r'\d{1,}')

    print('\n===== Gerador de Matrizes Booleanas =====\n')
    print('Ingrese os pares no formato "a, b"\n')
    qty = int(input('Quantidade? '))

    for i in range(qty):
        par = input(f'[{i+1}] ')
        a, b = re.findall(pattern, par)
        pares.append((int(a), int(b)))

    b = BoolM(pares)
    t = b.genT()

    print(f'\nA = {b.A}')
    print(f'R = {b.R}\n')
    print(f'Matriz booleana:\n\n{b}\n')
    print(f'Matriz transposta:\n\n{t}\n')


if __name__ == '__main__':
    main()
