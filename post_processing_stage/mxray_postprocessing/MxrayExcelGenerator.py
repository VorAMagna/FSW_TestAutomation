import openpyxl

from excel.FswAutomationExcelSheetGenerator import \
    FswAutomationExcelSheetGenerator
from excel.FswTestAutomationXlsxStyles import FswTestAutomationXlsxStyles
from post_processing_stage.mxray_postprocessing\
    .mxray_report_postprocessing_config import MXRAY_REPORT_COLUMNS
from libs.common import win_make_writable


class MxrayExcelGenerator(FswAutomationExcelSheetGenerator):
    """Generates the final excel report"""

    def __init__(self, report_database):
        self.workbook = openpyxl.Workbook()
        super().__init__(self.workbook, "MXRAY Report")
        self.columns = list()
        self.database = report_database
        self.report_columns = list()
        styles = FswTestAutomationXlsxStyles.get_instance()
        self.top_style = styles.top_style
        self.over_limit_style = styles.over_limit_style
        self.under_limit_style = styles.under_limit_style

    def generate_xlsx(self, report_path):
        """Generates (and exports) your xlsx"""
        self.write_sheet_top()
        self.write_report_body()
        self.auto_adjust_column_dimensions()
        self.export_file(report_path)

    def write_sheet_top(self):
        """Writes the upper columns"""
        for mxray_top_column in MXRAY_REPORT_COLUMNS:
            self.fill_cell(
                value=mxray_top_column['final_report_name'],
                style=self.top_style,
                new_column=True)
            if "has_limit" in mxray_top_column \
                    and mxray_top_column['has_limit']:
                self.fill_cell(
                    value=mxray_top_column['limit_name'],
                    style=self.top_style,
                    new_column=True)
        self.new_row()

    def write_metric(self, metric_obj):
        """Writes metric into cell"""
        if metric_obj.limit:
            if metric_obj.over_limit:
                style = self.over_limit_style
            else:
                style = self.under_limit_style

            self.fill_cell(value=metric_obj.value, style=style, new_column=True)
            self.fill_cell(value=metric_obj.limit['Value'], new_column=True)
        else:
            self.fill_cell(value=metric_obj.value, new_column=True)

    def write_info(self, info):
        """Writes a simple cell without a limit"""
        self.fill_cell(value=info, new_column=True)

    def write_report_body(self):
        """Writes the bulk of the data"""
        for subsystem in self.database.subsystems:
            for column in MXRAY_REPORT_COLUMNS:
                if column['type'] == "Metric":
                    metric = subsystem.get_value_by_mxray_name(
                        column['mxray_name'])
                    self.write_metric(metric)
                elif column['type'] == "Info":
                    self.write_info(subsystem.data[column['mxray_name']])
                elif column['type'] == 'MeetingID':
                    self.write_info(subsystem.meeting_id)
            self.new_row()

    def export_file(self, report_path):
        win_make_writable(report_path)
        self.workbook.save(report_path)