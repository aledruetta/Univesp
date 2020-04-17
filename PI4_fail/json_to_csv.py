#!/usr/bin/env python3

"""Converte um arquivo json em um outro em
   formato csv.
   Receve como argumentos um arquivo de entrada com um
   objeto json e um arquivo de saída para salvar a
   entrada formatada como csv.
"""

import csv
import json
import sys

if sys.argv[1] is not None and sys.argv[2] is not None:

    FIN = open(sys.argv[1])
    FOUT = open(sys.argv[2], 'w')

    DATA = json.load(FIN)
    FIN.close()

    WRITER = csv.writer(FOUT)

    WRITER.writerow(DATA[0].keys())
    for row in DATA:
        WRITER.writerow(row.values())

    FOUT.close()
