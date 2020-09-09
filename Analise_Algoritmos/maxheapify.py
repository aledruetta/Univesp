#!/usr/bin/env python3


def max_heapify(A, i):
    i += 1
    m = len(A)
    e = 2 * i
    d = 2 * i + 1

    if e <= m and A[e-1] > A[i-1]:
        maior = e
    else:
        maior = i

    if d <= m and A[d-1] > A[maior-1]:
        maior = d

    if maior != i:
        A[i-1], A[maior-1] = A[maior-1], A[i-1]

        max_heapify(A, maior)


A = [1, 3, 2, 6, 4, 7, 8, 5]

print(A)
max_heapify(A, 0)
print(A)
