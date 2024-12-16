import socket # Sockets
import threading # Multi-threading
import datetime # date and time
import asyncio # async

Multiplayer = False # Network mode
player_name = "" # Network alias
hostname = socket.gethostname() # Hostname
My_IP = socket.gethostbyname(hostname) # Player IP address
PORT = 8080 # Player Port
Server = False # Server Mode

max_clients = 8 # Max number of connections
no_of_clients = 0 # How many clients are active

logs = [] # logs
