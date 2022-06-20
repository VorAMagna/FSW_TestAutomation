import wx
from wx.lib.agw import customtreectrl
from wx.lib.agw.customtreectrl import TR_AUTO_CHECK_CHILD, TR_ELLIPSIZE_LONG_ITEMS, TR_AUTO_CHECK_PARENT
import json
from pathlib import Path
from libs.common import joinpath
# from global_config import PROJECT_CONFIGS_PATH
from event_identifiers import *

path = r'C:\Sandbox\FSW_TestAutomation\prep_run_stage\configs'


class ModuleManager:

    def __init__(self, parent, project):
        super(ModuleManager, self).__init__()
        self.root = None
        self.parent = parent
        self.project = project
        self.config_content = None
        self.module_path = {}

        # Create a CustomTreeCtrl instance
        self.custom_tree = customtreectrl.CustomTreeCtrl(parent, agwStyle=wx.TR_DEFAULT_STYLE | TR_AUTO_CHECK_PARENT |
                                                                          TR_AUTO_CHECK_CHILD | TR_ELLIPSIZE_LONG_ITEMS)
        # Add a root node to it
        self.set_root(project)

        self.parse_modules()
        self.create_structure()

    def set_root(self, root):
        self.root = self.custom_tree.AddRoot(root)

    def parse_modules(self):
        CONFIG_ROUTINE = joinpath(
            path, self.project + ".json"
        )
        with open(CONFIG_ROUTINE, 'r') as j:
            self.config_content = json.loads(j.read())

    def create_structure(self):
        # Create an image list to add icons next to an item
        il = wx.ImageList(16, 16)
        fldridx = il.Add(wx.ArtProvider.GetBitmap(wx.ART_FOLDER, wx.ART_OTHER, (16, 16)))
        fldropenidx = il.Add(wx.ArtProvider.GetBitmap(wx.ART_FILE_OPEN, wx.ART_OTHER, (16, 16)))
        fileidx = il.Add(wx.ArtProvider.GetBitmap(wx.ART_NORMAL_FILE, wx.ART_OTHER, (16, 16)))
        smileidx = il.Add(wx.ArtProvider.GetBitmap(wx.ART_NORMAL_FILE, wx.ART_OTHER, (16, 16)))
        checkedidx = il.Add(self.custom_tree.GetControlBmp(checkbox=True, checked=True, enabled=True, x=16, y=16))
        uncheckedidx = il.Add(self.custom_tree.GetControlBmp(checkbox=True, checked=False, enabled=True, x=16, y=16))

        self.custom_tree.SetImageList(il)

        self.custom_tree.SetItemImage(self.root, fldridx, wx.TreeItemIcon_Normal)
        self.custom_tree.SetItemImage(self.root, fldropenidx, wx.TreeItemIcon_Expanded)

        for module in self.config_content:
            self.module_path[module['name']] = module['sync'][0]
            child = self.custom_tree.AppendItem(self.root, module['name'], ct_type=1)
            self.custom_tree.SetItemImage(child, fldridx, wx.TreeItemIcon_Normal)
            self.custom_tree.SetItemImage(child, fldropenidx, wx.TreeItemIcon_Expanded)

            for modelpath in module['modelpath']:
                last = self.custom_tree.AppendItem(child, modelpath.split('\\')[-1], ct_type=1)
                self.custom_tree.SetItemImage(last, fileidx, wx.TreeItemIcon_Normal)
                self.custom_tree.SetItemImage(last, smileidx, wx.TreeItemIcon_Selected)

        self.custom_tree.Expand(self.root)

    def create_global_routine(self):
        checked_items = self.get_checked_items()
        run_configs = []
        for routine, routine_modules in checked_items.items():
            if len(routine_modules) == 0:
                continue
            config_modules = [x for x in self.config_content if x['name'] == routine][0]

            run_modules = [x for x in config_modules['modelpath'] if any(b in x for b in routine_modules)]

            if len(run_modules) > 0:
                run_configs.append(
                    {
                        "name": routine,
                        "modelpath": config_modules['modelpath'],
                        "sync": config_modules['sync'],
                        "matlab_version": config_modules['matlab_version']
                    }
                )
        print(run_configs)
        return run_configs



    def create_global_routine_gui(self):
        from scripts import find_modules
        import subprocess, json
        SEARCH_CONFIG = self.current_project
        run_config = subprocess.check_output(['python', find_modules.PATH, SEARCH_CONFIG])

        self.global_runs_list = json.loads(run_config.decode('utf8').replace("'", '"'))

    def get_custom_treectrl(self):
        return self.custom_tree

    def get_checked_items(self, item_parent=None, checked_items=None):
        if item_parent is None:
            item_parent = self.custom_tree.GetRootItem()

        if checked_items is None:
            checked_items = {}

        routine_module, cookie = self.custom_tree.GetFirstChild(item_parent)

        while routine_module:
            checked_items[self.custom_tree.GetItemText(routine_module)] = list()
            child, child_cookie = self.custom_tree.GetFirstChild(routine_module)
            while child:

                if self.custom_tree.IsItemChecked(child):
                    checked_items[self.custom_tree.GetItemText(routine_module)].append(self.custom_tree.GetItemText(child))

                child, child_cookie = self.custom_tree.GetNextChild(routine_module, child_cookie)

            # if self.custom_tree.IsItemChecked(routine_module) or len(checked_items) != size:
            #   checked_items.append(self.custom_tree.GetItemText(child))

            routine_module, cookie = self.custom_tree.GetNextChild(item_parent, cookie)

        print(checked_items)

        return checked_items

if __name__ == '__main__':
    pass
