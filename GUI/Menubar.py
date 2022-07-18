import wx
from event_identifiers import *

class MenuBar(wx.MenuBar):

    def __init__(self, parent):
        super(MenuBar, self).__init__()
        self.parent = parent
        self.create_menubar()

    def create_menubar(self):
        file = wx.Menu()
        file.Append(ID_ADD_PROJECT, '&Add Project', wx.EmptyString, wx.ITEM_NORMAL)
        file.Append(ID_MENU_QUIT, '&Quit', wx.EmptyString, wx.ITEM_NORMAL)

        edit = wx.Menu()

        view = wx.Menu()

        help = wx.Menu()
        help.Append(wx.ID_ANY, '&Documentation', wx.EmptyString, wx.ITEM_NORMAL)
        help.Append(wx.ID_ANY, '&About', wx.EmptyString, wx.ITEM_NORMAL)

        self.Append(file, '&File')
        self.Append(edit, '&Edit')
        self.Append(view, '&View')
        self.Append(help, '&Help')

    # ----------------------------------------------------------------------
    def on_open_directory(self, event):
        """"""
        dlg = wx.DirDialog(self, message="Choose a sandbox")
        if dlg.ShowModal() == wx.ID_OK:
            project_name = dlg.GetPath().split('\\')[-1]
            self.parent.project_manager.add_project(project_name, dlg.GetPath())
        dlg.Destroy()
