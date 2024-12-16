function client_send_movement(){
buffer_seek(send_buffer, buffer_seek_start, 0);
buffer_write(send_buffer, buffer_u8, message_move);
buffer_write(send_buffer, buffer_u16, xx);
buffer_write(send_buffer, buffer_u16, yy);
network_send_raw(socket, send_buffer, buffer_tell(send_buffer));
}
