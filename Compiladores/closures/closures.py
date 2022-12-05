#!/usr/bin/env python3


def inspect(a, b):
    print(f"function {a.__name__}: {a}")
    print(f"function {b.__name__}: {b}")
    print("Free variables:")
    for name, content, addr in zip(
        a.__code__.co_cellvars,
        [cell.cell_contents for cell in b.__closure__],
        [cell for cell in b.__closure__],
    ):
        print(f"\t{name} = '{content}' @ {addr}")


def a():
    a1 = 1
    a2 = 2

    def b():
        b1 = 3
        return a1

    return b


def main():
    b = a()
    inspect(a, b)


if __name__ == "__main__":
    main()
