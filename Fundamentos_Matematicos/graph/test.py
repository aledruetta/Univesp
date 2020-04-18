#!/usr/bin/env python3

import unittest
import numpy as np
from graph import (
        Graph,
        UndirectedGraph)
from graph_exceptions import (
        VertexNotExistsError,
        VertexEmptyListError,
        IsNotUndirectedGraphError)

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
            Graph([], [[1, 1]])

        # Mix allowed types
        with self.assertRaises(TypeError):
            Graph([1, 'a'], [[1, 1]])

        # Not allowed type
        with self.assertRaises(TypeError):
            Graph([1, 2.3], [[1, 1]])

        # Not individual items
        with self.assertRaises(TypeError):
            Graph([1, [2, 1]], [[1, 1]])

    def test_graph_edges(self):
        # Edge has non existing vertex
        with self.assertRaises(VertexNotExistsError):
            Graph([1, 2], [[1, 3]])

        # Edge isn't a list
        with self.assertRaises(TypeError):
            Graph([1, 2], [(1, 2)])

        # Edge is not 2-len
        with self.assertRaises(TypeError):
            Graph([1, 2], [[1, 2, 1]])

    def test_graph_adjacency(self):
        g = Graph([1, 2, 3], [[1, 2], [3, 2]])
        m1 = g.to_adjacency()

        # Matrix is ndarray instance
        self.assertIsInstance(m1, np.ndarray)

        m2 = np.array([[0, 1, 0], [0, 0, 0], [0, 1, 0]])

        # Is adjacency matrix
        self.assertTrue((m1 == m2).all())

    def test_ugraph_edges(self):
        with self.assertRaises(IsNotUndirectedGraphError):
            UndirectedGraph(
                    [1, 2, 3], [[1, 1], [1, 3], [3, 1], [2, 1]])


if __name__ == '__main__':
    unittest.main()
