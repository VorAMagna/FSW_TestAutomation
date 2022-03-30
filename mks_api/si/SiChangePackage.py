from mks_api.etc.MksStructParse import MksStructParse
from mks_api.si.SiAdapterBase import SiAdapterBase


class SiChangePackage:
    """Represents a change package in MKS"""
    def __init__(self, raw_change_package_info):
        super().__init__()

        self.mks_api = SiAdapterBase()
        self.full_id = ""
        self.issue_id = ""
        self.change_package_index = ""
        self.user = ""
        self.state = ""
        self.history = ""
        self.description = ""
        self.mks_struct = {}

        self.raw_info = raw_change_package_info

        # if the format is in the tabular delimited format it gets converted
        # into the tabular + newline format so that the alg can parse it
        if raw_change_package_info.count("\n") == 1:
            change_package_parts = raw_change_package_info.split("\t")
            full_id = change_package_parts[0]
            self.raw_info = self.mks_api._raw_get_change_package(full_id)

        self.deconstruct_raw_info()

    def deconstruct_raw_info(self):
        """Takes the change package format apart and gets every relevant
        datapoint"""
        deconstruced_lines = self.raw_info.split("\n")

        self.full_id = deconstruced_lines[0].split("\t")[0]
        self.state = deconstruced_lines[1].split("\t")[-2].strip()
        self.issue_id = self.full_id.split(":")[0]
        self.change_package_index = self.full_id.split(":")[1]
        self.description = deconstruced_lines[0].split("\t")[1]
        self.history = deconstruced_lines[6:-2]
        self.mks_struct = \
            MksStructParse.mks_dict_parse("\n".join(deconstruced_lines[2:-1]))

    def close(self, **kwargs):
        """Closes The Change Package"""
        return self.mks_api._raw_close_change_package(self.full_id, **kwargs)



