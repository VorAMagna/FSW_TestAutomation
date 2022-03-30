import os
import re
import time
from pathlib import Path
from time import sleep

import psutil

from global_config import MATLAB_LOG_FILE_NAME, MATLAB_START_PATH, MXAM_TIMEOUT_SECS
from mks_api.etc.mks_api_tools import dir_jump_back_and_forth
from matlab_layer.MatlabVersionHandler import MatlabVersionHandler

from diagnostics.fsw_test_automation_logger import logger

# MXAM_TIMEOUT_SECS = 5400  ... migrated to global_config.py
MATLAB_DEBUG_MODE = False
MATLAB_NORMAL_MODE_ARGUMENTS = '-nodesktop -nosplash -nodisplay -logfile '
MATLAB_DEBUG_MODE_ARGUMENTS = '-nosplash -logfile '


class FswAutomationMatlabProcess:
    """Controls and oversees a matlab process"""
    def __init__(self, matlab_execute_statement="",
                 start_in_specific_path=False, start_path=None):
        matlab_version_handler = MatlabVersionHandler.get_instance()
        self.matlab_path = matlab_version_handler.matlab_path
        self.start_in_specific_path = start_in_specific_path
        self.start_path = start_path
        self.matlab_execute_statement = matlab_execute_statement
        self.matlab_pid = 0
        self.log_file = self.generate_matlab_log_file()
        self._timeout = MXAM_TIMEOUT_SECS

    @staticmethod
    def generate_matlab_log_file() -> str:
        """
        Generates a matlab log file name
        used only once per matlab process, because the name is bound
        to a timestamp
        """
        return MATLAB_LOG_FILE_NAME + str(time.time()) + "_.txt"

    def matlab_wait_for_console_output(self, output, regex=False):
        """Waits for a specific matlab log output (can be defined with regex)
        :param output: specific string that should appear in the log file
        or a regex string
        :param regex: bool, wether regex should be used"""
        while True:
            if Path(self.log_file).exists():
                with open(self.log_file, "r") as file:
                    log_str = file.read()
                if regex:
                    res = re.findall(output, log_str)
                    if res:
                        res = res[0]
                        break
                    else:
                        pass
                else:
                    if log_str.find(output) != -1:
                        res = output
                        break

                sleep(2)
        # TODO Make timeout regulation
        return res[0]

    def get_matlab_arguments(self) -> str:
        """
        Fetches the matlab arguments for the given matlab process
        """
        if MATLAB_DEBUG_MODE:
            matlab_arguments = MATLAB_DEBUG_MODE_ARGUMENTS + \
                               self.log_file
        else:
            matlab_arguments = MATLAB_NORMAL_MODE_ARGUMENTS + \
                               self.log_file
        return matlab_arguments

    def restart_timeout(self):
        """
        Restarts the timeout timer
        """
        # noinspection PyAttributeOutsideInit
        self._timeout_running = 0

    def kill_matlab(self):
        """
        Kills the matlab process
        """
        try:
            psutil.Process(self.matlab_pid).kill()
        except psutil.AccessDenied:
            logger.info("Could not kill matlab! PID={}".format(self.matlab_pid))
        finally:
            pass

    def gather_matlab_pid(self) -> int:
        """Gets the PID of the Matlab process"""
        while True:
            if Path(self.log_file).exists():
                with open(self.log_file, "r") as file:
                    log_str = file.read()
                res = re.findall(r'(?<=PID=)\d*', log_str)
                if res:
                    break
                else:
                    pass
                sleep(2)
        # TODO Make timeout regulation
        return int(res[0])

    def start_matlab_process(self):
        """Starts the matlab process"""
        if self.start_in_specific_path:
            self.run_matlab(self.start_path)
        else:
            self.run_matlab(MATLAB_START_PATH)
        self.matlab_pid = self.gather_matlab_pid()

    @dir_jump_back_and_forth
    def run_matlab(self, start_path):
        """Runns matlab"""
        cmd = "{} {}".format(self.matlab_path, self.get_matlab_arguments())
        if self.matlab_execute_statement:
            cmd += " -r {}".format(self.matlab_execute_statement)

        os.system(cmd)






