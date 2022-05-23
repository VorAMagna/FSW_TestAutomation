from excel.FswAutomationExcelSheetGenerator import \
    FswAutomationExcelSheetGenerator
from excel.FswTestAutomationXlsxStyles import FswTestAutomationXlsxStyles
from post_processing_stage.mxam_postprocessing.MxamReport import MxamReport
from global_config import TEST_ONLY


def overview_data(report: MxamReport) -> list:
    return \
    [
        {
            "name": "Model_Version",
            "value": report.model_revision,
        },
        {
            "name": "DD_Version",
            "value": report.data_dictionary_revision,
        },
        {
            "name": "Last_Modified_By",
            "value": report.last_modified_by,
        },
        {
            "name": "Report_Creation",
            "value": report.report_timestamp
        }
    ]


class MxamExcelOverviewSheet(FswAutomationExcelSheetGenerator):
    def __init__(self, workbook_ref, overview_sheet_name, report):
        """
        :param workbook_ref: reference to the workbook
        :param overview_sheet_name: name of the overview sheet
        :param report: The report object
        """
        super().__init__(workbook_ref, overview_sheet_name)
        styles = FswTestAutomationXlsxStyles.get_instance()
        self.report = report
        self.failed_style = styles.test_case_failed_style
        self.successful_style = styles.test_case_successful_style
        self.info_style = styles.test_case_info_style
        self.top_style = styles.top_style
        self.default_style = styles.default_style

    def write_sheet(self):
        """Writes in the data defined in overview_data function"""
        #if not TEST_ONLY:
        write_data = overview_data(self.report)
        for write_data_iter in write_data:
            self.fill_cell(value=write_data_iter['name'],
                           new_column=True)
            self.fill_cell(value=write_data_iter['value'],
                           new_column=True)
            self.new_row()

            self.auto_adjust_column_dimensions()

