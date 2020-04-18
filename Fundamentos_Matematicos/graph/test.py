#!/usr/bin/env python3

import unittest
from graph import Graph
from graph_exceptions import (
        VertexNotExistsError,
        VertexEmptyListError)

""" Usage:
    python3 -m unittest -v test
"""


class TestGraph(unittest.TestCase):
    def test_random_graph(self):
        """
        """

        v = 5
        graph = Graph.rand(v)

        result = len(graph.V)
        self.assertEqual(result, v)

        result = len(graph.E)
        self.assertTrue(result <= v ** 2)

    def test_vertices(self):
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

    def test_edges(self):
        # Edge has non existing vertex
        with self.assertRaises(VertexNotExistsError):
            Graph([1, 2], [[1, 3]])

        # Edge isn't a list
        with self.assertRaises(TypeError):
            Graph([1, 2], [(1, 2)])

        # Edge is not 2-len
        with self.assertRaises(TypeError):
            Graph([1, 2], [[1, 2, 1]])


if __name__ == '__main__':
    unittest.main()
