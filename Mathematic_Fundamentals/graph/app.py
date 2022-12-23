#!/usr/bin/env python3

""" Aplicativo para linha de comandos.
"""

import re
import random

from graph import (
        Graph,
        UndirectedGraph,
        SimpleGraph,
        OrderedGraph)


def main():
    """ Função main.
    """
    mais = 's'

    while mais != 'n':
        print("""\n ===== Gerador de Grafos =====

[S] Simple
[U] Não orientado
[M] Multigrafo
[O] Ordenado
[R] Randômico
""")

        tipo = input('Selecione o tipo de grafo (R padrão): ').lower()
        arestas = []

        if tipo in ['r', '']:
            tipo = random.choice(['m', 's', 'u', 'o'])
            v_qty = random.randint(2, 7)
        else:
            pattern = re.compile(r'\d{1,}')

            v_qty = int(input('\nQuantidade de vértices: '))
            print('Vértices: {}'.format(list(range(v_qty))))
            a_qty = int(input('\nQuantidade de arestas: '))
            print('Ingrese as arestas no formato "a,b":\n')

            for i in range(a_qty):
                padding = (len(str(a_qty)) - len(str(i + 1))) * ' '
                aresta = input('{}[{}] '.format(padding, i+1))
                match = re.findall(pattern, aresta)

                if match and len(match) == 2:
                    match[0] = int(match[0])
                    match[1] = int(match[1])
                    arestas.append(match)

        if tipo == 'm':
            graph = Graph(v_qty, arestas) if arestas else Graph.rand(v_qty)
        elif tipo == 'u':
            graph = UndirectedGraph(v_qty, arestas) if arestas else UndirectedGraph.rand(v_qty)
        elif tipo == 's':
            graph = SimpleGraph(v_qty, arestas) if arestas else SimpleGraph.rand(v_qty)
        elif tipo == 'o':
            if arestas:
                opt = ''
                while opt not in ['m', 'M']:
                    opt = input('\nInforme minofidade ou maioridade (m/M): ')

                minority = opt == 'm'

            graph = OrderedGraph(v_qty, arestas, minority) \
                    if arestas else OrderedGraph.rand(v_qty)
        else:
            return

        order = ""
        if isinstance(graph, OrderedGraph) and graph.is_order():
            order = """\n
Máximo:   {}
Mínimo:   {}
Maximais: {}
Minimais: {}
""".format(
        graph.max(),
        graph.min(),
        graph.maximal(),
        graph.minimal())

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
        graph.__class__,
        graph.vertices,
        graph.edges,
        graph.is_reflexive(),
        graph.is_irreflexive(),
        graph.is_symmetric(),
        graph.is_antisymmetric(),
        graph.is_transitive(),
        graph.is_order(),
        order,
        graph.to_adjacency(),
        graph.to_incidence()))

        mais = input('\nMais um (S/n)? ').lower()


if __name__ == '__main__':
    main()
