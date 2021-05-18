/// @description Server startup

app_id = "SERVER";

port = 8996
max_clients = 2;

network_create_server(network_socket_tcp, port, max_clients);
server_buffer = buffer_create(1024, buffer_fixed, 1);
sockets = ds_list_create();
