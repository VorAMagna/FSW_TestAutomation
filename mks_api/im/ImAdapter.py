import re

from mks_api.im.ImAdapterBase import ImAdapterBase


class ImAdapter(ImAdapterBase):
    def create_content(self, parent_id: str,
                       type: str,
                       base_arguments: dict,
                       field_arguments: dict) -> str:
        """
        Creates documents
        :param type: type of item
        :param parent_id: id of document to be created in
        :param base_arguments: base arguments
        :param field_arguments: custom field arguments
        :return: id of new created document
        """
        raw_return = self._raw_create_content(parent_id, type,
                                              base_arguments=base_arguments,
                                              fieldname_arguments=field_arguments)

        id_of_new_item = re.findall(r"Created Content\s(\S*)", raw_return)[0]

        return id_of_new_item
