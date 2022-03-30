from global_config import \
    INPUT_JSON_SYNC_DIFF, DIFF_STAGE_OVERRIDE, COMMIT_STAGE_OVERRIDE
import json

default_debug_flags = {
    "override_diff": False,
    "override_commit": False
}


class RunConfig:
    """
    Holds relevant information on a current run
    """
    def __init__(self):
        self.debug_flags = {}
        with open(INPUT_JSON_SYNC_DIFF, "r") as file:
            self.run_config = json.load(file)
        if not ("debug_flags" in self.run_config):
            self.debug_flags = default_debug_flags
        else:
            self.debug_flags = self.run_config['debug_flags']

        self._override_diff = self.debug_flags['override_diff']
        self._override_commit = self.debug_flags['override_commit']


    @property
    def override_diff(self):
        return self._override_diff or DIFF_STAGE_OVERRIDE

    @property
    def override_commit(self):
        return self._override_commit or COMMIT_STAGE_OVERRIDE




