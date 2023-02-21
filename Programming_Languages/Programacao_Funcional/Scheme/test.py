#!/usr/bin/env python3

def main():
    fis = []
    for i in range(5):
        def f():
            return lambda : print(i)
        fis.append(f())

    for f in fis:
        f()

main()