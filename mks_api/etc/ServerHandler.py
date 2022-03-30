import abc


class ServerHandler:
    def __init__(self):
        self._current_server = {}
        self._servers = {}

    def switch(self, server_name):
        self._current_server = self._servers[server_name]

    def get_port(self) -> str:
        return self._current_server['port']

    def get_hostname(self) -> str:
        return self._current_server['hostname']
