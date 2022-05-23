from mks_api.etc.ServerHandler import ServerHandler
from mks_api.si.SiServers import SiServers
from typing import List


class SiServerHandler(ServerHandler):
    __instance__ = None

    def __init__(self):
        super().__init__()
        self._servers = SiServers().servers
        self._current_server = self._servers['MPT_Lannach']

        if SiServerHandler.__instance__ is None:
            SiServerHandler.__instance__ = self
        else:
            raise Exception("You cannot create another SingletonGovt class")

    @staticmethod
    def get_instance():
        """ Static method to fetch the current instance.
       """
        if not SiServerHandler.__instance__:
            SiServerHandler()
        return SiServerHandler.__instance__
