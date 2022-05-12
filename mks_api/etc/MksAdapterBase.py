import re
import os

from mks_api.etc.mks_api_tools import get_args
from mks_api.etc.MksCommunication import MksCommunication


class MksAdapterBase(MksCommunication):
    """Common mks commmands shared amongst si/im/aa"""
    def __init__(self, base_command):
        super().__init__(base_command)

    def get_mks_user_name(self) -> str:
        """Gets the mks user name of the current user"""
        raw_return = self.cmd("servers")
        found_user = re.findall(r"(\w*)@\b", raw_return)[0]
        return found_user

    def connect(self, username="", password="") -> str:
        """
        Connects to server, username and password are optional.
        When called without arguments will look for env variable
        MKS_USER and MKS_PASS for username and password

        :param username:
        :param password:
        :return: raw output of command
        """
        if len(username) == 0 or len(password) == 0:
            return self._raw_connect(os.environ['MKS_USER'],
                                     os.environ['MKS_PASS'])
        return self._raw_connect(username, password)

    def disconnect(self):
        return self._raw_disconnect()

    def _raw_connect(self, username: str, password: str) -> str:
        """
        Connects the user to the server
        :param username: mks username
        :param password: mks password
        :return:
        """
        args = get_args(user=username, password=password)
        return self.cmd('connect', args)

    def _raw_disconnect(self):
        return self.cmd('disconnect', get_args('yes'))

    def get_projects_on_server(self):
        return self._raw_projects()

    def _raw_projects(self):
        """Gets the list of projects on server"""
        return self.cmd("projects", get_args(hostname=self.server_handler.get_hostname()
                                             , port=self.server_handler.get_port(),
                                             password=';CreatinOverflow11'))




