#!/usr/bin/env python3

import numpy as np
import string

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
        lenV = len(self.V)
        Ident = np.identity(lenV, dtype=bool)
        M = self.to_adjacency(dtype=bool)
        M = M & ~Ident

        if (M & M.T).any():
            raise IsNotUndirectedGraphError


class SimpleGraph(UndirectedGraph):
    """ This class represent a simple or strict graph:
        An undirected graph without loops.
    """
    def __init__(self, V, E):
        try:
            super().__init__(V, E)
        except IsNotUndirectedGraphError as err:
            raise IsNotSimpleGraphError(err)

        self._check_sgedges()

    def _check_sgedges(self):
        """
        """
        lenV = len(self.V)
        Ident = np.identity(lenV, dtype=bool)
        M = self.to_adjacency()

        if (M.astype(bool) & Ident).any() or (M > 1).any():
            raise IsNotSimpleGraphError


def main():
    pass


if __name__ == '__main__':
    main()
