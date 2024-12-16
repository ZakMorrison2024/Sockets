def multiplayer(): # multiplayer option
   if Server == True: # if server
      player_name = input("Please type in your name.")
      PORT = input("Please pick a port number i.e. 8080 or 5050, etc etc...") # ask for port
      start_server() # start_server
      print(My_IP) # show IP
      print(PORT) # show PORT
