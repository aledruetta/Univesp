#!/usr/bin/env python3

import sys

from parser import Parser
import codewriter

def main():
    parser = Parser(sys.argv[1].strip())

    while parser.has_more_lines():
        parser.advance()
        print(parser.command, parser.command_type(), parser.arg1(), parser.arg2())

if __name__ == "__main__":
    main()