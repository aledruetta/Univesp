#!/usr/bin/env python3

import numpy as np
from random import choice


class Sudoku:
    def __init__(self):
        self.matrix = self.create_matrix()

    def get_block(self, num):
        num -= 1
        row_start = num - (num % 3)
        row_end = row_start + 3
        col_start = 3 * (num % 3)
        col_end = col_start + 3
        return self.matrix[row_start:row_end, col_start:col_end]

    def create_matrix(self):
        # matrix = np.empty((9, 9))
        # matrix[:] = np.nan
        return np.random.randint(10, size=(9, 9))

    def __repr__(self):
        return str(self.matrix)
