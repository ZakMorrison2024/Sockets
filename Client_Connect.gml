function client_connect(ip, port, name){

var socket = network_create_socket(network_socket_tcp);
var connect = network_connect_raw(socket,ip,port),

client_map = ds_map_create();

if connect < 0 {show_error("Couldn't connect",0);};
buffer_seek(send_buffer, buffer_seek_start,0);
buffer_write(send_buffer, buffer_u8, message_join);
buffer_write(send_buffer, buffer_string, name);
network_send_raw(socket,send_buffer,buffer_tell(send_buffer));
}
