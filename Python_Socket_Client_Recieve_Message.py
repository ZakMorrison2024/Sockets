def recv_message(message): # recieved message
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock: # establish connection
            sock.setblocking(0) # stop blocking sockets
            readable, writable, errored = select.select([sock], [], [], 0) # is readable buffer
            if readable:
                message = sock.recv(1024).decode() # read message
              
                if message == str: # if message is a string
                    return see_message(message) # read message
                elif message == int: # if message is a number
                    network_action(int(message))
                  
    except Exception as e:
       send_message(My_IP + " | "+ datetime +" | 404: Didn't get any message.")
       return "Error: Unable to recieve data from server."
    except BlockingIOError:
       sock.setblocking(0)# stop blocking
