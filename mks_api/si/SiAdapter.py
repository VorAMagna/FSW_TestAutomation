import re
import matlab.engine
import global_config

from pathlib import Path
from typing import List

from mks_api.etc.MksStructParse import MksStructParse
from mks_api.etc.mks_api_tools import dir_jump_back_and_forth, get_args, joinpath
from mks_api.si.SiAdapterBase import SiAdapterBase
from mks_api.si.SiChangePackage import SiChangePackage
from mks_api.etc.exceptions.ChangePackageInvalidException import \
    ChangePackageInvalidException


class SiAdapter(SiAdapterBase):
    """Builds upon the base class with more abstract functions"""

    def revision_info(self, filepath: str or Path) -> dict:
        """
        gets the revision of the file and returns a python friendly dict
        :param filepath: path of the file in question
        :return: revision
        """
        filepath_cmd = f'"{filepath}"'
        # command = "si rlog --noheaderformat --fields=workingrev " + filepath
        # command = 'cmd /c "' + command + '"'
        # revision = os.system(command)
        try:
            if global_config.SYNC_STAGE_ACTIVE == False and global_config.MEMBER_REVISION_OVERRIDE == False:
                """
                If a checkpoint is tested it could happen that working revision differs from member revision. 
                In that case working revision version data are needed for the report
                The only known solution to get the working revision data is trough matlab engine (using 
                getWorkingRevision.m script). Better solution would be access with mks api without matlab engine 
                but it asks for project path somehow (??).
                """
                print("Starting Matlab engine for working revision check...")
                eng = matlab.engine.start_matlab()  # ("-desktop") to debug
                print("Matlab engine started")
                path = global_config.FSW_TOOLS_PATH + r"\FSW_TestAutomation\mks_api\si"  # specify your path
                eng.addpath(path, nargout=0)
                revision = eng.getWorkingRevision(filepath)
                print(filepath + " revision: " + revision.get('version'))
                if revision.get('delta') == 0 or revision.get('status') == 'invalid':
                    command = "revisioninfo"
                else:
                    command = "revisioninfo --revision=" + revision.get('version') + " "
            else:
                command = "revisioninfo"
        except:
            command = "revisioninfo"
            print('Warning: Check working revision version!!!')
        finally:
            revision_info = MksStructParse.mks_dict_parse(self.cmd(command, filepath_cmd))
            #  print(' ')
        return revision_info

    def view_revision(self, filepath: str or Path, **kwargs) -> dict:
        """
        Gets the daw data of the revision
        :param filepath: path of the file in question
        :return: revision
        """
        raw_revision = self.cmd("viewrevision", f"{get_args(**kwargs)} "
                                                f"{filepath} ")
        return raw_revision.replace("Activating view ... ", "").strip()

    def drop(self, member_path: Path, change_package: SiChangePackage, **kwargs) -> str:
        return self._raw_drop(str(member_path), change_package.full_id, **kwargs)

    @dir_jump_back_and_forth
    def sync_files(self, path: Path):
        """Syncs the files given in the directory
         :param path: the path to be synced"""
        sandbox = str(joinpath(path, "project.pj"))

        sync_arguments = get_args("overwriteChanged", "yes",
                                  sandbox=sandbox)

        return self.cmd("resync", sync_arguments)

    def check_in(self, file, description, change_package: SiChangePackage,
                 **kwargs) -> Path:
        """
        checks the file in
        :param change_package:
        :param file: filepath
        :param description: revision description
        :param change_package_id: the change package id used to check
        the file in
        :return: success:
        """
        if global_config.COMMIT_CHKIN:
            raw_return_string = self._raw_check_in(file, change_package.full_id,
                                                   description=description, **kwargs)
        else:
            raw_return_string = ''

        return_file_path = re.findall(
            r"Checking in member\.*\s*(\S.*)", raw_return_string)[0]

        return Path(return_file_path)

    def create_change_package(self, issueid, **kwargs) -> bool and str:
        """
        Creates a change package
        :param issueid:
        :type issueid: str
        :param kwargs: description={str} , summary={str}
        :return:
        """
        raw_return = self.cmd("createcp", get_args(
            issueId=issueid, **kwargs))

        found_cp_id = re.findall(r"\d*:\d*", raw_return)[0]

        return self.get_change_package(found_cp_id)

    def add(self, filepath: Path, change_package: SiChangePackage, **kwargs) -> Path:
        """
        Adds a file to the Si Server
        :param filepath: path of file
        :param change_package: change package to be attached
        :param kwargs: aditional arguments
        :return:
        """

        raw_response_str = self._raw_add(
            str(filepath),
            change_package.full_id,
            **kwargs)

        return Path(filepath)

    def get_change_package(self, full_id) -> SiChangePackage:
        """gets a change package

        Raises ChangePackageInvalidException if the change package
        does not exist.

        :param full_id: the full id eg. 1234:1234
        :type full_id: str
        :return: SiChangePackage object"""

        raw_return = self._raw_get_change_package(full_id)

        if "not a valid change package" in raw_return:
            raise ChangePackageInvalidException(
                f"The Change package {full_id} does not exist!")

        return SiChangePackage(raw_return)

    def get_user_change_packages(self, mks_username, issueid=None) -> List[SiChangePackage]:
        """
        Gets the user packages of a user
        :param mks_username:
        :param issueid: when defined gets the mks packages of
        :return:
        """
        si_arguments = get_args(
            filter=["state:open", "user:{}".format(mks_username)])

        if issueid:
            si_arguments += get_args(
                filter="issueId:{}".format(issueid))

        raw_return = self.cmd("viewcps", si_arguments)
        change_package_ids = re.findall(r"(\d*:\d*)\t", raw_return)

        change_packages = [self.get_change_package(change_package_id)
                           for change_package_id in change_package_ids]

        return change_packages

    def lock_in(self, filepath: Path, change_package: SiChangePackage, **kwargs):
        """Locks a file in
        :param filepath: path of the file
        :param change_package: to be applied"""
        return self._raw_lock_in(str(filepath), change_package.full_id,
                                 lockType="exclusive", **kwargs)

    def lock_remove(self, filepath: Path, **kwargs):
        """
        Unlocks a file
        :param filepath: path of the file
        :param change_package: to be applied
        """
        return self._raw_lock_remove(str(filepath), **kwargs)


if __name__ == '__main__':
    lannach = SiAdapter(servername="MPT_Lannach")
    st_val = SiAdapter(servername="MPT_StValentin")
    lannach.sync_files(r"C:\Sandbox\Product_Group\SW\Development\CC\CC_Composition\CC_Modules\AngTubeC10")
    # st_val.sync_files(r"C:\Sandbox\Projects\INT_018_Product_Platform_EDrive\SW\STD\Development\ED\FSW_units")