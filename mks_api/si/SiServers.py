import json
from mks_api.mks_api_glob_config import SERVERS_CONFIG


class SiServers:
    """Holds si server information"""
    def __init__(self):
        self.servers = {}
        with open(SERVERS_CONFIG, "r") as file:
            self.servers = json.load(file)['si']


