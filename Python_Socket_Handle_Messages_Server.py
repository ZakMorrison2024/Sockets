def handle_client(client_socket, client_address, logs):
   message = client_socket.recv(1024).decode() # recieved 1024 bit socket/buffer
   start_client_timer(dt+120,client_socket,client_address) # reset users in-activity timer
   print(f"Player {client_address} said: {message}") # print message
   logs[client_address].append(message) # add to logs
   tot_log = len(list(logs.keys())) # find total logs size
   if tot_log > 0: # if logs greater than nothing
      key_value_log = logs[list(logs.keys())[tot_log]] # use latest log
   else:
      key_value_log = logs[list(logs.keys())[0]] # else use the 0th one
      
# Send result back to all players
   for client_address in logs.keys():
      client_socket.send(key_value_log.encode()) # Send data to other clients

      print("sent to: " + client_address)

   if message.read == int: # of int 
       network_action(int(message)) # action the command
