"""Tracks which files are to be commited"""
import json
from pathlib import Path
from test_stage.MxamArtifactPathGenerator import MxamArtifactPathGenerator
from test_stage.MxrayArtifactPathGenerator import MxrayArtifactPathGenerator
from mks_api.si.SiMember import SiMember
from mks_api.si.SiChangePackage import SiChangePackage
from mks_api.si.SiAdapter import SiAdapter
from global_config import SI_ISSUE_ID, SI_CHANGE_PACKAGE_DESCRIPTION

from diagnostics.fsw_test_automation_logger import logger


class CommitTracker:
    """Singleton class type, needs to be initialized with the get_instance
    methdod, because the excel styles can only be constructed once!"""
    __instance__ = None

    def __init__(self):
        self.commits = []
        self.change_package = None
        self.mks_api = SiAdapter()
        if CommitTracker.__instance__ is None:
            CommitTracker.__instance__ = self
        else:
            raise Exception("You cannot create another SingletonGovt class")

    def set_change_package(self, cp: SiChangePackage):
        self.change_package = cp

    def manage_change_packages(self):
        change_packages = self.mks_api.get_user_change_packages(
            self.mks_api.get_mks_user_name())
        wanted_change_packages = [change_package
                                  for change_package in change_packages
                                  if change_package.full_id.startswith(
                                                            SI_ISSUE_ID)]
        if not wanted_change_packages:
            _, cp = self.mks_api.create_change_package(
                SI_ISSUE_ID,
                description=SI_CHANGE_PACKAGE_DESCRIPTION)[1]
            wanted_change_packages.append(cp)

        self.change_package = wanted_change_packages.pop()

        for change_package in wanted_change_packages:
            logger.info(f"MKS: Closing Redundant Change Pachage: "
                  f"{change_package.full_id}")
            change_package.close()

        logger.info(f"MKS :Using Change Package: {self.change_package.full_id}"
              " for analysis")

    def add_module_to_commit(self, report_type, module_path):
        """
        Adds a module to commit. And figures out which reports to add to the
        commit list automatically
        :param module_path: path of the module for which the reports
        were generated
        :param report_type: MXAM or MXRAY
        :return:
        """
        if report_type == "MXAM":
            filepath_generator = MxamArtifactPathGenerator(module_path)
        elif report_type == "MXRAY":
            filepath_generator = MxrayArtifactPathGenerator(module_path)

    def figure_out_reports(
            self, filepath_generator: MxrayArtifactPathGenerator) -> list:
        return [filepath_generator.path_report_post_xlsx,
                filepath_generator.path_report_post_json]

    def add_file_to_commit(self, filepath: Path or str or list):
        """
        Will add a file to the list of files to be uploaded
        :param filepath: abs path of file
        """
        if isinstance(filepath, (str, Path)):
            self.commits.append(filepath)
        elif isinstance(filepath, list):
            self.commits += filepath
        else:
            raise TypeError

    def export_commits(self, filepath):
        """
        Exports to commits to a file
        :param filepath:
        :return:
        """
        str_commits = [str(commit) for commit in self.commits]
        export_dict = {
            "commits": str_commits
        }
        with open(filepath, 'w') as file:
            json.dump(export_dict, file)

    def push_commits(self):
        """
        Will push the commits on the MKS SI server
        :return:
        """
        if not self.change_package:
            Exception("Change Package is not SET!")

        for commit_file in self.commits:
            try:
                si_member_file = SiMember(str(commit_file))
                si_member_file.lock_in(self.change_package)

            except:
                pass

    @staticmethod
    def get_instance():
        """ Static method to fetch the current instance.
       """
        if not CommitTracker.__instance__:
            CommitTracker()
        return CommitTracker.__instance__


if __name__ == '__main__':
    commits = CommitTracker.get_instance()
    commits.manage_change_packages()
    commits.add_module_to_commit(
        Path(r"C:\Sandbox\Product_Group\SW\Development\DC\DC_Composition\DC_Modules\DiagD10\DiagD10.mdl"))
    commits.push_commits()
