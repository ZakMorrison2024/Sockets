function client_disconnect(){
ds_map_destroy(client_peer_map);
network_destroy(client_socket);
global.connect = 0
}