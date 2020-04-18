#!/usr/bin/env python3

import numpy as np
from random import randrange, choice
from graph_exceptions import (
        VertexNotExistsError,
        VertexEmptyListError,
        IsNotSimpleGraphError)


class Graph:
    """ This class represents a generic graph. It's has a set
        of vertices and a list of edges (a 2-len list of vertices).
    """
    def __init__(self, V, E):
        self.V = V          # list of vertices
        self.E = E          # list of edges

        self._check_vertices()
        self._check_edges()

    def _check_vertices(self):
        """ Checks V is not an empty list, removes duplicated
            vertices and cheks if they are integers.
        """
        self.V = list(set(self.V))

        if len(self.V) == 0:
            raise VertexEmptyListError

        prev_type = type(self.V[0])

        for vert in self.V:
            is_dist = type(vert) != prev_type
            is_str = isinstance(vert, str)
            is_int = isinstance(vert, int)
            is_long = is_str and len(vert) != 1

            is_invalid = not (is_str or is_int) or is_dist or is_long
            if is_invalid:
                raise TypeError

        self.V.sort()

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

    def to_incidenceM(self, boolean=False):
        """ Generate the graph's incidence matrix.
        """
        lenA = len(self.V)
        shape = (lenA, lenA)
        M = np.zeros(shape, dtype=bool)

        for a, b in self.E:
            M[a, b] = True

        if boolean:
            return M

        return M.astype(int)

    @classmethod
    def rand(cls, v):
        """ Generate a random graph """

        E = []
        V = list(range(v))

        for i in range(randrange(v ** 2)):
            E.append([choice(V), choice(V)])

        return cls(V, E)

    def __str__(self):
        return '{}\n\tV: {}\n\tE: {}>'.format(
                str(self.__class__)[:-1], self.V, self.E)


class SimpleGraph(Graph):
    """
    """
    def __init__(self, V, E):
        super().__init__(V, E)

        self._check_sedges()

    def _check_sgEdges(self):
        self.E = list(set(self.E))
        for edge in self.E:
            if (
                    edge[0] == edge[1] or
                    (edge[1], edge[0]) in self.E):
                raise IsNotSimpleGraphError


class SimpleUGraph(SimpleGraph):
    def __init__(self, V, E):
        super().__init__(V, E)


def main():
    pass


if __name__ == '__main__':
    main()
