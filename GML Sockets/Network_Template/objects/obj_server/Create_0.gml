/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5DB10747
/// @DnDArgument : "code" "/// @description Server_Create$(13_10)port = 8000; // Temp Port Number$(13_10)max_clients = 8; // Client Limiter$(13_10)$(13_10)server = network_create_server(network_socket_tcp,port,max_clients); // Initiate Server$(13_10)server_socket = network_create_socket(network_socket_tcp);$(13_10)server_buffer = buffer_create(1024,buffer_fixed,1); // Buffer for Data$(13_10)buffer = 0;$(13_10)$(13_10)client_map = ds_map_create();$(13_10)no_of_clients = 0;"
/// @description Server_Create
port = 8000; // Temp Port Number
max_clients = 8; // Client Limiter

server = network_create_server(network_socket_tcp,port,max_clients); // Initiate Server
server_socket = network_create_socket(network_socket_tcp);
server_buffer = buffer_create(1024,buffer_fixed,1); // Buffer for Data
buffer = 0;

client_map = ds_map_create();
no_of_clients = 0;