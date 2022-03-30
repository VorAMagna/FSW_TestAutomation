import re

from mks_api.im.ImAdapter import ImAdapter

from mks_api.etc.MksStructParse import MksStructParse

from mks_api.im.ImDocumentItem import ImDocumentItem, extract_contained_items

NEW_ITEM_TYPE = "System Component Requirement"


class ImDocument:
    """Class representing an IM document"""

    def __init__(self, document_id: str, refresh_flag=True, recursion_limit=1,
                 show_progess_flag=False):
        self.id = document_id
        self.im_api = ImAdapter()
        self.data = {}
        self.contained_items = {}
        self.refresh_flag = refresh_flag
        self.show_progress_flag = show_progess_flag

        if refresh_flag:
            self.refresh_data()

        # from the Contains field

    def wipe_document(self):
        """WARNING: Will remove all items in the document!
        Proceed with caution!"""
        # TODO finish this tomorrow
        if self.refresh_flag:

            input_str = input(
                "WARNING: You are about to wipe all the items from "
                "DOCUMENT ID: {}. Please double check that the document"
                "is not a live document, or if it is that you are sure "
                "it's the document you want!."
                "type in REMOVE_{} if you are sure "
                "that you want to remove it.".format(
                    self.id, self.id))

            if input_str == "REMOVE_{}".format(self.id):
                print("Removing items...")
                for item in self.contained_items:
                    item.remove()
            else:
                print("You failed to type in REMOVE_{}"
                      " items will not be removed!".format(self.id))

    def refresh_data(self):
        """Fetch the data contained in the MKS document new
        this function is needed for updating the data in the document
        continiously as it constantly changes as we edit it"""
        raw_data = self.im_api.cmd("viewissue", self.id)
        self.data = MksStructParse.mks_dict_parse(raw_data)
        self.contained_items, _ = extract_contained_items(
            self.data['Contains'],
            progress_flag=self.show_progress_flag,
            parent_id=self.id)

    def create_item(self, type: str, arguments, custom_fieldnames):
        """
        creates a new item in the document
        :param type: of type
        :param arguments: arguments for create item command
        :param fieldname_arguments: custom field arguments
        :return:
        """
        new_id = self.im_api.create_content(self.id,
                                            type,
                                            base_arguments=arguments,
                                            field_arguments=custom_fieldnames)

        return ImDocumentItem(item_id=new_id)

    @staticmethod
    def create_new_item(parent_id, field_name_arguments: dict):
        im_api = ImAdapter()
        raw_return = im_api._raw_create_content(parent_id,
                                                NEW_ITEM_TYPE,
                                                {"insertLocation": "last"},
                                                field_name_arguments)

        id_of_new_item = re.findall(r"Created Content\s(\S*)", raw_return)[0]

        return ImDocumentItem(id_of_new_item)

    def fetch_id_of_header(self, header_name):
        """Fetches the id of the header using the header name"""
        self.refresh_data()
        for contained_item in self.contained_items:
            if contained_item.item_name == header_name:
                return contained_item.id


if __name__ == '__main__':
    """For testing purposes"""
    main_document = ImDocumentItem("4301870")
    i = 1
