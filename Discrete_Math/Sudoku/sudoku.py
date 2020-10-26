#!/usr/bin/env python3

import numpy as np


class Sudoku:
    def __init__(self):
        self.matrix = self.create_matrix()

    def get_block(self, n):
        """ Blocks are numberd from 1 to 9
            Return n numberd block
        """
        n -= 1
        row_start = n - (n % 3)
        row_end = row_start + 3
        col_start = 3 * (n % 3)
        col_end = col_start + 3
        return self.matrix[row_start:row_end, col_start:col_end]

    def create_matrix(self):
        matrix = np.empty((9, 9))
        matrix[:] = np.nan
        return np.random.randint(10, size=(9, 9))
        # return matrix

    def __str__(self):
        seph = 3 * "+-------" + "+\n"
        output = ""
        for i in range(9):
            if i % 3 == 0:
                output += seph
            for j in range(9):
                if j % 3 == 0:
                    output += "| "
                output += str(self.matrix[i, j]) + " "
            output += "|\n"
        output += seph
        return output


if __name__ == "__main__":
    s = Sudoku()
    print(s)
