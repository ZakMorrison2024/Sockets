function client_disconnect(){

ds_map_destroy(client_map);
network_destroy(socket);

}
