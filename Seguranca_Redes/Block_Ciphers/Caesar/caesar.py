#!/usr/bin/env python3

# file: ceasar.py

import argparse
import string

printables = string.ascii_letters + string.punctuation + "áéíóúñÁÉÍÓÚÑ "


class Ceasar:
    def __init__(self, offset):
        self.offset = offset

    def encrypt(self, plaintext):
        cyphertext = ""
        for char in plaintext:
            index = (printables.find(char) + self.offset) % len(printables)
            cyphertext += printables[index]

        return cyphertext


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("plain", help="Message in plaintext")
    parser.add_argument("-o", "--offset", default=3)
    args = parser.parse_args()

    ceasar = Ceasar(args.k)
    print(f"plaintext:\t '{args.plain}'")
    print(f"cyphertext:\t '{ceasar.encrypt(args.plain)}'")


if __name__ == "__main__":
    main()
