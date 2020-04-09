#!/usr/bin/env python3

import numpy as np
import re


class BoolM:
    def __init__(self, R):
        self.R = R
        self.A = []
        self.M = []
        self.setA()
        self.genM()

    def setA(self):
        self.A = list({subitem for item in self.R for subitem in item})
        self.A.sort()

    def genM(self):
        shape = (len(self.A), len(self.A))
        self.M = np.zeros(shape, dtype=bool)
        for a, b in self.R:
            self.M[self.A.index(a), self.A.index(b)] = True

    def __str__(self):
        lenA = len(self.A)
        ret = '  |'
        for item in self.A:
            ret += f' {item}'
        ret += '\n' + '-' * (2 * lenA + 4)
        for i in range(lenA):
            line = ''
            for j in self.M[i].astype(int):
                line += f' {j}'
            ret += f'\n{self.A[i]} |{line}'

        return ret


def main():
    pares = []
    pattern = re.compile(r'\d')
    print('\n===== Gerador de Matrizes Booleanas =====\n')
    print('Ingrese os pares no formato "a, b"\n')
    qty = int(input('Quantidade? '))
    for i in range(qty):
        par = input(f'[{i+1}] ')
        a, b = re.findall(pattern, par)
        pares.append((int(a), int(b)))
    b = BoolM(pares)
    print(f'\nA = {b.A}')
    print(f'R = {b.R}\n')
    print(f'Matriz booleana:\n\n{b}\n')


if __name__ == '__main__':
    main()
