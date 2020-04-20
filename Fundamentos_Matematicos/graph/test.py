#!/usr/bin/env python3

import unittest
import numpy as np
from graph import (
        Graph,
        UndirectedGraph,
        SimpleGraph)
from graph_exceptions import (
        VertexNotExistsError,
        VertexEmptyListError,
        IsNotUndirectedGraphError,
        IsNotSimpleGraphError)

""" Usage:
    python3 -m unittest -v test
"""


class TestGraph(unittest.TestCase):
    def test_random_graph(self):
        v = 5
        graph = Graph.rand(v)

        # Length of domain and image
        result = len(graph.V)
        self.assertEqual(result, v)

        # Length of ordered pairs must be least or equal
        # of the length of cartesian product
        result = len(graph.E)
        self.assertTrue(result <= v ** 2)

    def test_graph_vertices(self):
        # Empty list
        with self.assertRaises(VertexEmptyListError):
            Graph(0, [])

    def test_graph_edges(self):
        # Edge has non existing vertex
        with self.assertRaises(VertexNotExistsError):
            Graph(2, [[0, 2]])

        # Edge isn't a list
        with self.assertRaises(TypeError):
            Graph(2, [(0, 1)])

        # Edge is not 2-len
        with self.assertRaises(TypeError):
            Graph(2, [[0, 0, 1]])

    def test_graph_adjacency(self):
        g = Graph(3, [[0, 1], [2, 1]])
        m1 = g.to_adjacency()

        # Matrix is ndarray instance
        self.assertIsInstance(m1, np.ndarray)

        m2 = np.array([[0, 1, 0], [0, 0, 0], [0, 1, 0]])

        # Is adjacency matrix
        self.assertTrue((m1 == m2).all())

    def test_graph_incidence(self):
        g = Graph(3, [[0, 1], [2, 1]])
        m1 = g.to_incidence()

        # Matrix is ndarray instance
        self.assertIsInstance(m1, np.ndarray)

        m2 = np.array([[1, 0], [1, 1], [0, 1]])

        # Is adjacency matrix
        self.assertTrue((m1 == m2).all())

    def test_graph_reflexive(self):
        # is_reflexive must return True if matrix is reflexive
        g = Graph(3, [[0, 0], [0, 2], [0, 1], [1, 1], [2, 2]])
        self.assertTrue(g.is_reflexive())

        g = Graph(3, [[0, 0], [0, 2], [0, 1], [1, 0], [2, 2]])
        self.assertFalse(g.is_reflexive())

    def test_graph_irreflexive(self):
        # is_irreflexive must return True if matrix is irreflexive
        g = Graph(3, [[0, 2], [0, 1], [1, 2], [2, 1]])
        self.assertTrue(g.is_irreflexive())

        g = Graph(3, [[0, 2], [1, 1], [1, 2], [2, 1]])
        self.assertFalse(g.is_irreflexive())

    def test_is_simetric(self):
        g = Graph(3, [[0, 2], [1, 2], [2, 1], [2, 0], [2, 2]])
        self.assertTrue(g.is_simetric())

        g = Graph(3, [[0, 1], [1, 2], [2, 1], [2, 0], [2, 2]])
        self.assertFalse(g.is_simetric())


    def test_is_antisimetric(self):
        g = Graph(3, [[0, 2], [1, 0], [1, 2], [2, 2]])
        self.assertTrue(g.is_antisimetric())

        g = Graph(3, [[0, 2], [1, 0], [1, 2], [2, 0], [2, 2]])
        self.assertFalse(g.is_antisimetric())

    def test_is_transitive(self):
        g = Graph(3, [[0, 0], [0, 1], [1, 1]])
        self.assertTrue(g.is_transitive())

        g = Graph(3, [[0, 0], [0, 1], [1, 1], [2, 0]])
        self.assertFalse(g.is_transitive())

    def test_ugraph_edges(self):
        with self.assertRaises(IsNotUndirectedGraphError):
            UndirectedGraph(3, [[0, 0], [0, 2], [2, 0], [1, 0]])

    def test_sgraph_edges(self):
        # Checks for loops
        with self.assertRaises(IsNotSimpleGraphError):
            SimpleGraph(3, [[0, 0], [1, 0], [0, 2]])

        # Checks for simetry
        with self.assertRaises(IsNotSimpleGraphError):
            SimpleGraph(3, [[0, 2], [1, 0], [0, 1]])


if __name__ == '__main__':
    unittest.main()
