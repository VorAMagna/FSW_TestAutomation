import json
import os
# noinspection PyUnresolvedReferences
import subprocess
from pathlib import Path
import warnings
# noinspection PyUnresolvedReferences
import abc

from libs.common import win_make_writable, figure_if_same_component
from test_stage.MxamMatlabProcess import MxamMatlabProcess
from post_processing_stage.PostProcessStageList import PostProcessStageList
from test_stage.MxrayMatlabProcess import MxrayMatlabProcess
from test_stage.setup_configuration_run import configure_mxam_run
from global_config import MODELS_TO_TEST_FILE, MXRAY_EXPORT_LIMITS_FILE, \
    MXAM_ACTIVE, MXRAY_ACTIVE, MXAM_EXPORT_POSTPROCESSING_FILE, \
    BATCH_SIZE_LIMIT, MAX_MXAM_TRIES, MAX_MXRAY_TRIES, \
    EXPORT_BATCH_CONFIG_TO_FILE

from diagnostics.fsw_test_automation_logger import logger

def remove_mxam_reports(batch_config):
    """Removes all mxam_reports in a batch config"""
    report_paths = MxamMatlabProcess.get_mxam_reports(batch_config)
    for report_path in report_paths:
        if Path(report_path).exists():
            _ = win_make_writable(report_path)
            os.remove(report_path)
        else:
            pass
            #warnings.warn('File: ' + str(report_path) + ' does not exist!')


def mxam_run_preprocessing(batch_config):
    """Executes a Mxam Run
    :param batch_config: the configuration for the mxam run
    :return: leftover values if left"""
    remove_mxam_reports(batch_config)


def import_models():
    """
    Imports the models which are to be checked
    from the file
    """
    with open(MODELS_TO_TEST_FILE, "r") as f:
        preconfig = json.load(f)
    return preconfig['modelpath']


def test_models():
    """MAIN FUNCTION
    Tests all the models through """

    models = import_models()
    config_batches = {}
    batch_count = 1

    mxray_exceptions = PostProcessStageList()
    mxam_post_processing = PostProcessStageList()

    # Making the config batches
    for model in models:
        if not config_batches:
            config_batches[batch_count] = [model]
            continue
        if (figure_if_same_component(config_batches[batch_count][-1], model) and
                batch_count <= BATCH_SIZE_LIMIT):
            (config_batches[batch_count]).append(model)
            continue
        else:
            batch_count += 1
            config_batches[batch_count] = [model]

    # work though the batches
    for config_batch_iter in config_batches:
        batch_config = configure_mxam_run(config_batches[config_batch_iter],
                                          EXPORT_BATCH_CONFIG_TO_FILE)

        if not batch_config['artifacts']:
            warnings.warn("A batch has come back empty... Skipping batch")
            continue
        try:
            mxam_run_preprocessing(batch_config)

            execution_tries = 0

            if MXAM_ACTIVE:
                logger.info("Mxam Starting up...")
                while True:
                    mxam_execution = MxamMatlabProcess(batch_config)
                    success, reports = mxam_execution.test_modules()
                    del mxam_execution
                    if success:
                        mxam_post_processing.append(batch_config)
                        logger.info("Mxam Tests Done.")
                        break
                    elif execution_tries < MAX_MXAM_TRIES:
                        execution_tries += 1
                    else:
                        logger.info(
                            "Maximal execution tries for MXAM have "
                            "been exceeded. Moving "
                            "on..")
                        break

            if MXRAY_ACTIVE:
                while True:
                    logger.info("Mxray Starting up...")
                    mxray_execution = MxrayMatlabProcess(batch_config)
                    success = mxray_execution.mxray_analyze_models()
                    mxray_execution.kill_matlab()
                    del mxray_execution
                    # add to the exceptions list (used for later for
                    # post processing
                    if success:
                        mxray_exceptions.append(batch_config)
                        logger.info("Mxray Tests done.")
                        break
                    elif execution_tries < MAX_MXRAY_TRIES:
                        execution_tries += 1
                    else:
                        logger.info("Maximal execution tries have been exceeded."
                              " Moving on..")
                        break
            logger.info("Batch, finished. Moving on...")

        finally:
            mxray_exceptions.export_to_file(MXRAY_EXPORT_LIMITS_FILE)
            mxam_post_processing.export_to_file(MXAM_EXPORT_POSTPROCESSING_FILE)

    logger.info("All batches have gone through. The Testing is finished...")


if __name__ == '__main__':
    test_models()
