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
        command_type = parser.command_type()

        if command_type == C_POP or command_type == C_PUSH:
            codewriter.write_push_pop(parser)
        elif command_type == C_ARITHMETIC:
            codewriter.write_arithmetic(parser.command[0])

if __name__ == "__main__":
    main()