function client_get_object(client_id){

if ds_map_exists(client_map, string(client_id))
{ 
	return client_object = client_map[? string(client_id)];	
}
else
{
 var l = instance_create_depth(xx,yy,0,obj_other_client);
client_map[? string(client)] = l;
return l;
}
}
