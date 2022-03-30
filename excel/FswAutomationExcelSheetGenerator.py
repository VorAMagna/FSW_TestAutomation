from excel.FswAutomationExcelSheet import FswAutomationExcelSheet


class FswAutomationExcelSheetGenerator(FswAutomationExcelSheet):
    """
    Base class for the excel generators,
    small abstraction layer to the openpyxl lib to
    simplify excel writing process
     """

    def __init__(self, workbook_ref, sheet_name):
        super().__init__("write", workbook_ref, sheet_name)
        self.delete_default_sheet(workbook_ref)

    @staticmethod
    def delete_default_sheet(workbook_ref):
        """Deletes the default "Sheet" sheet """
        if "Sheet" in workbook_ref.sheetnames:
            workbook_ref.remove_sheet(workbook_ref['Sheet'])