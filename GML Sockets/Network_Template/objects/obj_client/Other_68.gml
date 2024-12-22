/// @description Networking
var type_event = ds_map_find_value(async_load,"type"); // Async Connection Instructions

switch(type_event)
{
case network_type_data:
var buffer
buffer = ds_map_find_value(async_load,"buffer");
buffer_seek(buffer,buffer_seek_start,0);
client_handle_message(buffer);
break;

case network_type_disconnect:
client_disconnect();
break;
}