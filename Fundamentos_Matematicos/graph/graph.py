#!/usr/bin/env python3

import numpy as np
import string
import re

from random import randrange, choice
from itertools import combinations_with_replacement as combine

from graph_exceptions import (
        VertexNotExistsError,
        VertexEmptyListError,
        IsNotSimpleGraphError,
        IsNotUndirectedGraphError)


class Graph:
    """ This class represents a generic graph. It's has a set
        of vertices and a list of edges (a 2-len list of vertices).
    """
    def __init__(self, lenV, E):
        self.V = list(range(lenV))      # list of vertices
        self.E = E                      # list of edges

        self._check_vertices()
        self._check_edges()

    def _check_vertices(self):
        """ Checks V is not an empty list.
        """
        if len(self.V) == 0:
            raise VertexEmptyListError

    def _check_edges(self):
        """ Checks if every edge connect two vertices and
            if they are a 2-len list of vertices.
        """
        self.E.sort()

        for edge in self.E:
            if not isinstance(edge, list) or len(edge) != 2:
                raise TypeError
            elif (
                    edge[0] not in self.V or
                    edge[1] not in self.V):
                raise VertexNotExistsError

    @property
    def named_edges(self):
        named = {}

        strings = list(string.ascii_lowercase)
        key_len = (len(self.E) // len(strings) + 1) + 1
        keys = strings + list(combine(strings, key_len))

        i = 0
        for edge in self.E:
            key = ''.join(keys[i])
            named[key] = edge
            i += 1

        return named

    def zeros(self, shape=None, dtype=int):
        """ Returns a zeros or False squared matrix.
        """
        if shape is None:
            lenA = len(self.V)
            shape = (lenA, lenA)

        return np.zeros(shape, dtype=dtype)

    def to_adjacency(self, dtype=int):
        """ Returns the graph's adjacency matrix.
        """
        M = self.zeros()

        for a, b in self.E:
            M[a, b] += 1

        return M.astype(dtype)

    def to_incidence(self, dtype=int):
        """ Return de graph's incidence matrix.
        """
        shape = (len(self.V), len(self.E))
        M = self.zeros(shape)

        names = sorted(list(self.named_edges.keys()))
        for name, edge in self.named_edges.items():
            i = names.index(name)
            M[edge[0], i] += 1
            M[edge[1], i] += 1

        return M.astype(dtype)

    def is_reflexive(self):
        """ Cheks reflexivity.
        """
        M = self.to_adjacency(dtype=bool)
        I = np.identity(len(M), dtype=bool)

        return (M & I == I).all()

    def is_irreflexive(self):
        """ Cheks irreflexivity.
        """
        M = self.to_adjacency(dtype=bool)
        I = np.identity(len(M), dtype=bool)
        Z = self.zeros(dtype=bool)

        return (M & I == Z).all()

    def is_simetric(self):
        """ Cheks simetry.
        """
        M = self.to_adjacency(dtype=bool)

        return (M == M.T).all()

    def is_antisimetric(self):
        """ Cheks antisimetry.
        """
        I = np.identity(len(self.V), dtype=bool)
        M = self.to_adjacency(dtype=bool) & ~I

        return not (M & M.T).any()

    def is_transitive(self):
        """ Checks transitivity.
        """
        M = self.to_adjacency(dtype=bool)
        C = M.dot(M)

        return (C | M == M).all()

    def is_order(self):
        """
        """
        return (
                self.is_reflexive() and
                self.is_antisimetric() and
                self.is_transitive())

    def min(self):
        """
        """
        A = self.to_adjacency(dtype=bool).astype(int)

        for i in range(len(A)):
            lin = A[i,:]
            if sum(lin) >= len(lin):
                return i

        return None

    def max(self):
        """
        """
        A = self.to_adjacency(dtype=bool).astype(int)

        for j in range(len(A)):
            col = A[:,j]
            if sum(col) >= len(col):
                return j

        return None

    def maximal(self):
        maximals = []
        A = self.to_adjacency(dtype=bool).astype(int)

        for i in range(len(A)):
            lin = A[i,:]
            if sum(lin) == 1:
                maximals.append(i)

        return maximals

    def minimal(self):
        minimals = []
        A = self.to_adjacency(dtype=bool).astype(int)

        for j in range(len(A)):
            col = A[:,j]
            if sum(col) == 1:
                minimals.append(j)

        return minimals

    def report(self):
        """
        """
        order = ""
        if self.is_order():
            order = """\n
    Máximo:   {}
    Mínimo:   {}
    Maximais: {}
    Minimais: {}
    """.format(
            self.max(),
            self.min(),
            self.maximal(),
            self.minimal())

        fstr = """
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
                self.__class__,
                self.V,
                self.E,
                self.is_reflexive(),
                self.is_irreflexive(),
                self.is_simetric(),
                self.is_antisimetric(),
                self.is_transitive(),
                self.is_order(),
                order,
                self.to_adjacency(),
                self.to_incidence())

        return fstr

    @classmethod
    def from_m(cls, M):
        M = M.astype(bool)
        lm = len(M)
        edges = [[i, j] for i in range(lm) for j in range(lm) if M[i, j] == True]

        return cls(lm, edges)

    @classmethod
    def rand(cls, v):
        """ Generate a random graph """

        E = []
        V = list(range(v))

        for i in range(randrange(v ** 2)):
            E.append([choice(V), choice(V)])

        return cls(v, E)

    def __str__(self):
        return '{}\n\tV: {}\n\tE: {}>'.format(
                str(self.__class__)[:-1], self.V, self.E)


class UndirectedGraph(Graph):
    """ This class represent an undireted graph.
    """
    def __init__(self, V, E):
        super().__init__(V, E)

        self._check_ugedges()

    def _check_ugedges(self):
        """
        """
        if not self.is_antisimetric():
            raise IsNotUndirectedGraphError

    @classmethod
    def rand(cls, v):
        """
        """
        edges = Graph.rand(v).E

        for edge in edges:
            rev = [edge[1], edge[0]]
            if rev != edge and rev in edges:
                while True:
                    try:
                        i = edges.index(rev)
                        edges[i].reverse()
                    except ValueError:
                        break

        return cls(v, edges)


class SimpleGraph(UndirectedGraph):
    """ This class represent a simple or strict graph:
        An undirected graph without loops.
    """
    def __init__(self, V, E):
        try:
            super().__init__(V, E)
        except IsNotUndirectedGraphError:
            raise IsNotSimpleGraphError

        self._check_sgedges()

    def _check_sgedges(self):
        """
        """
        if not self.is_irreflexive():
            raise IsNotSimpleGraphError

    @classmethod
    def rand(cls, v):
        """
        """
        U = UndirectedGraph.rand(v).to_adjacency(dtype=bool)
        I = np.identity(v, dtype=bool)
        S = (U & ~I).astype(int)

        return cls.from_m(S)


def main():
    pass

if __name__ == '__main__':
    main()
