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
        segment = parser.arg1()
        index = str(parser.arg2())

        if command_type == C_PUSH:
            codewriter.write_push(command, segment, index)
        elif command_type == C_POP:
            codewriter.write_pop(command, segment, index)
        elif command_type == C_ARITHMETIC:
            codewriter.write_arithmetic(command)

if __name__ == "__main__":
    main()