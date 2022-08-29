#!/usr/bin/env python3

import sys
from parser import Parser
from pathlib import Path

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
        if path.suffix != ".vm":
            print(f"Error: '{path}' isn't a .vm file!")
            exit(1)
        consume(path)


def consume(path: Path) -> None:
    pr = Parser(path)
    cw = CodeWriter(path)

    while pr.has_more_lines():
        pr.advance()
        command = pr.command[0]
        command_type = pr.command_type

        if command_type == C_PUSH:
            cw.write_push(pr.arg1, pr.arg2)
        elif command_type == C_POP:
            cw.write_pop(pr.arg1, pr.arg2)
        elif command_type == C_ARITHMETIC:
            cw.write_arithmetic(command)
        elif command_type == C_GOTO:
            cw.write_goto(pr.arg1)
        elif command_type == C_IF:
            cw.write_if(pr.arg1)


if __name__ == "__main__":
    main()
