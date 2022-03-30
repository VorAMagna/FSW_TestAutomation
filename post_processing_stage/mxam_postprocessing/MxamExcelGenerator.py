import openpyxl
from libs.common import win_make_writable

from commit_stage.CommitTracker import CommitTracker
from post_processing_stage.mxam_postprocessing.MxamExcelGuidelineSheet import \
    MxamExcelGuidelineSheet

from post_processing_stage.mxam_postprocessing.MxamExcelOverviewSheet import \
    MxamExcelOverviewSheet
from post_processing_stage.mxam_postprocessing.MxamReport import MxamReport

from diagnostics.fsw_test_automation_logger import logger

class MxamExcelGenerator:
    """Processes and generates mxam excel reports"""""

    def __init__(self, mxam_report: MxamReport):
        """
        :param mxam_report: the report to be generated
        :type mxam_report: MxamReport
        """
        self.report = mxam_report
        self.workbook = openpyxl.Workbook()
        self.generate_overview_sheet()
        self.generate_guideline_sheets()

    def generate_overview_sheet(self):
        overview_sheet = MxamExcelOverviewSheet(self.workbook, "Overview", self.report)
        overview_sheet.write_sheet()

    def generate_guideline_sheets(self):
        for guideline in self.report.report_guidelines:
            self.generate_guideline_sheet(guideline)

    def generate_guideline_sheet(self, guideline):
        guideline_sheet = MxamExcelGuidelineSheet(self.workbook, guideline)
        guideline_sheet.write_sheet()

    def export_file(self):
        report_path = self.report.path_generator.path_report_post_xlsx
        logger.info("Exporting MXAM XLSX Report: {}".format(report_path))
        win_make_writable(report_path)
        self.workbook.save(report_path)