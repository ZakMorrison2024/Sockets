/// @description Server_Create
port = 8000; // Temp Port Number
max_clients = 8; // Client Limiter

server = network_create_server(network_socket_tcp,port,max_clients); // Initiate Server
server_socket = network_create_socket(network_socket_tcp);
server_buffer = buffer_create(1024,buffer_fixed,1); // Buffer for Data
buffer = 0;

client_map = ds_map_create();
no_of_clients = 0;