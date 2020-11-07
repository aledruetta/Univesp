#!/usr/bin/env python3

"""Simple UDP Client App"""

import socket

SERVER_NAME = '192.168.33.11'
SERVER_PORT = 12000

# Create IPv4 (AF_INET) and UDP (SOCK_DGRAM) client socket
client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

MESSAGE = str.encode(input('Input lowercase sentence: '))
client_socket.sendto(MESSAGE, (SERVER_NAME, SERVER_PORT))

modified_message = client_socket.recv(2048)
print('From server:', modified_message.decode())

client_socket.close()
