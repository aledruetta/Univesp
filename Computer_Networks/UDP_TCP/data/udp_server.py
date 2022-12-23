#!/usr/bin/env python3

"""Simple UDP Server App"""

import socket

SERVER_PORT = 12000

# Create IPv4 (AF_INET) and UDP (SOCK_DGRAM) server socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server_socket.bind(('', SERVER_PORT))
print('The server is ready to receive')

while True:
    message, client_address = server_socket.recvfrom(2048)
    modified_message = message.upper()
    print(message.decode(), '->', modified_message.decode())
    server_socket.sendto(modified_message, client_address)
