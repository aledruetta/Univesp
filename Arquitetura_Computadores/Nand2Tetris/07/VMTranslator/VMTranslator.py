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
        if parser.command_type() == C_POP or parser.command_type() == C_PUSH:
            codewriter.write_push_pop(parser)
        print(parser.command, parser.command_type(), parser.arg1(), parser.arg2())

if __name__ == "__main__":
    main()