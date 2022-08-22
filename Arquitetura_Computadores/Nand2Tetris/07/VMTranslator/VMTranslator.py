#!/usr/bin/env python3

import sys
from pathlib import Path

from parser import Parser
from codewriter import CodeWriter
from utilities import *

def main():
    path = Path(sys.argv[1].strip())
    parser = Parser(path)
    codewriter = CodeWriter(path.name.replace("vm", "asm"))

    while parser.has_more_lines():
        parser.advance()
        command = parser.command[0]
        command_type = parser.command_type()
        arg1 = parser.arg1()        # segment or label
        arg2 = str(parser.arg2())   # index

        if command_type == C_PUSH:
            codewriter.write_push(arg1, arg2)
        elif command_type == C_POP:
            codewriter.write_pop(arg1, arg2)
        elif command_type == C_ARITHMETIC:
            codewriter.write_arithmetic(command)
        elif command_type == C_GOTO:
            codewriter.write_goto(arg1)
        elif command_type == C_IF:
            codewriter.write_If(arg1)

if __name__ == "__main__":
    main()