#!/usr/bin/env python3

import re
import random

from graph import (
        Graph,
        UndirectedGraph,
        SimpleGraph)


def main():
    """
    """
    print("""\n ===== Gerador de Grafos =====

    [S] Simple
    [U] Não orientado
    [M] Multigrafo
    [R] Randômico
    """)

    tipo = input('Selecione o tipo de grafo: ').lower()
    arestas = []

    if tipo == 'r':
        tipo = random.choice(['m', 's', 'u'])
        v = random.randint(1, 10)
    else:
        pattern = re.compile(r'\d{1,}')

        v = int(input('Quantidade de vértices: '))
        a = int(input('Quantidade de arestas: '))

        print('\nIngrese as arestas no formato "a,b"')
        print('Vértices: {}\n'.format(list(range(v))))

        for i in range(a):
            aresta = input('[{}] '.format(i+1))
            match = re.findall(pattern, aresta)

            if match and len(match) == 2:
                match[0] = int(match[0])
                match[1] = int(match[1])
                arestas.append(match)

    if tipo == 'm':
        g = Graph(v, arestas) if arestas else Graph.rand(v)
    elif tipo == 'u':
        g = UndirectedGraph(v, arestas) if arestas else UndirectedGraph.rand(v)
    elif tipo == 's':
        g = SimpleGraph(v, arestas) if arestas else SimpleGraph.rand(v)
    else:
        return

    print('\n{}\n'.format(g))
    print('{}\n'.format(g.report()))
    print('Matriz de adjacência:\n{}\n'.format(g.to_adjacency()))
    print('Matriz de incidência:\n{}\n'.format(g.to_incidence()))


if __name__ == '__main__':
    main()