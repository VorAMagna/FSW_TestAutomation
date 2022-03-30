from Excel_To_MKS_Doc.ImExcelReader import ImExcelReader
from Excel_To_MKS_Doc.config.preprocessing_conditions import preprocess_list
from mks_api.im.ImDocument import ImDocument
from Excel_To_MKS_Doc.config.field_name_maps import DOCUMENT_ID

EXPORT_HEADER_DELIMITER = "Header"
EXPORT_HEADER_ELEMENT_DELIMITER = "Functional"
EXPORT_HEADER_LIST_KEYVAL = 'Requirements type'


class ImExcelExporter:
    """Represents an excel 2 mks export process"""
    def __init__(self, excel_file_path, sheet_name,
                 document_instance: ImDocument):
        export_reader = ImExcelReader(excel_file_path, sheet_name)
        self.export_list = export_reader.rm_export_list

        # Will turn the data into mks compliant data
        self.export_list = self.preprocess_export_list()

        # Makes export_objects out of the list and orders them
        # (non)hierrachically and injects them into mks
        if EXPORT_TO_MKS_HIERARCHICALLY:
            # TODO Finish hierarchincal export algorithm when needed
            self.export_objects = self.order_export_list_by_hierarchy()
            self.inject_export_objects_into_mks_hierarchy()
        else:
            self.export_objects = self.order_export_list_non_hierarchy()
            self.inject_export_objects_into_mks_non_hierarchy()

    def preprocess_export_list(self):
        """Preprocesses the loaded mks data"""
        return_items = list()
        for return_item in self.export_list.copy():
            self.preprocess_export_list_item(return_item)
            return_items.append(return_item)

        return return_items

    @staticmethod
    def preprocess_export_list_item(item):
        """Puts an item through all preprocessing functions
        from the preprocess list"""
        for preprocess in preprocess_list:
            preprocess(item)

    def inject_export_objects_into_mks_hierarchy(self):
        """Writes the export objects into mks"""
        for export_object in self.export_objects:
            if export_object.is_header():
                ImDocument.create_new_item(DOCUMENT_ID, export_object.base)
                export_object.inject_items_into_mks(DOCUMENT_ID)

    def inject_export_objects_into_mks_non_hierarchy(self):
        """Writes the export objects into mks"""
        for export_object in self.export_objects:
            export_params = export_object.base.copy()
            export_params = self.export_params_clear_nones(export_params)
            try:
                exported_item = ImDocument.create_new_item(DOCUMENT_ID,
                                                        export_params)
                print(f"New Item: {export_params['Summary']} created under ID:"
                      f"{exported_item.id}")
            except:
                pass

    @staticmethod
    def export_params_clear_nones(export_data):
        """Clears the empty fields from the export data"""
        export_data_working = export_data.copy()

        for key_value in export_data:
            if not key_value:
                export_data_working.pop(key_value)

        export_data = export_data_working
        export_data_working = export_data.copy()
        for key_value in export_data:
            if not export_data[key_value]:
                export_data_working.pop(key_value)

        return export_data_working

    def order_export_list_non_hierarchy(self) -> list:
        """
        Orders the list non hierarchically, so that all headers will
        be on equal footing with their functionals
        :return: list with the export elements
        """
        return [ImExportItem(export_list_iter) for export_list_iter in
                self.export_list if
                not ImExportItem(export_list_iter).is_header()]

    def order_export_list_by_hierarchy(self) -> list:
        """
        Orders the list hierarchically
        according to headers and their elements

        # TODO Inactive as a of now, maybe find a way to use it in the future
        """
        offset = 0
        export_objects = list()
        for export_list_index in range(len(self.export_list)):
            if offset != 0:
                offset -= 1
                continue
            if self.export_list[export_list_index][EXPORT_HEADER_LIST_KEYVAL] \
                    == EXPORT_HEADER_DELIMITER:
                offset, subelements_iter = \
                    self.order_export_list_get_subelements(
                        self.export_list[(export_list_index + 1):-1])
                export_objects.append(
                    ImExportItem(self.export_list[export_list_index],
                                 subelements_iter))
        return export_objects

    def order_export_list_get_subelements(self,
                                          continuation_list) -> int and list:
        """Gets all the sublelements of a header
        :param continuation_list: the list after the header"""
        offset = 0
        subelement_list = list()
        for continuation_list_element in continuation_list:
            if continuation_list_element[EXPORT_HEADER_LIST_KEYVAL] \
                    == EXPORT_HEADER_ELEMENT_DELIMITER:
                offset += 1
                subelement_list.append(continuation_list_element)
            else:
                break
        return offset, subelement_list


class ImExportItem:
    """Representing an Item and its contained
     Items which is to be exported to MKS"""

    def __init__(self, base, list_to_contain=None):
        self.base = base
        self.items = list()
        self.id = ""

        if list_to_contain:
            self.items = self.generate_items(list_to_contain)

    def generate_items(self, item_list):
        retval = list()
        for item in item_list:
            retval.append(ImExportItem(item))
        return retval

    @property
    def req_type(self):
        return self.base[EXPORT_HEADER_LIST_KEYVAL]

    @property
    def item_name(self):
        return self.base['Subject']

    def is_header(self):
        return True if self.req_type == EXPORT_HEADER_DELIMITER else False

    def inject_items_into_mks(self, document_id):
        """Injects the items in the header"""
        #        document = ImDocument(document_id)
        #        document.fetch_id_of_header(self.item_name)
        pass


EXPORT_TO_MKS_HIERARCHICALLY = False