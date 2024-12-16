def start_server():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # establish connection
    server.bind((My_IP, PORT)) # combine ip + port
    print(My_IP +":"+ PORT)  # print it 
    server.listen(max_clients) # start server
    print("Server now listening on port: " +str(PORT)) # ping port
    while True:
        client_socket, client_address = server.accept() # if joined
        print(f"Player connected from {client_address}") # establish connection
        if client_address not in logs:
            no_of_clients += 1
        client_socket.setblocking(0) # turn off blocking
        threading.Thread(target=handle_client, args=(client_socket, client_address, logs)).start() # thread for game
        pass
