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
        v = random.randint(2, 5)
    else:
        pattern = re.compile(r'\d{1,}')

        v = int(input('\nQuantidade de vértices: '))
        print('Vértices: {}'.format(list(range(v))))
        a = int(input('\nQuantidade de arestas: '))
        print('Ingrese as arestas no formato "a,b":\n')

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

    order = """\n
Máximo:   {}
Mínimo:   {}
Maximais: {}
Minimais: {}
    """.format(
            g.max(),
            g.min(),
            g.maximal(),
            g.minimal())

    print("""
Tipo: {}

Vértices: {}
Arestas:  {}

Reflexiva:     {}
Irreflexiva:   {}
Simétrica:     {}
Antisimétrica: {}
Transitiva:    {}

Relação de ordem: {}{}

Matriz de adjacência:

{}

Matriz de incidência:

{}
""".format(
        g.__class__,
        g.V,
        g.E,
        g.is_reflexive(),
        g.is_irreflexive(),
        g.is_simetric(),
        g.is_antisimetric(),
        g.is_transitive(),
        g.is_order(),
        order,
        g.to_adjacency(),
        g.to_incidence()))


if __name__ == '__main__':
    main()
