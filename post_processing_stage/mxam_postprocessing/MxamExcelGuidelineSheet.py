from excel.FswAutomationExcelSheetGenerator import \
    FswAutomationExcelSheetGenerator
from excel.FswTestAutomationXlsxStyles import FswTestAutomationXlsxStyles
import textwrap
from global_config import WORD_WRAP_THRESHOLD
from post_processing_stage.mxam_postprocessing\
    .mxam_report_postprocessing_config import \
    MXAM_GUIDELINE_REPORT_COLUMNS


class MxamExcelGuidelineSheet(FswAutomationExcelSheetGenerator):
    """Generates a single guideline sheet"""
    def __init__(self, workbook_ref, guideline):
        super().__init__(workbook_ref,guideline.name)
        styles = FswTestAutomationXlsxStyles.get_instance()
        self.guideline = guideline
        self.failed_style = styles.test_case_failed_style
        self.successful_style = styles.test_case_successful_style
        self.info_style = styles.test_case_info_style
        self.top_style = styles.top_style
        self.default_style = styles.default_style

    def write_sheet(self):
        self.write_sheet_top()
        for testcase in self.guideline.testcases_with_findings_prioritized:
            self.write_test_case_row(testcase)
            self.new_row()
        self.auto_adjust_column_dimensions()

    def write_test_case_row(self, testcase):
        for column_type in MXAM_GUIDELINE_REPORT_COLUMNS:

            col_val, col_style = self.handle_cell_value_and_style(
                column_type['column_name'], testcase)

            self.fill_cell(value=col_val,
                           style=col_style,
                           new_column=True)

    def handle_cell_value_and_style(self, column_name, testcase):
        """
        Binds column names to their respective values styles
        :param column_name:
        :param testcase:
        :return:
        """
        col_val = ""
        col_style = self.default_style
        if column_name == "test_case_name":
            col_val = testcase.name
            col_style = self.default_style
        elif column_name == "result":
            col_val = testcase.result
            col_style = self.get_style_for_result(testcase.result)
        elif column_name == "message":
            # will textwrap the message if its too long
            col_val = "\n".join(textwrap.wrap(testcase.message,
                                              width=WORD_WRAP_THRESHOLD))
            col_style = self.default_style
        elif column_name == "path":
            col_val = testcase.path
            col_style = self.default_style
        elif column_name == "review":
            col_val = ""
            col_style = self.default_style

        return col_val, col_style

    def write_sheet_top(self):
        for column_type in MXAM_GUIDELINE_REPORT_COLUMNS:
            self.fill_cell(value=column_type['column_name'],
                           style=self.top_style,
                           new_column=True)
        self.new_row()

    def get_style_for_result(self, result):
        """returns the appropriate style for the test case
        ex: red if the test case is failed and so on """
        return_style = self.default_style
        if result == "Passed":
            return_style = self.successful_style
        elif result == "Failed":
            return_style = self.failed_style
        elif result == "Passed with Infos":
            return_style = self.successful_style
        elif result == "Info":
            return_style = self.info_style
        elif result == "Aborted":
            return_style = self.failed_style
        return return_style


