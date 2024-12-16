function client_handle_message(buffer){
while(true)
{
	var	message_id = buffer_read(buffer, buffer_u8);
	switch(message_id)
	{
			case message_move:
				var 
				client = buffer_read(buffer, buffer_u16),
				client_object = client_get_object(client);
				// add more buffer_read(buffer, buffer_u16);
				//client_object.x = xx
				with(obj_server_client)
				if client_id != client_id_current
				{
						network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
				}
			break;
			case messsage_join:
				var client
				client = buffer_read(buffer, buffer_u16);
				username = buffer_read(buffer,buffer_string);
				client_object = client_get_object(client);
				client_object.name = username;
			break;
	}
	if buffer_tell(buffer) == buffer_get_size(buffer)
	{
		break;
	}
}
}
