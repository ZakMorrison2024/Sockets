/// @description Client_init
username = "Test"; // Placeholder for input
ip = "127.0.0.1"; // Local Host
port = "8080"; // HTTP Port

/// @description Client_connect
socket = network_create_socket(network_socket_tcp);
connect = network_connect_raw(socket,ip,port);

if connect < 0 {show_error("Couldn't connect",0);}
else
{
client_buffer = buffer_create(1024,buffer_fixed,1);
client_peer_map = ds_map_create();

buffer_seek(client_buffer, buffer_seek_start,0);
buffer_write(client_buffer, buffer_string, "message_join");
buffer_write(client_buffer, buffer_string, string(username));
network_send_raw(socket,client_buffer,buffer_tell(client_buffer));
}
