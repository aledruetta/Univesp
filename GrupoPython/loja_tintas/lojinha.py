#!/usr/bin/env python3

import math


class Tinta:
    loja = 'Maradona Tintas SRL'

    def __init__(self, marca, cor, lata_lts, cobertura, preco):
        self.marca = marca.title()
        self.cor = cor.capitalize()
        self.lata_lts = lata_lts
        self.cobertura = cobertura
        self.preco = preco

    def fmt_lata(self):
        lt = self.lata_lts
        return f'{int(lt * 1000)} ml' if self.lata_lts < 1 else f'{lt} lt'

    def calc_latas(self, area):
        return math.ceil(area / self.cobertura)

    def __repr__(self):
        fmt = f'{self.marca}: ({self.cor}) {self.fmt_lata()} - R$ {self.preco}'
        return fmt


def main():
    tintas = []
    tintas.append(Tinta('Suvinil', 'Vermelho', 4, 16, 33.99))
    tintas.append(Tinta('Coral', 'Azul marinho', 0.25, 10, 17.99))
    tintas.append(Tinta('Sherwin Williams', 'Marrom', 1.5, 12.3, 22.99))
    tintas.append(Tinta('Eucatex', 'Verde radioativo', 1, 15, 10.99))

    print(f'\n**** {Tinta.loja} ****\n')

    for tinta in tintas:
        print(f'{tintas.index(tinta) + 1} - {tinta}')

    mensagem = '\nEscolha sua tinta: '
    opt = input(mensagem)
    while opt not in '1234':
        opt = input(mensagem)

    tinta = tintas[int(opt)-1]
    metros = float(input('Quantos metros quadrados precisa cobrir: '))
    latas = tinta.calc_latas(metros)
    preco = tinta.preco * latas

    print(f'Você vai precisar {latas} latas de tinta.')
    print(f'Preço: R$ {preco}')

    print('\n**** Volte sempre! ****\n')


if __name__ == '__main__':
    main()
