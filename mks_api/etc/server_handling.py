from mks_api.im.ImServerHandler import ImServerHandler
from mks_api.si.SiServerHandler import SiServerHandler


def get_si_server_handler() -> SiServerHandler:
    """
    Gets an SiServerHandler singleton instance
    only call this, do not construct from outisde
    :return:
    """
    return SiServerHandler.get_instance()


def get_im_server_handler() -> ImServerHandler:
    """
    Gets an SiServerHandler singleton instance
    only call this, do not construct from outisde
    :return:
    """
    return ImServerHandler.get_instance()
