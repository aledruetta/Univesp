#!/usr/bin/env python3

# file: ceasar.py

import argparse
import string

printables = string.ascii_letters + string.punctuation + "áéíóúñÁÉÍÓÚÑ "


class Ceasar:
    def __init__(self, offset):
        self.offset = int(offset)

    def encrypt(self, plaintext):
        cyphertext = ""
        for char in plaintext:
            index = (printables.find(char) + self.offset) % len(printables)
            cyphertext += printables[index]

        return cyphertext

    def decrypt(self, cyphertext):
        plaintext = ""
        for char in cyphertext:
            index = (printables.find(char) - self.offset)
            plaintext += printables[index]

        return plaintext


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("plain", help="Message in plaintext")
    parser.add_argument("-o", "--offset", default=3)
    args = parser.parse_args()

    ceasar = Ceasar(args.offset)

    cyphertext = ceasar.encrypt(args.plain)
    print(f"encrypt -> '{cyphertext}'")

    plaintext = ceasar.decrypt(cyphertext)
    print(f"decrypt -> '{plaintext}'")


if __name__ == "__main__":
    main()
