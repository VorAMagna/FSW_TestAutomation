import json
import os

from global_config import INPUT_JSON_SYNC_DIFF, MODELS_TO_TEST_FILE, \
    MXAM_ACTIVE, MXRAY_ACTIVE, TEST_ONLY, COMMIT_CHKIN

from diff_stage.ModelDiffer import ModelDiffer
from prep_run_stage.RunConfig import RunConfig
from commit_stage.CommitStage import CommitStage
from post_processing_stage.mxam_postprocessing.MxamReport import MxamReport
from post_processing_stage.mxray_postprocessing.MxrayReport import MxrayReport
from test_stage.MxamArtifactPathGenerator import MxamArtifactPathGenerator
from test_stage.MxrayArtifactPathGenerator import MxrayArtifactPathGenerator

from diagnostics.fsw_test_automation_logger import logger


class DiffStage:
    def __init__(self) -> object:
        with open(INPUT_JSON_SYNC_DIFF, "r") as file:
            self.config = json.load(file)
        if not TEST_ONLY:
            self.data_to_export = {'modelpath': self.diff_models()}
        else:
            self.data_to_export = {'modelpath': self.config['modelpath']}
            model=self.data_to_export['modelpath'][0]
            self.delete_mdl_if_slx_is_used(model)

    def diff_models(self):
        """checks if all the reports from the config file are up to date"""
        models_to_be_checked = list()
        for model in self.config['modelpath']:
            is_check = False
            self.delete_mdl_if_slx_is_used(model)
            if MXAM_ACTIVE and self.check_model_for_mxam(model):
                is_check = True
            if MXRAY_ACTIVE and self.check_model_for_mxray(model):
                is_check = True

            if is_check:
                models_to_be_checked.append(model)

        return models_to_be_checked

    def export_diff(self):
        """Exports the diff to a json file so it can be used for
        further stages"""
        with open(MODELS_TO_TEST_FILE, "w") as file:
            file.write(json.JSONEncoder().encode(self.data_to_export))

    def check_model(self, type, model):
        active_flag = None
        path_gen = None
        report_class = None
        differ_instance = ModelDiffer(model)
        report_exists = None
        report_up_to_date = None
        report_checked_in = None
        return_bool = False

        if type == "mxam":
            active_flag = MXAM_ACTIVE
            path_gen = MxamArtifactPathGenerator
            report_class = MxamReport
            report_exists = differ_instance.mxam_report_exists
            report_up_to_date = differ_instance.mxam_up_to_date
            report_checked_in = differ_instance.mxam_checked_in

        elif type == "mxray":
            active_flag = MXRAY_ACTIVE
            path_gen = MxrayArtifactPathGenerator
            report_class = MxrayReport
            report_exists = differ_instance.mxray_report_exists
            report_up_to_date = differ_instance.mxray_up_to_date
            report_checked_in = differ_instance.mxray_checked_in

        if active_flag:
            if RunConfig().override_diff:
                logger.info(f"{type} diff override: {model}")
                return_bool = True
            elif not report_exists():
                logger.info(f"{type} report does not exist for model: {model}")
                return_bool = True
            elif not report_up_to_date():
                logger.info(f"{type} report is not up to date: {model}")
                return_bool = True
            elif not report_checked_in():
                logger.info(f"report up to date, si_checkin: {model}")
                commit_stage = CommitStage.instance()
                commit_stage.check_in_model(path_gen(model),
                                            report_class)
                return_bool = False
            else: 
                logger.info(f"{type} report up to date: {model}")
        return return_bool

    def check_model_for_mxray(self, model) -> bool:
        """
        :param model:
        :return: True if the model is to be checked, false if the model is not
        to be checked
        """
        # if COMMIT_CHKIN:
        chkin = self.check_model("mxray", model)
        # else:
        #     chkin = False
        return chkin

    def check_model_for_mxam(self, model) -> bool:
        """
        :param model:
        :return: True if the model is to be checked, false if the model is not
        to be checked
        """
        # if COMMIT_CHKIN:
        chkin = self.check_model("mxam", model)
        # else:
        #     chkin = False
        return chkin

    def delete_mdl_if_slx_is_used(self, model):
        """If slx and mdl are in a same folder and slx has to be tested,
        then mdl is used.
        Solution: delete mdl
        Added: to be sure what model is tested do same for slx
        """
        if model[-3:]=='slx':
            mdl_file = model[:-3] + 'mdl'
            if os.path.exists(mdl_file):
                os.chmod(mdl_file, 0o777)
                os.remove(mdl_file)
                print('MDL DELETED: ' + mdl_file)
        if model[-3:] == 'mdl':
            slx_file = model[:-3] + 'slx'
            if os.path.exists(slx_file):
                os.chmod(slx_file, 0o777)
                os.remove(slx_file)
                print('SLX DELETED: ' + slx_file)


if __name__ == '__main__':
    diff = DiffStage()
    diff.check_model_for_mxam(
        r"C:\Sandbox\Product_Group\SW\Development\CC\CC_Composition\CC_Modules\CalC02")


