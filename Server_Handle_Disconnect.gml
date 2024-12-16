function server_handle_disconnect(socket_id){

with(client_map[? string(socket_id)])
{instance_destroy();}

ds_map_delete(client_map, socket_id);
}
