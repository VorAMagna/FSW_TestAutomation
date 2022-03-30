import json


class MksServers:
    """Base Class for im/si/aa servers"""

    def __init__(self, servers_config_file):
        self.servers = {}
        with open(servers_config_file, "r") as file:
            self.servers = json.load(file)
