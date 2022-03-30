import json
from pathlib import Path
from typing import List

from post_processing_stage.SiMemberTestOnly import SiMemberTestOnly
from post_processing_stage.ReportType import ReportType
from post_processing_stage.mxray_postprocessing.MxrayReportSubsystem import \
    MxrayReportSubsystem
from mks_api.si.SiMember import SiMember
from test_stage.MxrayArtifactPathGenerator import MxrayArtifactPathGenerator
from libs.common import win_make_writable
from global_config import TEST_ONLY

class MxrayReport(ReportType):
    """The report database is stored in this class, making the elements more
    acsessable"""

    def __init__(self, base: dict or Path, generate_flag=True):
        """
        :param base:
        :param generate_flag: Set to True when you are generating a new
        report set to False when you are only using the class for
        accessing the data in an existing
        report
        """
        if isinstance(base, dict):
            self.base = base
        elif isinstance(base, Path):
            self.base = self.get_base_from_file(base)

        self.path_generator = MxrayArtifactPathGenerator(self.modelpath)
        if not TEST_ONLY:
            self.si_member_model = SiMember(self.path_generator.model_path)
        else:
            self.si_member_model = SiMemberTestOnly()
        self.subsystems = self.order_subsystems()

        if generate_flag:
            self.inject_mks_data_into_report()

    def inject_mks_data_into_report(self):
        self.base['M-XRAY_Report']['SI_Model_Revision'] = \
            self.fetch_revision_version_from_model()
        self.base['M-XRAY_Report']['SI_Data_Dictionary_Revision'] = \
            self.fetch_data_dictionary_revision()


    @staticmethod
    def get_base_from_file(filepath):
        """Gets the base from a report file"""
        with open(filepath, "r") as file:
            return json.load(file)

    @property
    def data_dictionary_revision(self):
        return self.base['M-XRAY_Report']['SI_Data_Dictionary_Revision']

    @property
    def model_revision(self):
        try:
            return self.base['M-XRAY_Report']['SI_Model_Revision']
        except KeyError:
            return "0.0"

    @property
    def report_description(self):
        return f"MXRAY Report for Model: {self.model_revision} and " \
               f"DD: {self.data_dictionary_revision}."

    @property
    def modelpath(self):
        return self.base['M-XRAY_Report'][
            'SingleSystemResults'][
            'System'][
            'FullPathOfFile']

    def fetch_revision_version_from_model(self):
        """Extracts the revision version from the model"""
        return self.si_member_model.revision

    def fetch_data_dictionary_revision(self):
        if not TEST_ONLY:
            dd_si_member = SiMember(self.path_generator.path_module_data_dictionary)
            x=1
            return dd_si_member.revision

    def order_subsystems(self) -> List[MxrayReportSubsystem]:
        subsystem_list = list()

        subsystem_list_raw = self.base['M-XRAY_Report'][
            'SingleSystemResults'][
            'System'][
            'MainPart'][
            'System'][
            'Elements'][
            'Element']

        # when there is only one subsystem in the model mxray exports it not
        # as a list of one item but as the contents of that one item
        # this packs it into a list so that we can proceed as usual
        if not(isinstance(subsystem_list_raw, list)):
            subsystem_list_raw = [subsystem_list_raw]

        for subsystem in subsystem_list_raw:
            subsystem_list.append(MxrayReportSubsystem(subsystem))
        return subsystem_list

    def get_subsystem_by_simulink_path(self, path):
        """Gets a subsystem from the list by path"""
        retval = None
        if str(Path(path).parent.as_posix()) != ".":
            path = Path(path).parent.as_posix()

        for subsystem in self.subsystems:
            if subsystem.path == path:
                retval = subsystem
                break
        return retval

    def adjust_limits(self, limits):
        for limit in limits.values():
            subsystem = self.get_subsystem_by_simulink_path(
                limit['simulink_path'])
            if subsystem:
                subsystem.add_limit_and_offset(limit)
                pass

    def export_to_file(self, target_file):
        win_make_writable(target_file)
        with open(target_file, "w") as file:
            file.write(json.JSONEncoder().encode(self.base))