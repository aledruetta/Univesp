#!/usr/bin/python3

import sys
from pathlib import Path
from utilities import read, write
from Parser import Parser
from Coder import Coder


def main():
    path = Path(sys.argv[1].strip())
    asm = read(path)

    parser = Parser(asm)
    parsed = parser.parse()

    binary = Coder(parsed).encode()

    write(path.name.replace("asm", "hack"), binary)


if __name__ == "__main__":
    main()