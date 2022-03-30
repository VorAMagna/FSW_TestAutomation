from pathlib import Path

import openpyxl
from typing import List

from excel.FswAutomationExcelSheetGenerator import FswAutomationExcelSheetGenerator
from excel.FswTestAutomationXlsxStyles import FswTestAutomationXlsxStyles
from excel.FswAutomationExcelGenerator import FswAutomationExcelGenerator
from libs import win_make_writable
from scripts.Overview.MxamOverview import MxamOverview
from scripts.Overview.MxrayOverview import MxrayOverview

format_hyperlink = FswAutomationExcelSheetGenerator.format_hyperlink


def overview_data(mxam: MxamOverview, mxray: MxrayOverview) -> List[dict]:
    return \
        [
            {
                "name": "Model_Name",
                "value": mxam.module_name,
            },
            {
                "name": "Model_Revision",
                "value": mxam.mxam_report.model_revision
            },
            {
                "name": "DD_Revision",
                "value": mxam.mxam_report.data_dictionary_revision
            },
            {
                "name": "# Passed Mxam Test Cases",
                "value": mxam.passed_tc_count,
            },
            {
                "name": "# Failed Mxam Test Cases",
                "value": mxam.failed_tc_count,
                "okay": mxam.failed_tc_okay()
            },
            {
                "name": "# Aborted Mxam Test Cases",
                "value": mxam.aborted_tc_count,
                "okay": mxam.aborted_tc_okay()
            },
            {
                "name": "# Mxray Metrics OverLimit",
                "value": mxray.overlimit_metrics_count,
                "okay": mxray.overlimit_metrics_okay()

            },
            {
                "name": "Highest Cyclomatic Complexity",
                "value": mxray.highest_non_review_cyclomatic_complexity,
                "okay": mxray.highest_non_review_cyclomatic_complexity_okay()

            },
            {
                "name": "Highest Reviewed Cyclomatic Complexity",
                "value": mxray.highest_review_cyclomatic_complexity,

            },
            {
                "name": "path_to_mxam_report",
                "value": format_hyperlink(mxam.report_loc, mxam.report_loc)
            },
            {
                "name": "path_to_mxray_report",
                "value": format_hyperlink(mxray.report_loc, mxray.report_loc)
            },
        ]


class MxamMxrayOverviewExcelGenerator(FswAutomationExcelSheetGenerator):
    """Processes and generates mxam excel reports"""""

    def __init__(self, mxam_overviews: List[MxamOverview],
                 mxray_overviews: List[MxrayOverview]):
        self.mxam_overviews = mxam_overviews
        self.mxray_overviews = mxray_overviews

        self.workbook = openpyxl.Workbook()

        super().__init__(self.workbook, "ComponentOverview")

        # Initalize styles
        styles = FswTestAutomationXlsxStyles.get_instance()
        self.top_style = styles.top_style
        self.issue_style = styles.over_limit_style
        self.write_sheet_top()
        self.write_body()
        self.auto_adjust_column_dimensions()

    def write_sheet_top(self):
        """Writes the upper columns"""
        for overview_column in overview_data(
                self.mxam_overviews[0], self.mxray_overviews[0]):
            self.fill_cell(
                value=overview_column['name'],
                style=self.top_style,
                new_column=True)
        self.new_row()

    def write_body(self):
        # wills the body with the overview columns
        for mxam_overview, mxray_overvew in zip(self.mxam_overviews, self.mxray_overviews):
            for overview_column in overview_data(mxam_overview, mxray_overvew):
                if 'okay' in overview_column and not overview_column['okay']:
                    self.style_cell(self.issue_style)

                self.fill_cell(
                    value=overview_column['value'],
                    new_column=True)
            self.new_row()

    def export_file(self, overview_path: Path):
        win_make_writable(overview_path)
        self.workbook.save(overview_path)
