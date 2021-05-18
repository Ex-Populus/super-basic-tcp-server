/// @function cmd_test(data, buffer);
/// @param {json} data The command data

function cmd_test(_data) {
	value = {
		command: "test",
		data: _data,
	};
	
	return json_stringify(value);
}