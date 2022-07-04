import json
from global_config import INPUT_JSON_SYNC_DIFF, SI_ISSUE_ID, \
    SI_CHANGE_PACKAGE_DESCRIPTION, MXAM_ACTIVE, MXRAY_ACTIVE, COMMIT_CHKIN, NO_JSON_CHKIN, SI_ISSUE_ID_IALM
import global_config
from test_stage.MxamArtifactPathGenerator import MxamArtifactPathGenerator
from test_stage.MxrayArtifactPathGenerator import MxrayArtifactPathGenerator
from test_stage.FswTestAutomationPathGenerator import \
    FswTestAutomationPathGenerator

from mks_api.si.SiMember import SiMember
from mks_api.si.SiAdapter import SiAdapter
from mks_api.etc.exceptions.SiNoMemberException import SiNoMemberException

from post_processing_stage.mxam_postprocessing.MxamReport import MxamReport
from post_processing_stage.mxray_postprocessing.MxrayReport import MxrayReport
from libs.Singleton import Singleton
from diagnostics.fsw_test_automation_logger import logger
from diagnostics.ExceptionCounter import exception


#@Singleton
class CommitStage:
    def __init__(self):
        self.mks_api = SiAdapter()
        self.change_package = None
        self.manage_change_packages()

        with open(INPUT_JSON_SYNC_DIFF, "r") as file:
            self.current_run_inputs = json.load(file)

    def manage_change_packages(self):
        """
        Manages And Assigns Change Packages.
        Such that there is only one instance of the change package
        (extras will be closed)
        if there is no change package with the SI_ISSUE_ID,
        one will be created
        """
        change_packages = self.mks_api.get_user_change_packages(
            self.mks_api.get_mks_user_name())

        # gets change packages with our id
        wanted_change_packages = [
            change_package
            for change_package in change_packages
            if change_package.full_id.startswith(SI_ISSUE_ID) or change_package.full_id.startswith(SI_ISSUE_ID_IALM)
        ]

        # if there are no change packages in the list
        # we will create a fresh change package
        if not wanted_change_packages:
            fresh_change_package = self.mks_api.create_change_package(
                SI_ISSUE_ID,
                description=SI_CHANGE_PACKAGE_DESCRIPTION)
            wanted_change_packages.append(fresh_change_package)

        # takes the change package at the top
        self.change_package = wanted_change_packages.pop()

        # closes the rest
        for change_package in wanted_change_packages:
            logger.info(f"MKS: Closing Redundant Change Pachage: "
                        f"{change_package.full_id}")
            change_package.close()

        logger.info(f"MKS :Using Change Package: {self.change_package.full_id}"
                    " for SI")

    def commit_models(self):
        """
        Will loop through all models in the current run.
        and upload the results to the SI Server
        """
        if COMMIT_CHKIN:
            for model in self.current_run_inputs['modelpath']:
                SiAdapter().set_server_for_project()
                self.mks_api = SiAdapter()
                self.manage_change_packages()
                if MXAM_ACTIVE:
                    logger.info(f"mxam report si_checkin for: {model}")
                    self.check_in_model(MxamArtifactPathGenerator(model),
                                        MxamReport)
                if MXRAY_ACTIVE:
                    logger.info(f"mxray report si_checkin for: {model}")
                    self.check_in_model(MxrayArtifactPathGenerator(model),
                                        MxrayReport)

    def check_in_model(
            self,
            report_pathgen: FswTestAutomationPathGenerator,
            report_class):
        """
        Checks in a single model
        :param report_pathgen: the pathgenerator of a single model
        :param report_class:
        :return:
        """

        # TODO: we want to check in only xslx reports without json...
        # else statement could be deleted in the future.
        if COMMIT_CHKIN:
            if NO_JSON_CHKIN:
                if not report_pathgen.path_report_post_json.exists():
                    logger.info(f"Report f{report_pathgen.path_report_post_json} "
                                f" does not exist, will checking in"
                                f" will be skipped.")
                    return

                check_in_description = self.generate_check_in_description(
                    report_pathgen.path_report_post_json, report_class)

                report_path = report_pathgen.path_report_post_xlsx
                try:
                    report_si_member = SiMember(report_path,
                                                add_if_no_member=True,
                                                change_package=self.change_package)
                    report_si_member.submit(self.change_package, check_in_description)

                except SiNoMemberException:
                    logger.exception("Member Could not be checked in!")
                    exception["commit_stage"]=exception["commit_stage"] + 1

            else:
                    if not report_pathgen.path_report_post_json.exists():
                        logger.info(f"Report f{report_pathgen.path_report_post_json} "
                                    f" does not exist, will checking in"
                                    f" will be skipped.")
                        return

                    check_in_description = self.generate_check_in_description(
                        report_pathgen.path_report_post_json, report_class)

                    for report_path in [report_pathgen.path_report_post_json,
                                        report_pathgen.path_report_post_xlsx]:
                        try:
                            report_si_member = SiMember(report_path,
                                                        add_if_no_member=True,
                                                        change_package=self.change_package)
                            report_si_member.submit(self.change_package, check_in_description)

                        except SiNoMemberException:
                            logger.exception("Member Could not be checked in!")
                            exception["commit_stage"] = exception["commit_stage"] + 1

    @staticmethod
    def generate_check_in_description(report_path, report_class):
        """
        Generates the check in description for the report
        :param report_path: The path of the report
        :param report_class: The class of the report
        :return:
        """
        report_obj = report_class(report_path)
        return report_obj.report_description


if __name__ == '__main__':
    commit_stage = CommitStage.instance()
    # commit_stage.commit_models()
    commit_stage_1 = CommitStage.instance()
