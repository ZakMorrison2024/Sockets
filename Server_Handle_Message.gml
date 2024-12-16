function server_handle_message(socket_id, buffer){

var client_object = client_map[? string(socket_id)];
var client_id_current = client_object.client_id;

while(true)
{
	var	message_id;
	message_id = buffer_read(buffer, buffer_u8);

	switch(message_id)
	{
			case message_move:
				buffer_seek(send_buffer, buffer_seek_start,0);
				buffer_write(send_buffer, buffer_u8, message_move);
				buffer_write(send_buffer, buffer_u16, client_id_current);
				//buffer_write(send_buffer, buffer_u16, // send value);
				with (obj_server_client)
				{
					if client_id != client_id_current
					{network_send_raw(self.socket_id,other.send_buffer,buffer_tell(other.send_buffer));}
				}
				
			break;
			case message_join:
					username = buffer_read(buffer, buffer_string);
					client_object.name = username;
					
					buffer_seek(send_buffer, buffer_seek_start,0);
					buffer_write(send_buffer, buffer_u8, message_join);
					buffer_write(send_buffer, buffer_u16, client_id_current);
					buffer_write(send_buffer, buffer_string, username);
					
					//send the newly joining name to all other clients
					with(obj_server_client)
					{
						if client_id != client_id_current
						{network_send_raw(self.socket_id,other.send_buffer, buffer_tell(other.send_buffer));}
					}
					
					/// send the newly joined client hte name of all other cleitns
					with(obj_server_client)
					{
						if client_id != client_id_current
						{
								buffer_seek(other.send_buffer, buffer_seek_start,0);
								buffer_write(other.send_buffer, buffer_u8, message_join);
								buffer_write(other.send_buffer, buffer_u16, client_id);
								buffer_write(other.send_buffer, buffer_string, name);
								network_send_raw(socket_id, other.send_buffer, buffer_tell(other.send_buffer));
						}
					}
			
			break;
	}
	if buffer_tell(buffer) == buffer_get_size(buffer)
	{
		break;
	}
}
}
