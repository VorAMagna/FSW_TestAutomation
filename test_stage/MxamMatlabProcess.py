from pathlib import Path
from time import sleep

from matlab_layer.FswAutomationMatlabProcess import MXAM_TIMEOUT_SECS
from matlab_layer.FswAutomationMatlabReportOverseer import FswAutomationMatlabReportOverseer
from libs.ProcessKiller import kill_all_by_name
from global_config import MATLAB_SCRIPT_MXAM, MATLAB_EVAL_FILE, \
    BATCH_CONFIGURATION_FILE
from matlab_layer.EvalConstructor import EvalConstructor

from diagnostics.fsw_test_automation_logger import logger


class MxamMatlabProcess(FswAutomationMatlabReportOverseer):
    """
    Regulates the Matlab process
    """

    def __init__(self, batch_config, reports=None):
        super().__init__(batch_config, 'report_filepath_mxam_xlsx')
        if reports is None:
            reports = []
        self.kill_mxam()
        self.success = False
        self._timeout = MXAM_TIMEOUT_SECS
        self.reports = reports
        # will get set when the matlab process starts

    def __del__(self):
        super().__del__()
        self.kill_mxam()

    def watch_for_reports(self, reports):
        """ Looks out for the reports """

        # Wait for reports
        while True:
            for report in reports:
                # if a report is created
                if Path(report).exists():
                    # remove the report from the waiting list
                    reports.remove(report)
                    logger.info(f"MXAM Report  {report}, is done. "
                                f"{len(reports)} more to go.")
                    self.restart_timeout()

            # stop if all reports are done
            if not reports:
                logger.info("All reports in the batch are finished. Closing Matlab")
                success = True
                break

            # stop if the process takes too long
            if self._timeout_running > self._timeout:
                logger.info("Matlab has Timed out! Restarting")
                success = False
                sleep(1)
                break

            sleep(1)
            self._timeout_running += 1
        sleep(40)
        return success, reports

    def test_modules(self):
        """Tests the assigned mxam models through
         through the assigned modules"""

        self.restart_timeout()
        self.setup_matlab_evals()
        self.start_matlab_process()

        if not self.reports:
            self.reports = self.get_report_paths(self.batch_config,
                                                 self.config_path_name)

        success, self.reports = self.watch_for_reports(self.reports)
        return success, self.reports

    @staticmethod
    def setup_matlab_evals():
        """Injects the variables we need matlab to know in order
        to execute the mxam run"""
        eval = EvalConstructor()
        eval.define_variables(
            MXAM_MXRAY_BATCHCONFIG_FILEPATH=BATCH_CONFIGURATION_FILE)
        eval.eval_script(MATLAB_SCRIPT_MXAM)

        eval.export_to_file(MATLAB_EVAL_FILE)

    @staticmethod
    def get_mxam_reports(batch_config):
        return FswAutomationMatlabReportOverseer.get_report_paths(batch_config,
                                                      'report_filepath_mxam_xlsx')

    @staticmethod
    def kill_mxam():
        """Finds and kills the mxam process"""
        kill_all_by_name("MXAM")
