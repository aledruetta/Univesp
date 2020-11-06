#!/usr/bin/env python2

from socket import *

serverName = '192.168.33.11'
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_DGRAM)
message = raw_input('Input lowercase sentence: ')
clientSocket.sendto(message, (serverName, serverPort))
modifiedMessage, _ = clientSocket.recvfrom(2048)
print modifiedMessage
clientSocket.close()
