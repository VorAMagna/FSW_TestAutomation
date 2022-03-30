from time import sleep

from tqdm import tqdm

from mks_api.etc.MksStructParse import MksStructParse
from mks_api.im.ImAdapterBase import ImAdapterBase


class ImDocumentItem:
    """Class representing a single item inside a document"""

    def __init__(self, item_id: str, recursion=0, show_progess_flag=False):
        self.id = item_id
        self._im_api = ImAdapterBase()
        self._original_data = {}
        self.data = {}
        self.contained_items = {}
        self._show_progress_flag = show_progess_flag
        self._recursion = recursion
        self._refresh_data()

    def _refresh_data(self):
        """Fetch the data contained in the MKS document item new
        this function is needed for updating the data in the document
        continiously as it constantly changes as we edit it"""
        global glob_current_recursion
        raw_data = self._im_api.cmd("viewissue", self.id)
        self._original_data = MksStructParse.mks_dict_parse(raw_data)
        self.data = self._original_data.copy()
        self.contained_items, self._recursion = \
            extract_contained_items(
                self.data['Contains'],
                self._recursion,
                self._show_progress_flag,
                self.id)
        if self._recursion > glob_current_recursion:
            glob_current_recursion += 1
            if SHOW_RECURSION:
                print("New Recursion depth: {} deep".format(glob_current_recursion))

    def update(self):
        """
        Updates the changed data to server
        :return:
        """
        changed_data = {}
        for key_iter in self.data:
            if self._original_data[key_iter] != self.data[key_iter]:
                changed_data[key_iter] = self.data[key_iter]

        self._im_api.update_data(self.id, changed_data)


    @property
    def item_name(self):
        return self.data['Subject']

    # TODO Finish this
    def remove(self):
        """Will remove item"""
        pass


# The max depth in the item recoursion in an MKS Document

# Delay in seconds between individual item fetching (increase
# if connection is unstable)

# Current recursion used for counting
# implemented for development

# Number of total items fetched

# Flag for tracking purposes, when true will show

CONTAINS_DELIM = ", "
CONTAINS_USELESS_SUFFIX = "ay"
IM_DOCUMENT_RECURSION_LIMIT = 2
ITEM_FETCHING_DELAY = 0
glob_number_of_items_fetched = 0


def extract_contained_items(raw_contains, recursion=0, progress_flag=False,
                            parent_id="Hidden"):
    """Gets all the document items inside the document/item"""
    # Creates a document item id object for every document id
    # contained if it exists
    return_list = list()
    recursion += 1
    global glob_number_of_items_fetched

    if recursion > IM_DOCUMENT_RECURSION_LIMIT:
        return return_list, recursion

    for item_id in tqdm((raw_contains.replace(CONTAINS_USELESS_SUFFIX,
                                              "")). \
                                split(CONTAINS_DELIM),
                        disable=(not progress_flag),
                        desc="Getting elements of ID: {}".format(
                            parent_id),
                        unit="Item"):
        if len(item_id) == 0:
            continue

        try:
            return_list.append(ImDocumentItem(item_id,
                                              recursion))
        except Exception:
            return_list.append(ImDocumentItem(item_id,
                                              recursion))

        sleep(ITEM_FETCHING_DELAY)
        glob_number_of_items_fetched += 1

        if progress_flag:
            print("\nNumber of total ITEMS fetched: {}".format(
                glob_number_of_items_fetched))

    return return_list, recursion  # if the item id isint empty, it will
    # create a new document item id obj


SHOW_RECURSION = True
glob_current_recursion = 0
