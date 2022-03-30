import json

from mks_api.si.SiMember import SiMember
from test_stage.FswTestAutomationPathGenerator import FswTestAutomationPathGenerator
from test_stage.MxamArtifactPathGenerator import MxamArtifactPathGenerator
from test_stage.MxrayArtifactPathGenerator import MxrayArtifactPathGenerator
from post_processing_stage.mxray_postprocessing.MxrayReport import MxrayReport
from post_processing_stage.mxam_postprocessing.MxamReport import MxamReport
from mks_api.etc.exceptions.SiNoMemberException import SiNoMemberException
from post_processing_stage.ReportType import ReportType


class ModelDiffer:
    def __init__(self, modelpath):
        self.modelpath = modelpath
        self.mxray_paths = MxrayArtifactPathGenerator(modelpath)
        self.mxam_paths = MxamArtifactPathGenerator(modelpath)
        self.si = SiMember(modelpath)
        self.model_revision = self.si.revision

    def report_exists(self, pathgen):
        return True if (pathgen.path_report_post_json.exists() and
                        pathgen.path_report_post_xlsx.exists()) \
            else False

    def report_is_up_to_date(self, pathgen: FswTestAutomationPathGenerator):
        """
        compares report with server, checks if its up to date
        :param pathgen:
        :return:
        """

        si_member_model = SiMember(pathgen.model_path)
        report_version = ""

        # figure right type
        if isinstance(pathgen, MxamArtifactPathGenerator):
            report_version = MxamReport(pathgen.path_report_post_json,
                                        generate_flag=False).model_revision
        elif isinstance(pathgen, MxrayArtifactPathGenerator):
            report_version = MxrayReport(pathgen.path_report_post_json,
                                         generate_flag=False).model_revision

        if report_version == "0.0":
            return False

        return not si_member_model.\
            is_newer(report_version)

    def mxam_report_exists(self):
        return self.report_exists(self.mxam_paths)

    def mxam_up_to_date(self):
        return self.report_is_up_to_date(self.mxam_paths)

    def mxam_checked_in(self):
        return self.report_is_checked_in(self.mxam_paths)

    def mxray_report_exists(self):
        return self.report_exists(self.mxray_paths)

    def mxray_up_to_date(self):
        return self.report_is_up_to_date(self.mxray_paths)

    def mxray_checked_in(self):
        return self.report_is_checked_in(self.mxray_paths)

    @staticmethod
    def is_newer_version(ref_version, compared_version):
        """Returns true if compared_version is higher than ref version,
        otherwise false"""
        return True if int(compared_version.split(".")[-1]) > \
                       int(ref_version.split(".")[-1]) else False

    def report_is_checked_in(self, pathgen: FswTestAutomationPathGenerator):
        """
        checks to see if the existing report is checked in
        :param pathgen:
        :return:
        """
        try:
            si_report_on_server = SiMember(
                pathgen.path_report_post_json)
            # si_report_on_server = SiMember(
            #     pathgen.path_report_post_xlsx)
        except SiNoMemberException:
            return False

        report_on_server = None
        report_local = None

        # figure right type
        if isinstance(pathgen, MxamArtifactPathGenerator):
            report_on_server = MxamReport(
                json.loads(si_report_on_server.view_revision()),
                generate_flag=False
            )

            report_local = MxamReport(
                pathgen.path_report_post_json,
                generate_flag=False
            )
        elif isinstance(pathgen, MxrayArtifactPathGenerator):
            report_on_server = MxrayReport(
                json.loads(si_report_on_server.view_revision()),
                generate_flag=False
            )

            report_local = MxrayReport(
                pathgen.path_report_post_json,
                generate_flag=False
            )

        report_on_server_version = report_on_server.model_revision
        report_local_version = report_local.model_revision

        if report_on_server_version == "0.0":
            return False

        return False if self.is_newer_version(
            report_on_server_version,
            report_local_version) \
            else True
