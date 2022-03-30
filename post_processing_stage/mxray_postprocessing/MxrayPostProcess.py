import json

import xmltodict

from commit_stage.CommitTracker import CommitTracker
from global_config import MXRAY_LIMITS_RESULT_FILE, MATLAB_EVAL_FILE, \
    MXRAY_EXPORT_LIMITS_FILE
from matlab_layer.FswAutomationMatlabProcess import FswAutomationMatlabProcess
from post_processing_stage.mxray_postprocessing.MxrayReport import \
    MxrayReport
from post_processing_stage.mxray_postprocessing.MxrayExcelGenerator import \
    MxrayExcelGenerator

from matlab_layer.EvalConstructor import EvalConstructor

from diagnostics.fsw_test_automation_logger import logger

MXRAY_POSTPROCESSING_SCRIPT = "PostProcessing_MXRAY"


class MxrayPostProcess(FswAutomationMatlabProcess):
    """Does the needed postprocessing of the mxray reports!"""
    def __init__(self):
        super().__init__(MXRAY_POSTPROCESSING_SCRIPT)
        self.mxray_database = {}

    def get_limits_from_models(self):
        logger.info("Getting limits from models...")
        self.setup_matlab_evals()
        self.start_matlab_process()
        self.matlab_wait_for_console_output("done")
        self.kill_matlab()

    @staticmethod
    def setup_matlab_evals():
        """Injects the variables we need matlab to know in order
        to execute the mxam run"""
        eval = EvalConstructor()
        eval.define_variables(
            MODELS_TO_EXCEPT_FILEPATH=MXRAY_EXPORT_LIMITS_FILE)
        eval.eval_script(MXRAY_POSTPROCESSING_SCRIPT)

        eval.export_to_file(MATLAB_EVAL_FILE)

    def apply_exceptions_to_reports(self):
        """Reads the results and config files, then applies the limit exceptions
        set by the developers"""
        with open(MXRAY_LIMITS_RESULT_FILE, "r") as file:
            limits_result = json.load(file)

        for batch_iter in limits_result.values():
            for artifact_iter in batch_iter['artifacts'].values():
                xml_report_name = artifact_iter['report_filepath_mxray_xml']

                # adds limits to report database
                report_with_limits = self.apply_limit_exceptions_to_report(
                    artifact_iter['limits'], xml_report_name)

                # exports limits to json file
                logger.info("Exporting json Report: {}".format(
                    artifact_iter['report_filepath_mxray_post_json']))
                report_with_limits.export_to_file(
                    artifact_iter['report_filepath_mxray_post_json'])
                commits = CommitTracker.get_instance()
                commits.add_file_to_commit(
                    artifact_iter['report_filepath_mxray_post_json'])

                # creates and exports excel report
                excel_report_instance = MxrayExcelGenerator(report_with_limits)

                logger.info("Exporting XLSX Report: {}".format(
                    artifact_iter['report_filepath_mxray_post_xlsx']))
                excel_report_instance.generate_xlsx(
                    artifact_iter['report_filepath_mxray_post_xlsx'])
                commits.add_file_to_commit(
                    artifact_iter['report_filepath_mxray_post_xlsx'])

    @staticmethod
    def apply_limit_exceptions_to_report(limits, xml_report_path):
        """Loads mxray xml report and applies the limits given to it
        :param limits: the dictionary containing the limits
        :param xml_report_path: the path of the xml report"""
        with open(xml_report_path, "r") as file:
            mxray_database = \
                MxrayReport(xmltodict.parse(file.read()))
        mxray_database.adjust_limits(limits)
        return mxray_database


def get_mxray_ud_limits():
    execution = MxrayPostProcess()

    # Getting Limits from the Models
    execution.get_limits_from_models()

    # Applying Limits to the Models:
    execution.apply_exceptions_to_reports()

if __name__ == '__main__':
    get_mxray_ud_limits()