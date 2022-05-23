"""Syncs the sandboxes (or subsandboxes at the start) """
from mks_api.si.SiAdapter import SiAdapter
from global_config import INPUT_JSON_SYNC_DIFF
import json

from diagnostics.fsw_test_automation_logger import logger


class FSWTestAutomationSync:
    def __init__(self):
        self.si = SiAdapter()
        with open(INPUT_JSON_SYNC_DIFF, "r") as file:
            self.config_data = json.load(file)

    def sync_sandboxes(self):
        logger.info("Syncing Directories...")
        for path in self.config_data['sync']:
            logger.info("Updating directory: {}...".format(path))
            self.si.sync_files(path)
        logger.info("Syncing Done.")


if __name__ == '__main__':
    sync = FSWTestAutomationSync()
    sync.sync_sandboxes()
