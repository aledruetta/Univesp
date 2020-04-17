#!/usr/bin/env python3

# import numpy as np
from graph_exceptions import (
        VertexNotExistsError,
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
        """ Deletes duplicated vertices and checks if they are
            are integers.
        """
        self.V = list(set(self.V))
        self.V.sort()

        for vert in self.V:
            if not isinstance(vert, int):
                raise TypeError

    def _check_edges(self):
        """ Checks if every edge connect two vertices and
            if they are tuples.
        """
        self.E.sort()

        for edge in self.E:
            if not isinstance(edge, list) or len(edge) != 2:
                raise TypeError
            elif (
                    edge[0] not in self.V or
                    edge[1] not in self.V):
                raise VertexNotExistsError

    def __str__(self):
        return 'Vertices: {}\nEdges: {}'.format(self.V, self.E)


class SimpleGraph(Graph):
    """
    """
    def __init__(self, V, E):
        super().__init__(V, E)

        self._check_sedges()

    def _check_sedges(self):
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
