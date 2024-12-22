/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2E41423F
/// @DnDArgument : "code" "/// @description Client Connect$(13_10)socket = network_create_socket(network_socket_tcp);$(13_10)connect = network_connect_raw(socket,ip,port);$(13_10)$(13_10)if connect < 0 {show_error("Couldn't connect",0);}$(13_10)else$(13_10){$(13_10)client_buffer = buffer_create(1024,buffer_fixed,1);$(13_10)client_peer_map = ds_map_create();$(13_10)$(13_10)buffer_seek(client_buffer, buffer_seek_start,0);$(13_10)buffer_write(client_buffer, buffer_string, "message_join");$(13_10)buffer_write(client_buffer, buffer_string, string(username));$(13_10)network_send_raw(socket,client_buffer,buffer_tell(client_buffer));$(13_10)}"
/// @description Client Connect
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

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5F26E46C
/// @DnDArgument : "code" "/// @description Client_vars$(13_10)username = "";$(13_10)"
/// @description Client_vars
username = "";