/// @description State machine

type = ds_map_find_value(async_load, "type");

switch(type) {
	
	case network_type_connect:
		handle_client_connect(async_load, sockets);
		show_debug_message("client connected " + string(ds_list_size(sockets)));
		break;
		
	case network_type_disconnect:
		disconnected_client = handle_client_disconnect(async_load, sockets);
		show_debug_message("client disconnected (" + string(disconnected_client) + ")");
		break;
		
	case network_type_data:
		handle_client_data(async_load);
		break;
		
	default:
		show_debug_message("=====> !! UNKNOWN ASYNC LOAD TYPE");
	
}
