#!/usr/bin/env python3

g = 0

def main():
    l = 9
    foo()
    print(g)

def foo():
    def bar():
        print(l)
    global g
    g = 1
    l = 7
    print(g)
    bar()

main()

# module
# g, main, foo

# main
# l

# foo
# bar, l

# bar