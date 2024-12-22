function client_handle_message(buffer){
while(true)
{
	var	message_id = buffer_read(buffer, buffer_string); // read incoming buffer
	var username, chat_message, dialog_input // username, chat_message, dialog_input
	var client_id = buffer_read(buffer,buffer_u8);
	
	switch(message_id)
	{
		
			case "client_join": // client join
				client_peer_map[? client_id] = instance_create_depth(0,0,0,obj_client_peer);
				client_peer_map[? client_id].client_id = client_id;
				client_peer_map[? client_id].name = buffer_read(buffer,buffer_string);
				
			break;
			
			case "client_disconnect": // client disconnect
				
				with (client_peer_map[? client_id])
				{instance_destroy()}
				
			break;
			
			case "client_move": // client disconnect
				
				client_peer_map[? client_id].xx = buffer_read(buffer,buffer_u16);
				client_peer_map[? client_id].yy = buffer_read(buffer,buffer_u16);
				
			break;
			
				case "client_message": // client join
				client_peer_map[? client_id].message_input = buffer_read(buffer,buffer_string);
				
			break;
		
	}
	
  }
}