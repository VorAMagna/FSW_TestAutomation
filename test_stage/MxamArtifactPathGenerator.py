from pathlib import Path

from global_config import MXAM_REPORT_FILENAME, MXAM_REPORT_XML, MXAM_REPORT_XLSX, MXAM_REPORT_HTML, \
    MXAM_POST_REPORT_SUFFIX, MXAM_REPORT_PREFIX, USE_PREFIX
from test_stage.FswTestAutomationPathGenerator import FswTestAutomationPathGenerator


class MxamArtifactPathGenerator(FswTestAutomationPathGenerator):
    """Generates all the paths needed for the reports and the postprocessing"""

    def __init__(self, modelpath):
        """
        :param modelpath: the path of the model used as a base
        """
        super().__init__(modelpath)


    # REPORT NAME
    @property
    def report(self) -> str:
        """Report filename"""
        return self.model_name + MXAM_REPORT_FILENAME

    # REPORT FILENAMES
    @property
    def report_xml(self) -> str:
        """Filename of the xml report"""
        return self.report + MXAM_REPORT_XML[1]

    @property
    def report_xlsx(self) -> str:
        """Filename of the xlsx report"""
        return self.report + MXAM_REPORT_XLSX[1]

    @property
    def report_html(self) -> str:
        """Filename of the html report"""
        return self.report + MXAM_REPORT_HTML[1]

    # REPORT FILEPATHS
    @property
    def path_report(self) -> Path:
        """Path of the report (without extenstion)"""
        return self.joinpath(self.result_dir, self.report)

    @property
    def path_report_xlsx(self) -> Path:
        """Path of the xlsx report """
        return self.joinpath(self.result_dir, self.report_xlsx)

    @property
    def path_report_xml(self) -> Path:
        """Path of the xml report """
        return self.joinpath(self.result_dir, self.report_xml)

    @property
    def path_report_html(self) -> Path:
        """Path of the html report """
        return self.joinpath(self.result_dir, self.report_html)

    # REPORT POSTPROCESSING NAME
    @property
    def report_post(self) -> str:
        """Filename of the postprocessed report"""
        if USE_PREFIX:
            name = MXAM_REPORT_PREFIX + self.model_name
        else:
            name = self.model_name + MXAM_REPORT_FILENAME + MXAM_POST_REPORT_SUFFIX
        return name

    # REPORT POSTPROCESSING FILENAMES
    @property
    def report_post_json(self) -> str:
        """Filename of the postprocessed json report"""
        return self.report_post + self.json_ext

    @property
    def report_post_xlsx(self) -> str:
        """Filename of the postprocessed xlsx report"""
        return self.report_post + MXAM_REPORT_XLSX[1]

    # REPORT POSTPROCESSING PATHS
    @property
    def path_report_post(self) -> Path:
        """Path of the postprocessed report (without extentions)"""
        return self.joinpath(self.result_dir, self.report_post)

    @property
    def path_report_post_xlsx(self) -> Path:
        """Path of the postprocessed xlsx report """
        return self.joinpath(self.result_dir, self.report_post_xlsx)

    @property
    def path_report_post_json(self) -> Path:
        """Path of the postprocessed json report """
        return self.joinpath(self.result_dir, self.report_post_json)