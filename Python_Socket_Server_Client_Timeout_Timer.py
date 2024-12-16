def start_client_timer(duration,client_socket, client_address):
   if delta_time > duration: # if delta time greater than timer
      check_client_timeout(client_socket, client_address) # probe user
