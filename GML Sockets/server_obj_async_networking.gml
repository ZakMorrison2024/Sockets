/// @description Networking
var type_event = ds_map_find_value(async_load,"type"); // Async Connection Instructions

switch(type_event) // Server Event Switch Statement
	{
		case network_type_connect:
		
		// Case Connection Established
				//collect socket
				
				var socket = ds_map_find_value(async_load,"socket"); // Add Socket
				ds_list_add(list,"socket"); // Add to External Socket Reference

				//create client inference
				var connected_instance
				connected_instance = instance_create_depth(x,y,0,obj_server_client); // Create Client Object Reference in-game
				connected_instance.socket_id = socket; // Assign Socket ID
				connected_instance.client_id = no_of_clients; // Increase Client Object Server Count
				//add to map
				client_map[? string(socket)] = connected_instance; // Add Active Player/Connection to Player Reference

				//find client from map
				var current_client_id = client_map[? string(socket)].client_id; // Find Speific Player in Reference

				if client_map[? socket].client_id != current_client_id
					{
				//send socket basic data
				buffer_seek(server_buffer,buffer_seek_start,0); // Reset Buffer
				buffer_write(server_buffer,buffer_string,"client_join"); // Write Client Response Case to Buffer
				buffer_write(server_buffer,buffer_u8,client_map[? socket].client_id); // Write Current Client Reference to Buffer
				network_send_packet(server_socket,server_buffer,buffer_tell(server_buffer)); // Send Buffer over TCP
					}
					
				if client_map[? socket].client_id == current_client_id
					{	
				buffer_seek(server_buffer,buffer_seek_start,0); // Reset Buffer
				buffer_write(server_buffer,buffer_string,"just_join"); 
				buffer_write(server_buffer,buffer_u8,current_client_id); // Write Current Client Reference to Buffer
				buffer_write(server_buffer,buffer_u8,no_of_clients)
					}
					
				no_of_clients ++;
				
				break;

		case network_type_disconnect: // Case Connection Disconnected
					socket = ds_map_find_value(async_load,"socket"); // Finding Socket
					current_client_id = client_map[? string(socket)].client_id; // Finding Disconnected Player ID

					if client_map[? socket].client_id != current_client_id
					{
					buffer_seek(server_buffer,buffer_seek_start,0); // Reset Buffer
					buffer_write(server_buffer,buffer_string,"client_disconnected");
					buffer_write(server_buffer, buffer_u8,client_map[? socket].client_id)
					buffer_write(server_buffer, buffer_u8,current_client_id)
					
					network_send_packet(server_socket,server_buffer,buffer_tell(server_buffer));
					}

				
					if client_map[? string(socket)].client_id == current_client_id
						{ 
						
						ds_map_delete(client_map,string(socket)); // Remove from Player Reference
						
						with(obj_server_client)
						{
						if client_id = current_client_id
						   {instance_destroy()}
						}
						}
						
					break;


	case network_type_data: // Case Data Transfer 
		var client_socket, client
		client_socket = ds_map_find_value(async_load,"socket"); // Find Socket
		client = client_map[? string(client_socket)].client_id
		server_handle_message(server_buffer, server_socket, client_socket, client); // External Script 
	break;
}
