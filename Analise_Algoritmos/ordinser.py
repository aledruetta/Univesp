#!/usr/bin/env python3

def ord_ins(A):
    for j in range(1, len(A)):
        chave = A[j]
        i = j - 1

        while(i >= 0 and A[i] > chave):
            A[i+1] = A[i]
            i -= 1

        A[i+1] = chave


A = [13.21, 4.04, 21.01, 0.99, 8.47, 92.00]
ord_ins(A)
print(A)
