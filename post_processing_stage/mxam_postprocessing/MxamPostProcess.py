import json
from pathlib import Path
from warnings import warn

import xmltodict

from global_config import MXAM_REPORT_XML, MXAM_EXPORT_POSTPROCESSING_FILE, \
    INPUT_JSON_SYNC_DIFF
from post_processing_stage.mxam_postprocessing.MxamExcelGenerator import \
    MxamExcelGenerator
from post_processing_stage.mxam_postprocessing.MxamReport import MxamReport
from test_stage.MxamArtifactPathGenerator import MxamArtifactPathGenerator

from diagnostics.fsw_test_automation_logger import logger

class MxamPostprocess:
    def __init__(self):
        self.mxam_reports = list()

    def execute(self):
        """Executes the processing"""
        if not MXAM_REPORT_XML[2]:
            logger.info("MXAM XML Reports are not activated! Cannot do the post"
                  "processing!")

        with open(INPUT_JSON_SYNC_DIFF, "r") as file:
            post_process_config = json.load(file)

        self.generate_mxam_report_databases(post_process_config)
        self.export_reports()

    def export_reports(self):
        """Exports the reports into their respective files"""
        for mxam_report in self.mxam_reports:
            mxam_report.export_to_json()
            excel_report = MxamExcelGenerator(mxam_report)
            excel_report.export_file()

    def generate_mxam_report_databases(self, post_process_config):
        """Generates all the mxray report databases"""
        for artifact in post_process_config['modelpath']:
            path_generator = MxamArtifactPathGenerator(artifact)

            xml_filepath = path_generator.path_report_xml

            if not xml_filepath.exists():
                warn(f"The xml Report @:{xml_filepath}" 
                     " does not exist, skipping.")
                continue
            self.mxam_reports.append(
                self.generate_mxam_report_database(xml_filepath))


    @staticmethod
    def generate_mxam_report_database(xml_filepath):
        """Generates an mxam report object"""
        with open(xml_filepath, "r") as file:
            mxam_report = \
                MxamReport(xmltodict.parse(file.read()))
        return mxam_report


if __name__ == '__main__':
    mxam_post = MxamPostprocess()
    mxam_post.execute()
