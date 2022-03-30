from mks_api.etc.ServerHandler import ServerHandler
from mks_api.im.ImServers import ImServers


class ImServerHandler(ServerHandler):
    __instance__ = None

    def __init__(self):
        super().__init__()
        self._servers = ImServers().servers
        self._current_server = self._servers['MPT_Lannach']

        if ImServerHandler.__instance__ is None:
            ImServerHandler.__instance__ = self
        else:
            raise Exception("You cannot create another SingletonGovt class")

    @staticmethod
    def get_instance():
        """ Static method to fetch the current instance.
       """
        if not ImServerHandler.__instance__:
            ImServerHandler()
        return ImServerHandler.__instance__
