#!/usr/bin/env python3

''' Gerador aleatório de matrizes para exercitar
    mapas de Karnaugh

    Autor: Alejandro Druetta
    Organização: Univesp - Eng. da Computação'''

import sys
import random

def main():
    entradas = list('ABCD')
    try:
        nro_entradas = int(sys.argv[1])
    except IndexError:
        print('Erro: Faltou o argumento com o número de entradas.')
        print('Uso: python karnaugh_gen.py <nro entradas>')
        return

    if (nro_entradas < 2) or (nro_entradas > 4):
        print('Erro: Número de entradas min=2, max=4.')
        return

    if nro_entradas < 4:
        split = 1
    else:
        split = 2
    col = entradas[:split]
    fil = entradas[split:]

    print('Filas:   ', col)
    print('Colunas: ', fil)
    print()

    dim1 = list('01')
    dim2 = list('00 01 11 10'.split())

    for j in range(9):
        if len(fil) == 1:
            dimf = dim1
        else:
            dimf = dim2
        print(' ' * len(col), end=' ')
        for bits in dimf:
            print(bits, end=' ')
        print()

        if len(col) == 1:
            dimc = dim1
        else:
            dimc = dim2
        for bits in dimc:
            print(bits, end=' ')
            for i in range(len(dimf)):
                state = random.choice(['0', '1', 'X'])
                if len(dimf) > 2:
                    print(' ', end='')
                print(state, end=' ')
            print()
        print()

if __name__ == '__main__':
    main()
