import re

from mks_api.etc.mks_api_tools import get_args
import global_config
from mks_api.etc.MksAdapterBase import MksAdapterBase
from mks_api.si.SiServerHandler import SiServerHandler


class SiAdapterBase(MksAdapterBase):
    """The basic less abstracted functions lay here"""
    def __init__(self):
        """
        :param servername: the name of the server defined in the list of servers
        the hostname and the port will be fetched from the data linked to the
        name
        :param hostname:
        :param port:
        """

        super().__init__("si")

    def _raw_view_sandbox(self, path: str):
        """Not finished, supposed to get the overlaying sandbox of the path"""
        raw_sandbox = self.cmd(f"viewsandbox", f"{path}")
        return raw_sandbox

    def _raw_drop(self, path: str, cpid: str, **kwargs):
        """
        Drops a si Member
        """
        return self.cmd(f"drop", f"{get_args('yes', cpid=cpid, **kwargs)} {str(path)}")

    def _raw_get_change_package(self, full_id: str):
        """Gets the raw change package response from si"""
        return self.cmd("viewcp", full_id)

    def _raw_check_in(self, filepath, cp_id, **kwargs):
        raw_response_str = self.cmd(
            "ci",
            f"{get_args('no', cpid=cp_id,**kwargs)} {filepath}")

        return raw_response_str

    def _raw_close_change_package(self, cp_id, **kwargs) -> bool:
        """
        closes a change package
        :param cp_id: the *full* id of the change package
        :type cp_id: str
        """
        raw_response_str = self.cmd("closecp",
                                  f"{get_args('noconfirm', 'yes', **kwargs)} "
                                  f"{cp_id}")

        return raw_response_str

    def _raw_lock_in(self, filepath: str,
                     change_package_id: str, **kwargs):
        """
        Locks a file in
        :param filepath: path of the file
        :param change_package_id: the change package id
        :param kwargs: additional arguments eg: locktype etc...'
        """
        arguments = "{} {}".format(
            get_args(cpid=change_package_id, **kwargs), filepath)

        raw_return_str = self.cmd("lock", arguments)

        return raw_return_str

    def _raw_lock_remove(self, filepath: str, **kwargs):
        """
        Removes a lock on a file
        :param filepath: path of the file
        :param change_package_id: the change package id
        :param kwargs: additional arguments eg: locktype etc...'
        """
        arguments = "{} {}".format(get_args(**kwargs), filepath)

        raw_return_str = self.cmd("unlock", arguments)

        return raw_return_str

    def _raw_add(self, filepath, change_package_id, **kwargs):
        """adds a file to a si sandbox"""

        arguments = f"{get_args('no' ,cpid=change_package_id, **kwargs)} " \
                    f"{filepath}"

        raw_response_str = self.cmd("add", arguments)

        return raw_response_str

    def set_server_for_project(self):
        """Searches on the current server for the project.
        If not found search on other server"""
        projects = self.get_projects_on_server().split("\n")
        l_ialm = list()
        l_mks = list()
        for s in projects:
            reg_ialm = re.search(r'/Projects/(.*?)/', s)
            reg_mks = re.search(r'(?<=c:/MKS_Archiv/).*?(?=/)', s)
            if reg_ialm is not None:
                l_ialm.append(reg_ialm.group(1))
            if reg_mks is not None:
                l_mks.append(reg_mks.group())

        #print(global_config.current_model)
        current_project = re.findall(r'([A-Z](\w|-)+)', str(global_config.current_model))[1][0]

        if global_config.CURRENT_SERVER == 'MPT_StValentin':
            if current_project in l_ialm:
                global_config.CURRENT_SERVER = 'MPT_StValentin'
            else:
                global_config.CURRENT_SERVER = 'MPT_Lannach'
                SiServerHandler.reset_instance()

        elif global_config.CURRENT_SERVER == 'MPT_Lannach':
            if current_project in l_mks:
                global_config.CURRENT_SERVER = 'MPT_Lannach'
            else:
                global_config.CURRENT_SERVER = 'MPT_StValentin'
                SiServerHandler.reset_instance()
        else:
            raise Exception('Finding server for project Error')
        #SiServerHandler.reset_instance()