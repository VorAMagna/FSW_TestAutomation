import json

import global_config
from global_config import INPUT_GLOBAL_ROUTINE, INPUT_JSON_SYNC_DIFF

from diagnostics.fsw_test_automation_logger import logger

from mks_api.si.SiAdapter import SiAdapter
ROUTINE_RUN_PREFIX = "ROUTINE__"


class PrepRunStage:
    """Prepares the config files for the current and for future runs"""
    def __init__(self):
        with open(INPUT_GLOBAL_ROUTINE, "r") as file:
            self.global_runs_list = json.load(file)

        if not self.global_runs_list:
            # TODO throw error
            pass

        self.run_max = len(self.global_runs_list)
        self.run_index = 0
        self.run_list = self.global_runs_list

    @property
    def current_run(self):
        return self.global_runs_list[0]

    @property
    def current_matlab_version(self):
        return self.current_run['matlab_version']

    def prep_current_run(self):
        """Prepares the run about to happen"""
        current_run = self.current_run
        logger.info("Preparing next run: {}".format(current_run['name']))
        logger.info("Searching for project: {} on server: {}".format(current_run['name'], global_config.CURRENT_SERVER))
        SiAdapter().set_server_for_project(current_run)
        logger.info("Switching to server: {}".format(global_config.CURRENT_SERVER))
        with open(INPUT_JSON_SYNC_DIFF, 'w') as current_run_file:
            json.dump(current_run, current_run_file)

    def wrap_up_run(self):
        """Takes the run out of the run que, since its done"""
        current_finished_run = self.global_runs_list[0]
        logger.info("Wrapping up run: {}".format(current_finished_run['name']))

        self.run_index += 1
        self.update_glob_config()
        self.update_glob_file()

    def update_glob_config(self):
        """Updates the glob file"""
        if self.global_runs_list[0]['name'].startswith(ROUTINE_RUN_PREFIX):
            self.global_runs_list\
                .append(self.global_runs_list.pop(0))
        else:
            self.global_runs_list.pop(0)

    def update_glob_file(self):
        """Updates the glob file with the model config"""
        with open(INPUT_GLOBAL_ROUTINE, "w") as file:
            json.dump(self.global_runs_list, file)

    @property
    def do_next(self):
        """Determines if more runs are to be done"""
        return False if self.run_index >= self.run_max else True


if __name__ == '__main__':
    prep_stage = PrepRunStage()
    prep_stage.prep_current_run()
    prep_stage.wrap_up_run()



