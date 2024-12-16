def check_client_timeout(client_socket, client_address): # Test for time out
      try:
         for client_address in logs.keys(): # if client in logs
          client_socket.send(b"PING") # ping them
          return True # if good, leave to enjoy game
      except socket.error:
         client_socket.close() # else close connection
         no_of_clients -= 1
         return False
      if True:
            start_client_timer(dt+120,client_socket, client_address)
