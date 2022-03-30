import json
from post_processing_stage.SiMemberTestOnly import SiMemberTestOnly
from pathlib import Path

from commit_stage.CommitTracker import CommitTracker
from post_processing_stage.ReportType import ReportType
from post_processing_stage.mxam_postprocessing.MxamReportGuidelines import \
    MxamReportGuidelines
from mks_api.si.SiMember import SiMember
from test_stage.MxamArtifactPathGenerator import MxamArtifactPathGenerator
from libs.common import win_make_writable

from diagnostics.fsw_test_automation_logger import logger
from post_processing_stage.ReportType import ReportType
from global_config import TEST_ONLY

class MxamReport(ReportType):
    """Representing the mxam report and all of its components"""
    def __init__(self, base: dict or Path, generate_flag=True):
        """
        :param base: Raw report data
        :param generate_flag: Set to True when you are generating a new
        report set to False when you are only using the class for
        accessing the data in an existing
        report
        """
        if isinstance(base, dict):
            self.base = base
        elif isinstance(base, Path):
            self.base = self.get_base_from_file(base)

        self.path_generator = \
            MxamArtifactPathGenerator(self.base['response']
                                      ['report']
                                      ['artifacts']
                                      ['artifact']
                                      ['location'])
        self.model_extension = self.path_generator.model_path.upper().split('.')[-1]

        if not TEST_ONLY:
            self.si_member_model = SiMember(self.path_generator.model_path)
        else:
            self.si_member_model = SiMemberTestOnly()
        self.report_guidelines = self.get_report_guidelines()
        if generate_flag:
            self.inject_mks_data_into_report()


    def inject_mks_data_into_report(self):
        """Adds the revision info into the report"""
        #if not TEST_ONLY:
        self.base['response']['report']['SI_Model_Revision'] = \
            self.si_member_model.revision
        self.base['response']['report']['SI_Data_Dictionary_Revision'] = \
            self.fetch_data_dictionary_revision()
        self.base['response']['report']['SI_Modified_By'] = \
            self.si_member_model.get_win_username()

    @property
    def name(self):
        return self.path_generator.model_name

    @staticmethod
    def get_base_from_file(filepath):
        """Gets the base from a report file"""
        with open(filepath, "r") as file:
            return json.load(file)

    @property
    def report_description(self):
        return f"MXAM Report for {self.model_extension}-Model: {self.model_revision} and " \
               f"DD: {self.data_dictionary_revision}."

    @property
    def model_revision(self):
        return self.base['response']['report']['SI_Model_Revision']

    @property
    def last_modified_by(self):
        return self.base['response']['report']['SI_Modified_By']

    @property
    def data_dictionary_revision(self):
        x=1
        return self.base['response']['report']['SI_Data_Dictionary_Revision']

    @property
    def report_timestamp(self):
        return self.base['response']['report']['@date']

    def fetch_data_dictionary_revision(self):
        """Extracts the data dictionary revision based on the original
        model path"""
        if not TEST_ONLY:
            si_member = SiMember(self.path_generator.path_module_data_dictionary)

        else:
            si_member = SiMemberTestOnly()

        return si_member.revision

    def fetch_timestamp(self):
        """Gets the last modified timestamp of the model"""
        pass

    def fetch_user(self):
        return self.si_member_model.get_win_username()

    def get_report_guidelines(self):
        """Extracts the guidelines from the raw data"""
        try:
            raw_guidelines = self.base[
                'response']['report']['document']['chapter']['guideline']
            print(raw_guidelines)
            return \
                [MxamReportGuidelines(raw_guideline) for raw_guideline
                 in raw_guidelines]
        except Exception:
            #print('raw_guidelines...')
            raw_guidelines = self.base[
                'response']['report']['document'][1]['chapter']['guideline']
            #print(raw_guidelines)
            return \
                [MxamReportGuidelines(raw_guideline) for raw_guideline
                 in raw_guidelines]


    def export_to_json(self):
        """Exports the file to the json (path defined from setup config)"""
        #
        logger.info(
            f'Exporting MXAM json report '
            f'{self.path_generator.path_report_post_json}')
        win_make_writable(self.path_generator.path_report_post_json)
        with open(self.path_generator.path_report_post_json, "w")\
                as file:
            file.write(json.JSONEncoder().encode(self.base))
            commits = CommitTracker.get_instance()
            commits.add_file_to_commit(
                self.path_generator.path_report_post_json)

