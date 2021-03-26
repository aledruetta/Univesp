#!/usr/bin/env python3

# Client side

from socket import *

HOST = "192.168.1.2"
PORT = 5001

s = socket(AF_INET, SOCK_STREAM)
s.connect((HOST, PORT))

msg = input("say> ")
s.send(msg.encode())

data = s.recv(1024)
print(f"echo> {data.decode()}")

s.close()

