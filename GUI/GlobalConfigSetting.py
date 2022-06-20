import wx
import json
# from global_config import PROJECT_CONFIGS_PATH
from event_identifiers import *


class GlobalConfigSetting:

    def __init__(self, parent):
        super(GlobalConfigSetting, self).__init__()
        self.parent = parent
        self.checkboxes_dict = {}
        self.outer_sizer = wx.BoxSizer(wx.VERTICAL)
        self.init_checkboxes()
        self.append_to_sizer()

    def init_checkboxes(self):
        self.checkboxes_dict['TEST_ONlY'] = wx.CheckBox(self.parent, wx.ID_ANY, u"TEST_ONLY", wx.DefaultPosition, wx.DefaultSize, 0)
        self.checkboxes_dict['FUSI'] = wx.CheckBox(self.parent, wx.ID_ANY, u"FUSI", wx.DefaultPosition, wx.DefaultSize, 0)
        self.checkboxes_dict['RETEST'] = wx.CheckBox(self.parent, wx.ID_ANY, u"RETEST", wx.DefaultPosition, wx.DefaultSize, 0)

    def append_to_sizer(self):
        for chk in self.checkboxes_dict.values():
            self.outer_sizer.Add(chk, 0, wx.ALL, 5)

    def get_outer_sizer(self):
        return self.outer_sizer

    def get_checkboxes_values(self):
        checkboxes_states = {}
        for chk in self.checkboxes_dict:
            checkboxes_states[chk] = self.checkboxes_dict[chk].GetValue()

        return checkboxes_states


if __name__ == '__main__':
    pass
