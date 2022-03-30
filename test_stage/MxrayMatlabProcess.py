import copy
import os
import subprocess
from retrying import retry
from pathlib import Path
from time import sleep


from libs.common import suppress_stderr, suppress_stdout
from global_config import MXRAY_REPORT_HTML, MXRAY_REPORT_XML, \
    MXRAY_REPORT_EXCEL, MATLAB_SCRIPT_MXRAY, MXRAY_INIT_REPORT_FILE_PREFIX, \
    MATLAB_EVAL_FILE, BATCH_CONFIGURATION_FILE
from libs.common import winfind, win_make_writable
from matlab_layer.FswAutomationMatlabReportOverseer import FswAutomationMatlabReportOverseer
from matlab_layer.EvalConstructor import EvalConstructor

from diagnostics.fsw_test_automation_logger import logger


class MxrayMatlabProcess(FswAutomationMatlabReportOverseer):
    """
    Regulates a mxray process
    """

    def __init__(self, batch_config):
        super(MxrayMatlabProcess, self).__init__(copy.deepcopy(batch_config),
                                                 'report_filepath_mxray')
        self.all_reports_dirs = list()

    def __del__(self):
        super().__del__()

    def mxray_analyze_models(self) -> bool:
        """Executes the mxray analysis (alongside with the matlab
        overseeing)"""
        for batch_config_iter in self.batch_config['artifacts'].values():
            self.all_reports_dirs.append(batch_config_iter['result_dir'])

        self.mxray_cleanup()

        self.restart_timeout()
        self.setup_matlab_evals()
        self.start_matlab_process()
        return self.mxray_watch_reports()

    def mxray_cleanup(self, report_dir=None):
        """Removes the excess mxray files generated during the testing,
        :param report_dir: optional param, when not set all dirs will be looped
        and the reports deleted respectfully """
        if report_dir is None:
            everything_flag = True
        else:
            everything_flag = False

        if everything_flag:
            for all_report_dir in self.all_reports_dirs:
                # os.system is used because of multiple file deletion
                try:
                    # TODO Figure out a way to suppress this shit
                    with suppress_stdout():
                        _ = subprocess.check_output(
                            "im " + all_report_dir + os.path.sep +
                            MXRAY_INIT_REPORT_FILE_PREFIX + "*")
                except OSError:
                    pass
                except subprocess.CalledProcessError:
                    pass
        else:
            try:
                os.system("im " + report_dir + os.path.sep +
                          MXRAY_INIT_REPORT_FILE_PREFIX + "*")
            except OSError:
                pass

    @staticmethod
    def setup_matlab_evals():
        """Injects the variables we need matlab to know in order
        to execute the mxam run"""
        eval_instance = EvalConstructor()
        eval_instance.define_variables(
            MXAM_MXRAY_BATCHCONFIG_FILEPATH=BATCH_CONFIGURATION_FILE)
        eval_instance.eval_script(MATLAB_SCRIPT_MXRAY)

        eval_instance.export_to_file(MATLAB_EVAL_FILE)

    @staticmethod
    @retry(stop_max_attempt_number=20, wait_fixed=2000)
    def mxray_rename(batch_config_iter_val):
        """Renames the mxray reports to our wanted name
        :param batch_config_iter_val: the directory of the reports"""
        for report_type in [MXRAY_REPORT_HTML, MXRAY_REPORT_XML,
                            MXRAY_REPORT_EXCEL]:
            # if the report_type is active
            if report_type[2]:
                # find the files of that type to be renamed
                found_files = winfind(batch_config_iter_val['result_dir'],
                                      [(MXRAY_INIT_REPORT_FILE_PREFIX
                                        + "*" + report_type[1])])
                # rename each file
                for found_file in found_files:
                    os.replace(
                        found_file,
                        Path.joinpath(Path(found_file).parent,
                                      (batch_config_iter_val[
                                          'report_filename_mxray'])
                                      + report_type[1]))

    @staticmethod
    def mxray_remove_old_reports(batch_config_iter_val):
        """Gets rid of the old mxray reports, so that the new ones
        can be put in place
        :param batch_config_iter_val: the values
        from the artifacts (batch_config)"""
        for report_type in [MXRAY_REPORT_HTML, MXRAY_REPORT_XML,
                            MXRAY_REPORT_EXCEL]:
            if report_type[2]:
                found_files = \
                    winfind(batch_config_iter_val['result_dir'],
                            [batch_config_iter_val['report_filename_mxray']
                             + report_type[1]])
                for found_file in found_files:
                    win_make_writable(found_file)
                    os.remove(found_file)

    def mxray_watch_reports(self) -> bool:
        """Looks for mxray reports"""
        while True:
            # if there are no more models to be searched for, stop the
            # searching
            if not self.batch_config['artifacts']:
                break

            find_results = {}
            batch_config_iter_value_out = {}
            batch_config_iter_out = {}
            # search for the reports we're waiting for
            for batch_config_iter in self.batch_config['artifacts']:

                batch_config_iter_value = self.batch_config['artifacts'][
                    batch_config_iter]

                all_report_dir = batch_config_iter_value['result_dir']

                find_results = winfind(
                    Path(all_report_dir),
                    [MXRAY_INIT_REPORT_FILE_PREFIX + "*"])

                # assigns values to non local values for further processing
                # in case results are found and breaks the search for
                # further processing and waits for the other reports to be
                # written
                if find_results:
                    batch_config_iter_value_out = batch_config_iter_value
                    batch_config_iter_out = batch_config_iter

                    # WAITING FOR OTHER REPORTS START
                    for report_type in [MXRAY_REPORT_EXCEL,
                                        MXRAY_REPORT_XML,
                                        MXRAY_REPORT_HTML]:

                        if report_type[2]:
                            # waits for the individual report to be
                            # generated
                            while not winfind(
                                    batch_config_iter_value[
                                        'result_dir'],
                                    [MXRAY_INIT_REPORT_FILE_PREFIX
                                     + "*" +
                                     report_type[1]]):
                                sleep(0.5)
                    # WAITING FOR OTHER REPORTS END
                    break

            # if a model is found, hence generated
            if find_results:
                self.mxray_remove_old_reports(batch_config_iter_value_out)
                self.mxray_rename(batch_config_iter_value_out)
                self.mxray_cleanup(batch_config_iter_value_out['result_dir'])

                logger.info(
                    f"Mxray Report "
                    f"{batch_config_iter_value_out['report_filepath_mxray_xml']}"
                    f" is done."
                    f"{len(self.batch_config['artifacts'])} to go.")
                # removes the file from the 'stack'
                self.batch_config['artifacts'].pop(batch_config_iter_out)
        self.matlab_wait_for_console_output("done")

        return True
