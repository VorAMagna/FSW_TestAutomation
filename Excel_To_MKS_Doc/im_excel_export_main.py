from Excel_To_MKS_Doc.ImExcelExporter import ImExcelExporter
from mks_api.im.ImDocument import ImDocument
from Excel_To_MKS_Doc.config.field_name_maps import DOCUMENT_ID

if __name__ == '__main__':
    export_instance = ImExcelExporter(
        r"C:\Users\vladvojn\Downloads\ArgsToImport.xlsx",
        "ArgErgs", ImDocument(DOCUMENT_ID, False))
