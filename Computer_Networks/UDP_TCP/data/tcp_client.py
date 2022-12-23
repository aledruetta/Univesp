#!/usr/bin/env python3

"""Simple TCP Client App"""

import socket

SERVER_NAME = '192.168.33.11'
SERVER_PORT = 12000

# Create IPv4 (AF_INET) and TCP (SOCK_STREAM) client socket
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((SERVER_NAME, SERVER_PORT))

MESSAGE = str.encode(input('Input lowercase sentence: '))
client_socket.send(MESSAGE)

modified_message = client_socket.recv(2048)
print('From Server:', modified_message.decode())

client_socket.close()
