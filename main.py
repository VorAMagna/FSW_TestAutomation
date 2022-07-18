"""
MAIN Script
Executes a complete run-through of all modules to be checked
"""
import sys

from diff_stage.DiffStageException import DiffStageException

from post_processing_stage.mxam_postprocessing.PostProcessExceptionMxam\
    import PostProcessExceptionMxam
from post_processing_stage.mxray_postprocessing.PostProcessExceptionMxray\
    import PostProcessExceptionMxray
from test_stage.TestStageException import TestStageException

from sync_stage.SyncStageException import SyncStageException



from prep_run_stage.PrepRunStage import PrepRunStage
from sync_stage.sync_sandboxes import FSWTestAutomationSync as SyncStage
from diff_stage.DiffStage import DiffStage
from test_stage.mxam_mxray_exec_main import test_models as test_stage
from post_processing_stage.mxray_postprocessing.MxrayPostProcess import \
    get_mxray_ud_limits as mxray_postprocess_stage
from matlab_layer.MatlabVersionHandler import MatlabVersionHandler, SIMULINK_MAP
from post_processing_stage.mxam_postprocessing.MxamPostProcess import \
    MxamPostprocess as MxamPostProcessStage
from global_config import MXRAY_ACTIVE, MXAM_ACTIVE, SYNC_STAGE_ACTIVE, \
    POST_PROCESSING_STAGE_ACTIVE, TEST_STAGE_ACTIVE, KILL_SWITCH, TEST_ONLY, \
    INPUT_JSON_SYNC_DIFF

from commit_stage.CommitStage import CommitStage
from prep_run_stage.RunConfig import RunConfig

from diagnostics.fsw_test_automation_logger import logger
from diagnostics.ExceptionCounter import exception

def run_config():


    """Run a prepared config"""
    if not TEST_ONLY:

        if SYNC_STAGE_ACTIVE:
            logger.info("Sync Stage: ")
            try:
                sync = SyncStage()
                sync.sync_sandboxes()
            except Exception:
                exception["sync_stage"] = exception["sync_stage"] + 1
                raise SyncStageException()

        logger.info("Diff Stage: ")

        try:
            diff = DiffStage()
            diff.diff_models()
            diff.export_diff()
        except Exception:
            print("ERROR: DIFF STAGE!")
            exception["diff_stage"] = exception["diff_stage"] + 1
            raise DiffStageException()

        if not diff.data_to_export['modelpath'] and not RunConfig().override_commit:
            logger.info("All models in run are up to date. Going to next run.")
            return
    else:
        diff = DiffStage()
        #diff.diff_models()
        diff.export_diff()

    if TEST_STAGE_ACTIVE:
        logger.info("Test Stage: ")
        try:
            test_stage()
        except Exception:
            print("ERROR: TEST STAGE!")
            exception["test_stage"] = exception["test_stage"] + 1
            raise TestStageException()

    if POST_PROCESSING_STAGE_ACTIVE:
        if MXAM_ACTIVE:
            logger.info("Postprocess Stage: MXAM")
            try:
                mxam_post = MxamPostProcessStage()
                mxam_post.execute()
            except Exception:
                print("ERROR: POSTPROCESS MXAM STAGE!")
                exception["MXAMpostprocess_stage"] = exception["MXAMpostprocess_stage"] + 1
                raise PostProcessExceptionMxam()

        if MXRAY_ACTIVE:
            logger.info("Postprocess Stage: MXRAY")
            try:
                mxray_postprocess_stage()
            except Exception:
                print("ERROR: POSTPROCESS MXRAY STAGE!")
                exception["MXRAYpostprocess_stage"] = exception["MXRAYpostprocess_stage"] + 1
                raise PostProcessExceptionMxray()

    # Commit stage if not overridden, is handled by the DiffStage logic
    if not TEST_ONLY:
        if RunConfig().override_commit:
            #commit = CommitStage.instance()
            commit = CommitStage()
            commit.commit_models()
        else:
            commit = DiffStage()
            commit.diff_models()
        for key in exception:
            if exception[key] > 0:
                print(key, "has", exception[key], "error(s)!")

def main():
    global KILL_SWITCH
    prep_run_stage = PrepRunStage()
    matlab_version_control = MatlabVersionHandler.get_instance()

    try:
        while prep_run_stage.do_next:
            prep_run_stage.prep_current_run()
            try:
                matlab_version_control.set_version(
                    SIMULINK_MAP[
                        MatlabVersionHandler.find_matlab_numeric_version_from_model(
                            prep_run_stage.current_run['modelpath'][0]
                        )
                    ]
                )
            except Exception:
                matlab_version_control.set_version(
                    prep_run_stage.current_matlab_version)
                print("WARNING: Cannot read matlab version")

            try:
                run_config()
            except (SyncStageException, DiffStageException, TestStageException,
                    PostProcessExceptionMxam, PostProcessExceptionMxray) as e:
                logger.exception(f"Error at {e.name} \n {str(e)}")
            except KeyboardInterrupt:
                KILL_SWITCH = True
                sys.exit(1)
            finally:
                if not KILL_SWITCH:
                    prep_run_stage.wrap_up_run()

    except KeyboardInterrupt:
        # will kill the process if keyboard interrupted
        sys.exit(1)

    logger.info("All runs are through")

if __name__ == '__main__':
    main()
