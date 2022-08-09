#!/usr/bin/env python3

import sys

from parser import Parser
from codewriter import CodeWriter
from utilities import *

def main():
    parser = Parser(sys.argv[1].strip())
    codewriter = CodeWriter("./output/Out.hack")

    while parser.has_more_lines():
        parser.advance()
        if parser.command_type() == C_POP or parser.command_type() == C_PUSH:
            codewriter.write_push_pop(parser)
        print(parser.command, parser.command_type(), parser.arg1(), parser.arg2())

if __name__ == "__main__":
    main()