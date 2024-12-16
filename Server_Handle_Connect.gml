function server_handle_connect(socket_id){

var l = instance_create_depth(0,0,0,obj_server_client);
l.socket_id = socket_id;
l.client_id = client_id_counter++;

if client_id_counter >= 65000 {client_id_counter = 0;};

client_map[? string(socket_id)] = l;

if ds_list_size(client_map) > 1
{global.player_2 = true;}
if ds_list_size(client_map) > 2
{global.player_3 = true;}
if ds_list_size(client_map) > 3
{global.player_4 = true;}
}
