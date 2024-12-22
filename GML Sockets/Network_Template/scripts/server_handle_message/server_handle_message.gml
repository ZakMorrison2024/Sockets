function server_handle_message(buffer, socket, client_socket, client){
while(true)
{
	var	message_id = buffer_read(buffer, buffer_string); // read incoming buffer
	var username, chat_message, dialog_input // username, chat_message, dialog_input
	
	switch(message_id)
	{
		
			case "messsage_join": // client join
				username = buffer_read(buffer,buffer_string); // find username
				client.name = username; // set username
				buffer_seek(buffer, buffer_seek_start, 0);
				buffer_write(buffer, buffer_string, "client_join");
				buffer_write(buffer, buffer_u8, client);
				buffer_write(buffer, buffer_string, string(client.name));
				
				if client_map[? client_socket].client_id != client
				{network_send_raw(socket, buffer, buffer_tell(buffer));}
				
			break;
			
			case "message_move": // if intial message is "message_move"
				client.xx = buffer_read(buffer, buffer_u16)
				client.yy = buffer_read(buffer, buffer_u16)
				
				buffer_seek(buffer, buffer_seek_start, 0);
				buffer_write(buffer, buffer_string, "client_move");
				buffer_write(buffer, buffer_u8, client);
				buffer_write(buffer, buffer_u16, client.xx);
				buffer_write(buffer, buffer_u16, client.yy);
				
				if client_map[? client_socket].client_id != client
				{network_send_raw(socket, buffer, buffer_tell(buffer));}
				
			break;
			
			case "messsage_chat":
				username = client.name
				chat_message = buffer_read(buffer,buffer_string);
				
                global.dialog_input = string(username +" : "+ chat_message);
				
				buffer_seek(buffer, buffer_seek_start, 0);
				buffer_write(buffer, buffer_string, "client_message");
				buffer_write(buffer, buffer_u8, client);
				buffer_write(buffer, buffer_string, global.dialog_input);
				
				if client_map[? client_socket].client_id != client
				{network_send_raw(socket, buffer, buffer_tell(buffer));}
				
			break;
			
	}
	
	if buffer_tell(buffer) == buffer_get_size(buffer)
	{
		break;
	}
}
}