#!/usr/bin/env python3

import sys
from pathlib import Path

from parser import Parser
from codewriter import CodeWriter
from utilities import *


def main():
    path = Path(sys.argv[1].strip())

    if not path.exists():
        print(f"Error: '{path}' doesn't exist!")
        exit(1)
    elif path.is_dir():
        for child in path.iterdir():
            if child.suffix == ".vm":
                consume(child)
    else:
        consume(path)


def consume(path: Path) -> None:
    pr = Parser(path)
    cw = CodeWriter(path)

    while pr.has_more_lines():
        pr.advance()
        command = pr.command[0]
        command_type = pr.command_type()
        arg1 = pr.arg1()        # segment or label
        arg2 = str(pr.arg2())   # index

        if command_type == C_PUSH:
            cw.write_push(arg1, arg2)
        elif command_type == C_POP:
            cw.write_pop(arg1, arg2)
        elif command_type == C_ARITHMETIC:
            cw.write_arithmetic(command)
        elif command_type == C_GOTO:
            cw.write_goto(arg1)
        elif command_type == C_IF:
            cw.write_If(arg1)


if __name__ == "__main__":
    main()