#!/usr/bin/env python3

import socket

server_name = '192.168.33.11'
server_port = 12000
client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
message = str.encode(input('Input lowercase sentence: '))
client_socket.sendto(message, (server_name, server_port))
modified_message, _ = client_socket.recvfrom(2048)
print(modified_message.decode())
client_socket.close()
