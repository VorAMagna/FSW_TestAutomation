import wx
import json
from global_config import PROJ_ROOT
from event_identifiers import *
from libs.common import joinpath

#path = r'C:\Users\svc_mxam\Desktop\FSW_TestAutomation\prep_run_stage\configs\project_list.json'
path = joinpath(
            PROJ_ROOT, 'prep_run_stage', 'configs', "project_list.json"
        )


class ProjectManager(wx.Choice):

    def __init__(self, parent):
        super(ProjectManager, self).__init__()
        self.project_list = []
        self.temp_projects = {}
        self.parent = parent
        #self.create_project_drowdown()

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
        self.temp_projects[project] = path
        self.parent.project_list.SetItems(self.project_list)
        self.parent.project_list.SetSelection(0)
        self.parent.project_list.Fit()

    def get_project_list(self):
        return self.project_list


# def parse_project_list(self):
#     #y = json.loads(PROJECT_CONFIGS_PATH)
#     projects = []
#     with open(path, 'r') as j:
#         contents = json.loads(j.read())
#
#     for proj in contents.keys():
#         if contents[proj] == 'True':
#             projects.append(proj)
#
#     print(projects)


if __name__ == '__main__':
    # parse_project_list(None)
    pass
