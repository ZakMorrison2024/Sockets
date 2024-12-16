function server_create(port){
	var server = network_create_server_raw(network_socket_tcp,port,4);
	var client_map = ds_map_create();
	var client_id_counter = 0;
	var send_buffer = buffer_create(256,buffer_fixed,1);
	if server < 0 {show_error("Failed to connect",0);}
	return server;
}
