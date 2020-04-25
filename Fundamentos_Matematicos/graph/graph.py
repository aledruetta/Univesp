#!/usr/bin/env python3

""" A bunch of classes for graph matrix fun.
"""

import string

from itertools import combinations_with_replacement as combine
from random import randrange, choice

import numpy as np


from graph_exceptions import (
        VertexNotExistsError,
        VertexEmptyListError,
        IsNotSimpleGraphError,
        IsNotUndirectedGraphError,
        IsNotOrderedGraphError)


class Graph:
    """ This class represents a generic graph. It's has a set
        of vertices and a list of edges (a 2-len list of vertices).
    """
    def __init__(self, len_v, edges):
        self.vertices = list(range(len_v))      # list of vertices
        self.edges = edges                      # list of edges

        self._check_vertices()
        self._check_edges()

    def _check_vertices(self):
        """ Checks V is not an empty list.
        """
        if len(self.vertices) == 0:
            raise VertexEmptyListError

    def _check_edges(self):
        """ Checks if every edge connect two vertices and
            if they are a 2-len list of vertices.
        """
        self.edges.sort()

        for edge in self.edges:
            if not isinstance(edge, list) or len(edge) != 2:
                raise TypeError
            if (
                    edge[0] not in self.vertices or
                    edge[1] not in self.vertices):
                raise VertexNotExistsError

    @property
    def named_edges(self):
        """ Return a dictionary of named edges.
        """
        named = {}

        strings = list(string.ascii_lowercase)
        key_len = (len(self.edges) // len(strings) + 1) + 1
        keys = strings + list(combine(strings, key_len))

        i = 0
        for edge in self.edges:
            key = ''.join(keys[i])
            named[key] = edge
            i += 1

        return named

    def zeros(self, shape=None, dtype=int):
        """ Returns a zeros or False squared matrix.
        """
        if shape is None:
            len_a = len(self.vertices)
            shape = (len_a, len_a)

        return np.zeros(shape, dtype=dtype)

    def to_adjacency(self, dtype=int):
        """ Returns the graph's adjacency matrix.
        """
        M = self.zeros()

        for a, b in self.edges:
            M[a, b] = 1

        return M.astype(dtype)

    def to_incidence(self, dtype=int):
        """ Return de graph's incidence matrix.
        """
        shape = (len(self.vertices), len(self.edges))
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

    def is_symmetric(self):
        """ Cheks simetry.
        """
        M = self.to_adjacency(dtype=bool)

        return (M == M.T).all()

    def is_antisymmetric(self):
        """ Cheks antisimetry.
        """
        I = np.identity(len(self.vertices), dtype=bool)
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
                self.is_antisymmetric() and
                self.is_transitive())

    @staticmethod
    def symmetric_closure(A):
        """
        """
        lenA = len(A)
        for i in range(lenA):
            for j in range(lenA):
                if A[i, j]:
                    A[j, i] = A[i, j]

        return A

    @classmethod
    def from_m(cls, M):
        M = M.astype(bool)
        lm = len(M)
        edges = [[i, j] for i in range(lm) for j in range(lm) if M[i, j] == True]

        return cls(lm, edges)

    @classmethod
    def transpose(cls, graph):
        T = graph.to_adjacency().T

        if isinstance(graph, OrderedGraph):
            return cls.from_m(T, minority=(not graph.minority))

        return cls.from_m(T)

    @classmethod
    def rand(cls, v_qty):
        """ Generate a random graph """

        E = []
        V = list(range(v_qty))

        for i in range(randrange(v_qty ** 2)):
            E.append([choice(V), choice(V)])

        return cls(v_qty, E)

    def __str__(self):
        return '{}\n\tV: {}\n\tE: {}>'.format(
                str(self.__class__)[:-1], self.vertices, self.edges)


class UndirectedGraph(Graph):
    """ This class represents an undireted graph.
    """
    def __init__(self, vertices, edges):
        super().__init__(vertices, edges)

        self._check_ugedges()

    def _check_ugedges(self):
        """
        """
        if not self.is_antisymmetric():
            raise IsNotUndirectedGraphError

    @classmethod
    def rand(cls, v_qty):
        """ Return a random generated undirected graph.
        """
        edges = Graph.rand(v_qty).edges

        for edge in edges:
            rev = [edge[1], edge[0]]
            if rev != edge and rev in edges:
                while True:
                    try:
                        i = edges.index(rev)
                        edges[i].reverse()
                    except ValueError:
                        break

        return cls(v_qty, edges)


class OrderedGraph(UndirectedGraph):
    """ This class represents an ordered graph.
    """
    def __init__(self, vertices, edges, minority=True):
        super().__init__(vertices, edges)
        self.minority=minority

        self._check_properties()

    def _check_properties(self):
        if not self.is_order():
            raise IsNotOrderedGraphError

    def only_one_is_true(self, line):
        values = []
        A = self.to_adjacency(dtype=bool).astype(int)

        for i in range(len(A)):
            if line:
                axis = A[i,:]
            else:
                axis = A[:,i]

            if sum(axis) == 1:
                values.append(i)

        return values

    def all_is_true(self, line):
        A = self.to_adjacency(dtype=bool).astype(int)

        for i in range(len(A)):
            if line:
                axis = A[i,:]
            else:
                axis = A[:,i]

            if sum(axis) == len(axis):
                return i

        return None

    def min(self):
        """
        """
        if not self.minority:
            return self.all_is_true(False)
        return self.all_is_true(True)

    def max(self):
        """
        """
        if not self.minority:
            return self.all_is_true(True)
        return self.all_is_true(False)

    def maximal(self):
        if not self.minority:
            return self.only_one_is_true(False)
        return self.only_one_is_true(True)

    def minimal(self):
        if not self.minority:
            return self.only_one_is_true(True)
        return self.only_one_is_true(False)

    @classmethod
    def to_order(cls, G, minority=True):
        A = G.to_adjacency(dtype=bool)
        len_a = len(A)
        ident = np.identity(len_a, dtype=bool)
        S = A | ident          # make symmetric

        if minority:
            E = [[i, j] for i in range(len_a) for j in range(i, len_a)
                    if S[i, j]]
        else:
            E = [[i, j] for i in range(len_a) for j in range(i+1)
                    if S[i, j]]

        return OrderedGraph(len_a, E, minority)

    @classmethod
    def rand(cls, v_qty):
        while True:
            R = Graph.rand(v_qty)
            try:
                O = OrderedGraph.to_order(R, minority=choice([True, False]))
            except IsNotOrderedGraphError:
                continue
            else:
                break
        return O


class SimpleGraph(Graph):
    """ This class represent a simple or strict graph:
        An undirected graph without loops.
    """
    def __init__(self, vertices, edges):
        super().__init__(vertices, edges)

        self._check_sgedges()

    def _check_sgedges(self):
        """
        """
        if not (self.is_irreflexive() and self.is_symmetric()):
            raise IsNotSimpleGraphError

    @classmethod
    def rand(cls, v_qty):
        """
        """
        U = Graph.rand(v_qty).to_adjacency(dtype=bool)
        I = np.identity(v_qty, dtype=bool)
        R = (U & ~I).astype(int)
        S = cls.symmetric_closure(R)

        return cls.from_m(S)


def main():
    pass

if __name__ == '__main__':
    main()
