#!/usr/bin/env python3

"""Simple TCP Server App"""

import socket

SERVER_PORT = 12000

# Create IPv4 (AF_INET) and UDP (SOCK_DGRAM) server socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(('', SERVER_PORT))
server_socket.listen(1)

print('The server is ready to receive')

while True:
    connection_socket, addr = server_socket.accept()

    message = connection_socket.recv(2048)
    modified_message = message.upper()
    connection_socket.send(modified_message)
    print(message.decode(), '->', modified_message.decode())

    connection_socket.close()
