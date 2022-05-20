import re

from pathlib import Path

from mks_api.si.SiAdapter import SiAdapter
from mks_api.etc.exceptions.SiNoMemberException import SiNoMemberException
import global_config
from mks_api.si.SiChangePackage import SiChangePackage


class SiMember:
    """Representing a mks file in a sandbox"""

    def __init__(self, filepath: Path, add_if_no_member=False, change_package=None):
        """
        :param filepath: Path of member
        :param add_if_no_member: if set to true it will add the member to the server
        :param change_package: the change package used for adding if not a member
        :type change_package: SiChangePackage
        """
        self.filepath = filepath
        self.mks_api = SiAdapter()


        global_config.current_model = filepath
        SiAdapter().set_server_for_project()
        self.mks_api = SiAdapter()

        try:
            self.revision_info = self.mks_api.revision_info(filepath)
        except SiNoMemberException as err:
            if add_if_no_member:
                self.mks_api.add(filepath,
                                 change_package,
                                 onExistingArchive="sharearchive")
                self.revision_info = self.mks_api.revision_info(filepath)
            else:
                raise err

        self.win_username = self.get_win_username()

    def refresh_revision_info(self):
        self.revision_info = self.mks_api.revision_info(self.filepath)

    def view_revision(self, **kwargs):
        """Will return a raw string of the revision contents"""
        return self.mks_api.view_revision(self.filepath, **kwargs)

    def submit(self, change_package: SiChangePackage, description):
        """
        Abstracted checking in.

        Will handle the locking in, checking the revision in and the unlocking
        afterwards.

        It will not close the change package afterwards

        :param change_package: the change package used for the locking
        and the checking in

        :param description: description of the check in
        """
        self.lock_in(change_package)
        self.check_in(change_package, description)
        self.lock_remove()

    def lock_remove(self):
        return self.mks_api.lock_remove(self.filepath, action="remove")

    def lock_in(self, change_package: SiChangePackage, **kwargs):
        """
        Locks the member
        :param change_package:
        :param kwargs: additional si arguments if needed
        :return:
        """
        return self.mks_api.lock_in(self.filepath, change_package, **kwargs)

    def check_in(self, change_package: SiChangePackage, description,
                 **kwargs):
        """
        Checks the member in with a few added features
        Added Features: Will not close CP, will not keep the member locked
        :param change_package:
        :param description: description of the check in (commit message)
        :param kwargs: additional si arguments if needed
        :return:
        """
        return self.mks_api.check_in(
            self.filepath,
            description,
            change_package,
            nocloseCP=None,
            unlock=None,
            **kwargs)

    def drop(self, change_package: SiChangePackage, **kwargs):
        """"""
        return self.mks_api.drop(
            self.filepath,
            change_package,
            nocloseCP=None,
            **kwargs)

    def get_win_username(self) -> str:
        """Gets the windows of the user who uploaded the last revision"""
        created_by_str = self.revision_info['Created By']
        return self.exract_win_username(created_by_str)

    @staticmethod
    def exract_win_username(raw_string) -> str:
        """
        Gets the windows username of the user who uploaded the last revision
        :param raw_string: the string containing the username
        eg.:
        :return: username
        """
        username = re.findall(r"\((\S*)\)", raw_string)
        if not username:
            username = re.findall(r"(.*)\son", raw_string)

        username = username[0]
        return username

    @property
    def revision(self) -> str:
        return self.revision_info['Revision']

    def is_branch(self) -> bool:
        return True if self.revision.count(".") > 1 else False

    @property
    def sub_version(self) -> int:
        """Gets the sub version of a revision, adjusted for branches"""
        return self.get_sub_version(self.revision)

    @staticmethod
    def get_sub_version(version) -> int:
        return int(version.split(".")[-1])

    @staticmethod
    def is_same_branch(ref_ver, comp_ver) -> bool:
        """ Compares 2 versions of a file and concludes if they are both
        in the same branch
        :return True: if the file is in the same dev branch
        :return False: if not"""
        return True if \
            (
                    (ref_ver.count(".") == comp_ver.count("."))
                    and
                    ((ref_ver.split("."))[0:-1] == (comp_ver.split("."))[0:-1])
            ) else False

    def is_newer(self, compare_version) -> bool or None:
        """
        Compares 2 versions,
        :param compare_version: the version to be compared
        :type compare_version: str
        :return True: if the file is newer than the compared version
        :return False: if the file is older or the same version
        :return None: if there was an error (branch compared to mainline)
                changed to True: Branch should be also tested...
        """
        if self.is_same_branch(self.revision, compare_version):
            if self.sub_version > self.get_sub_version(compare_version):
                return True
            else:
                return False
        else:
            print('check: branch!')
            #return None
            return True


if __name__ == '__main__':
    member = SiMember(
        r"C:\Sandbox\Product_Group\SW\Development\BC\BC_Composition\BC_Modules\DiagV10\DiagV10_MXRAY_Report_final.json")
    rev = member.view_revision()
    i = 1
