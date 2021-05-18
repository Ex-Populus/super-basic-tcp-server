/// @function handle_client_connect(async_load_map, sockets);
/// @param {map} async_load_map The async_load map object for the event
/// @param {list} sockets The server's list of client sockets

function handle_client_connect(_async_load_map, _sockets) {
	var socket = ds_map_find_value(_async_load_map, "socket");
	ds_list_add(_sockets, socket);
	
	var test_data = {
		thing: "thing",
		stuff: "some stuff",
		blah: 6,
	};
	
	var test_command = cmd_test(test_data);
	var buffer = buffer_create(1024, buffer_fixed, 1);
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_string, test_command);
	network_send_packet(socket, buffer, buffer_tell(buffer));
	
	return ds_map_find_value(_async_load_map, "id");
}