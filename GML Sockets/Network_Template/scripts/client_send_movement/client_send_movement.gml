function client_send_movement(socket,client_buffer,xx,yy){
buffer_seek(client_buffer, buffer_seek_start, 0);
buffer_write(client_buffer, buffer_string, "message_move");
buffer_write(client_buffer, buffer_u16, xx);
buffer_write(client_buffer, buffer_u16, yy); 
network_send_raw(socket, client_buffer, buffer_tell(client_buffer));
}