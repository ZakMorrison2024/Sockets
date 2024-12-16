def send_message(message):
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock: # Establish a connection
            sock.setblocking(0) # stop blocking sockets
            sock.connect((online_host_address, online_host_port)) # connect to host
            readable, writable, errored = select.select([], [sock], [], 0) # find writable buffer
            if writable:
                sock.send(message.encode()) # send message
                print("message sent!")
            try:
               data = sock.recv(1024) # recieved 1024 bit data buffer
               if data: # if data
                  recv_message(data) # Process data
                  return print("message recieved!")
               else:
                   print("No data received.")
            except BlockingIOError:
                 sock.setblocking(0) # turn off block if on
                 print("No data available (BlockingIOError).")
            except Exception as e:
                 print(f"An error occurred: {e}")
    except Exception as e:
         print (f"Error: Unable to connect to server. {e}")
