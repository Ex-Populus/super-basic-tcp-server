/// @function handle_client_connect(async_load_map, sockets);
/// @param {map} async_load_map The async_load map object for the event
/// @param {list} sockets The server's list of client sockets

function handle_client_data(_async_load_map) {
	var buffer = ds_map_find_value(_async_load_map, "buffer");
	buffer_seek(buffer, buffer_seek_start, 0);

	var buffer_data = buffer_read(buffer, buffer_string);
	var json = json_parse(buffer_data);
	var command = json.command;
	var data = json.data;

	switch(command) {
		case "client-test":
			show_debug_message("client-test data - " + string(data));
			break;
		
		default:
			show_debug_message("UNKNOWN COMMAND " + command)
			break;
	}
}