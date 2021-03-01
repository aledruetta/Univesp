#!/usr/bin/env python3

# file: ceasar.py

import argparse
import random
import string

PRINTABLES = string.ascii_letters + \
        string.punctuation + \
        "áâàãéêèêíóôòõúñçÁÂÀÃÉÊÈẼÍÓÔÒÕÚÑÇ 1234567890"


class Caesar(Cypher):
    def __init__(self, offset):
        self.key = list(PRINTABLES)
        self.offset = int(offset)

        random.shuffle(self.key)

    def encrypt(self, plaintext):
        cyphertext = ""
        for char in plaintext:
            index = (self.key.index(char) + self.offset) % len(self.key)
            cyphertext += self.key[index]

        return cyphertext

    def decrypt(self, cyphertext):
        plaintext = ""
        for char in cyphertext:
            index = (self.key.index(char) - self.offset)
            plaintext += self.key[index]

        return plaintext


def main():
    pass
    parser = argparse.ArgumentParser()
    parser.add_argument("plain", help="Message in plaintext")
    parser.add_argument("-o", "--offset", default=3)
    args = parser.parse_args()

    caesar = Caesar(args.offset)
    print(f'cypher  -> {"".join(caesar.key)}')

    cyphertext = caesar.encrypt(args.plain)
    print(f"encrypt -> {cyphertext}")

    plaintext = caesar.decrypt(cyphertext)
    print(f"decrypt -> {plaintext}")


if __name__ == "__main__":
    main()
