from mks_api.etc.mks_api_tools import Singleton
from mks_api.im.ImServers import ImServers
from mks_api.si.SiServers import SiServers

@Singleton
class MksApiList:
    """
    A singleton containing all of the connections to si and im
    Multiple mks si/im connections at the same time can be archieved with
    this
    """
    def __init__(self):
        si_servers = SiServers()
        im_servers = ImServers()

