import subprocess
from scripts import find_modules
import wx
import json
from global_config import PROJ_ROOT
from libs.common import joinpath
from event_identifiers import *

path = joinpath(
    PROJ_ROOT, 'prep_run_stage', 'configs', "project_list.json"
)

class ProjectManager(wx.Choice):

    def __init__(self, parent):
        super(ProjectManager, self).__init__()
        self.project_list = []
        self.temp_projects = {}
        self.parent = parent
        self.popupmenu = None
        self.create_popup_menu()

    def parse_project_list(self):
        with open(path, 'r') as j:
            contents = json.loads(j.read())

        for proj in contents.keys():
            if contents[proj] == 'True':
                self.project_list.append(proj)

        self.parent.current_project = self.project_list[0] if self.project_list else None
        return self.project_list

    def add_project(self, project, path):
        self.project_list.append(project)
        self.add_to_project_list(project)
        self.temp_projects[project] = path
        self.parent.project_list.SetItems(self.project_list)
        self.parent.project_list.SetSelection(0)
        self.parent.project_list.Fit()

    def get_project_list(self):
        return self.project_list

    def add_to_project_list(self, project):
        with open(path, 'r') as j:
            contents = json.loads(j.read())

        if project not in contents.keys():
            contents[project] = 'True'
            with open(path, 'w') as projects_file:
                json.dump(contents, projects_file)

            new_project_file = joinpath(path.parent, project + ".json")
            with open(new_project_file, "w") as f:
                json.dump([], f)

    def add_module(self, event):
        project_directory = joinpath("C:\\Sandbox",
                                     self.parent.project_list.GetString(self.parent.project_list.GetSelection()))
        dlg = wx.DirDialog(self, message="Choose a module", defaultPath=str(project_directory))
        if dlg.ShowModal() == wx.ID_OK:
            module_config = self.run_search_config(dlg.GetPath())
            project_name = dlg.GetPath().split('\\')[2]
            self.append_to_config_file(module_config, project_name)
        dlg.Destroy()

    def create_popup_menu(self):
        self.popupmenu = wx.Menu()
        self.popupmenu.Append(ID_ADD_MODULE, 'Add module')
        self.popupmenu.Append(ID_DELETE_MODULE, 'Delete module')

    def on_show_popup(self, event):
        self.parent.PopupMenu(self.popupmenu)

    def run_search_config(self, path):
        module_name = path.split('\\')[-1]
        SEARCH_CONFIG = [path + ',' + module_name]
        run_config = subprocess.check_output(['python', find_modules.PATH, SEARCH_CONFIG])

        return json.loads(run_config.decode('utf8').replace("'", '"'))

    def append_to_config_file(self, module, project_name):
        project_file = joinpath(path.parent, project_name + ".json")
        with open(project_file, 'r') as j:
            config_content = json.loads(j.read())

        module_found = [x for x in config_content if x['name'] == module[0]['name']]

        if not module_found:
            config_content.append(module[0])

            with open(project_file, 'w') as json_file:
                json.dump(config_content, json_file)

            self.parent.recreate_project_tree()
        else:
            dial = wx.MessageDialog(None, 'Module is already defined in configuration file', 'Add module', wx.OK)
            dial.ShowModal()

    def delete_module(self, event):
        item = self.parent.module_manager.get_custom_treectrl().GetSelection()
        text = self.parent.module_manager.get_custom_treectrl().GetItemText(item)
        project_name = self.parent.project_list.GetString(self.parent.project_list.GetSelection())
        self.delete_from_config_file(text, project_name)

    def delete_from_config_file(self, module_name, project_name):
        project_file = joinpath(path.parent, project_name + ".json")
        with open(project_file, 'r') as j:
            config_content = json.loads(j.read())

        updated_config_file = [x for x in config_content if not x['name'] == module_name]
        with open(project_file, 'w') as json_file:
            json.dump(updated_config_file, json_file)
        self.parent.recreate_project_tree()


if __name__ == '__main__':
    # parse_project_list(None)
    pass
