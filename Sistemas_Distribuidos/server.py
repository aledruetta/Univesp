#!/usr/bin/env python3

# Server side

from socket import *

HOST = gethostname()
PORT = 5001

s = socket(AF_INET, SOCK_STREAM)
s.bind((HOST, PORT))
s.listen()

while True:
    (conn, addr) = s.accept()
    data = conn.recv(1024)
    if data:
        conn.send(data.upper())
        print(f"'{data.decode()}' from {addr}")

conn.close()
