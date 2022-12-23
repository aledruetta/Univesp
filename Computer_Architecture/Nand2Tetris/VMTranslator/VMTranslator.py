#!/usr/bin/env python3

import sys
from parser import Parser
from pathlib import Path

from codewriter import CodeWriter
from utilities import *


def main():
    if len(sys.argv) > 1:
        input = Path(sys.argv[1].strip())

    if not input.exists():
        print(f"Error: '{input}' doesn't exist!")
        exit(1)
    elif input.is_dir():
        output = input.joinpath(input.parts[-1]).with_suffix(".asm")
        __truncate(output)

        for child in input.iterdir():
            if child.suffix == ".vm":
                consume(child, output)
    elif input.suffix == ".vm":
        output = input.with_suffix(".asm")
        __truncate(output)

        consume(input, output)
    else:
        print(f"Error: '{input}' isn't a .vm file!")
        exit(1)


def consume(input: Path, output: Path) -> None:
    pr = Parser(input)
    cw = CodeWriter(input, output)

    while pr.has_more_lines():
        pr.advance()

        if pr.command_type == C_PUSH:
            cw.write_push(pr.arg1, pr.arg2)  # segment, index
        elif pr.command_type == C_POP:
            cw.write_pop(pr.arg1, pr.arg2)  # segment, index
        elif pr.command_type == C_ARITHMETIC:
            cw.write_arithmetic(pr.command[0])
        elif pr.command_type == C_LABEL:
            cw.write_label(pr.arg1)  # label
        elif pr.command_type == C_GOTO:
            cw.write_goto(pr.arg1)  # label
        elif pr.command_type == C_IF:
            cw.write_if(pr.arg1)  # label
        elif pr.command_type == C_FUNCTION:
            cw.write_function(pr.arg1, int(pr.arg2))  # label, n_locals
        elif pr.command_type == C_CALL:
            cw.write_call(pr.arg1, int(pr.arg2))  # label, n_args
        elif pr.command_type == C_RETURN:
            cw.write_return()


def __truncate(output: Path) -> None:
    with open(output, "w") as fp:
        fp.truncate()


if __name__ == "__main__":
    main()
