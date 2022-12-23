#!/usr/bin/env python3

def max_rec(A):
    n = len(A)

    if n == 1:
        return A[0]
    else:
        n -= 1
        x = max_rec(A[:n])
        return (x if x > A[n] else A[n])


A = [3.23, 7.09, 1.00, 23.50, 11.33]

print(f'Máximo: {max_rec(A)}')

