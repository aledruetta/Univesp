import datetime
import hashlib
import json

from flask import Flask, jsonify


class Blockchain:

    def __init__(self):
        self.cadeia = []
        self.crear_bloco(prova=1, hash_anterior='0')

    def crear_bloco(self, prova, hash_anterior):
        bloco = {'index': len(self.cadeia) + 1,
                 'timestamp': str(datetime.datetime.now()),
                 'prova': prova,
                 'hash_anterior': hash_anterior}
        self.cadeia.append(bloco)
        return bloco

    def obter_bloco_anterior(self):
        return self.cadeia[-1]

    def prova_de_trabalho(self, prova_anterior):
        nova_prova = 1
        checar_prova = False
        while checar_prova is False:
            hashing = hashlib.sha256(str(nova_prova**2 - prova_anterior**2).encode()).hexdigest()
            if hashing[:4] == '0000':
                checar_prova = True
            else:
                nova_prova += 1
        return nova_prova

    def hash(self, bloco):
        bloco_codificado = json.dumps(bloco, sort_keys=True).encode()
        return hashlib.sha256(bloco_codificado).hexdigest()

    def cadeia_validada(self, cadeia):
        bloco_previo = cadeia[0]
        bloco_index = 1
        while bloco_index < len(cadeia):
            bloco = cadeia[bloco_index]
            if bloco['hash_anterior'] != self.hash(bloco_previo):
                return False
            prova_anterior = bloco_previo['prova']
            prova = bloco['prova']
            hashing = hashlib.sha256(str(prova**2 - prova_anterior**2).encode()).hexdigest()
            if hashing[:4] != '0000':
                return False
            bloco_previo = bloco
            bloco_index += 1
        return True


app = Flask(__name__)
blockchain = Blockchain()


@app.route('/minerar_bloco', methods=['GET'])
def minerar_bloco():
    bloco_anterior = blockchain.obter_bloco_anterior()
    prova_anterior = bloco_anterior['prova']
    prova = blockchain.prova_de_trabalho(prova_anterior)
    hash_anterior = blockchain.hash(bloco_anterior)
    bloco = blockchain.crear_bloco(prova, hash_anterior)
    response = {'message': 'Parabéns, você acabou de minerar um bloco!',
                'index': bloco['index'],
                'timestamp': bloco['timestamp'],
                'prova': bloco['prova'],
                'hash_anterior': bloco['hash_anterior']}
    return jsonify(response), 200


@app.route('/obter_cadeia', methods=['GET'])
def obter_cadeia():
    response = {'cadeia': blockchain.cadeia,
                'cumprimento': len(blockchain.cadeia)}
    return jsonify(response), 200


@app.route('/validar_cadeia', methods=['GET'])
def validar_cadeia():
    es_valido = blockchain.cadeia_validada(blockchain.cadeia)
    if es_valido:
        response = {'message': 'Beleza! O Blockchain está validado.'}
    else:
        response = {'message': 'Ops, temos um problema aqui. O Blockchain não foi validado...'}
    return jsonify(response), 200


app.run(host='0.0.0.0', port=5000)

