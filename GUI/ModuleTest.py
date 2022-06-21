import json

import wx

import global_config
import main
import os, sys
from event_identifiers import *
from Menubar import MenuBar
from ModuleManager import ModuleManager
from ProjectManager import ProjectManager
from GlobalConfigSetting import GlobalConfigSetting


class MainWindow(wx.Frame):

    def __init__(self, parent):
        wx.Frame.__init__(self, parent, id=wx.ID_ANY, title=wx.EmptyString, pos=wx.DefaultPosition,
                          size=wx.Size(600, 400), style=wx.DEFAULT_FRAME_STYLE | wx.TAB_TRAVERSAL)
        self.panel = Panel(self)
        self.CreateStatusBar()
        self.SetMenuBar(self.panel.menubar)
        self.SetTitle("MXAM Module Testing")
        self.Show()


class Panel(wx.Panel):

    def __init__(self, parent):
        wx.Panel.__init__(self, parent)
        self.parent = parent
        #self.SetBackgroundColour("gray")

        self.run_button = None
        self.project_list = None
        self.project_manager = ProjectManager(self)
        self.current_project = None
        self.module_manager = None
        self.menubar = MenuBar(self)
        self.console = None
        self.checkboxes = None
        self.project_tree = None
        self.tree_sizer = wx.BoxSizer(wx.VERTICAL)
        self.init_ui()

    def init_ui(self):
        bSizer5 = wx.BoxSizer(wx.VERTICAL)
        gSizer1 = wx.GridSizer(0, 5, 0, 0)

        bSizer91 = wx.BoxSizer(wx.VERTICAL)

        self.m_staticText1 = wx.StaticText(self, wx.ID_ANY, u"Project", wx.DefaultPosition, wx.DefaultSize,
                                           wx.ALIGN_CENTER_HORIZONTAL)
        self.m_staticText1.Wrap(-1)

        bSizer91.Add(self.m_staticText1, 0, wx.ALL | wx.ALIGN_CENTER_HORIZONTAL, 5)

        # Project Dropdown
        self.project_manager.parse_project_list()
        self.project_list = wx.Choice(self, ID_SELECT_PROJECT, wx.DefaultPosition, wx.DefaultSize,
                                      self.project_manager.get_project_list(), 0)
        self.project_list.SetSelection(0)
        bSizer91.Add(self.project_list, 0, wx.ALL | wx.ALIGN_CENTER_HORIZONTAL, 5)

        gSizer1.Add(bSizer91, 0, 0, 5)
        gSizer1.Add((0, 0), 1, wx.EXPAND, 5)
        gSizer1.Add((0, 0), 1, wx.EXPAND, 5)
        gSizer1.Add((0, 0), 1, wx.EXPAND, 5)

        # Checkboxes for init global config
        self.checkboxes = GlobalConfigSetting(self)
        gSizer1.Add(self.checkboxes.get_outer_sizer(), 0, wx.EXPAND, 5)

        bSizer5.Add(gSizer1, 0, 0, 5)

        self.tree_sizer = wx.BoxSizer(wx.VERTICAL)

        bSizer111 = wx.BoxSizer(wx.VERTICAL)

        self.console_title = wx.StaticText(self, wx.ID_ANY, u"Console Output", wx.DefaultPosition, wx.DefaultSize, 0)
        self.console_title.Wrap(-1)

        bSizer111.Add(self.console_title, 0, wx.ALL | wx.ALIGN_CENTER_HORIZONTAL, 5)

        self.tree_sizer.Add(bSizer111, 0, wx.EXPAND, 5)

        self.console = wx.TextCtrl(self, wx.ID_ANY, wx.EmptyString, pos=wx.DefaultPosition, size=wx.DefaultSize,
                                   style=wx.TE_MULTILINE)
        # redirect stdout to console log in app
        sys.stdout = self.console
        self.tree_sizer.Add(self.console, 1, wx.EXPAND | wx.ALL, 5)

        self.module_manager = ModuleManager(self, self.current_project)
        self.project_tree = self.module_manager.get_custom_treectrl()
        self.tree_sizer.Add(self.project_tree, 1, wx.EXPAND | wx.ALL, 5)

        bSizer14 = wx.BoxSizer(wx.HORIZONTAL)

        bSizer15 = wx.BoxSizer(wx.VERTICAL)

        # bitmap = wx.Bitmap("Magna_logo.png")
        # self.logo = wx.StaticBitmap(self, wx.ID_ANY, bitmap, (10, 10), (bitmap.GetWidth(), bitmap.GetHeight()))
        # bSizer15.Add(self.logo, 0, wx.ALL, 5)

        bSizer14.Add(bSizer15, 1, wx.EXPAND, 5)
        bSizer17 = wx.BoxSizer(wx.VERTICAL)

        self.run_button = wx.Button(self, ID_RUN_PROGRAM, u"Run", wx.DefaultPosition, wx.DefaultSize, 0)
        bSizer17.Add(self.run_button, 0, wx.ALIGN_RIGHT | wx.ALL, 5)

        bSizer14.Add(bSizer17, 1, wx.EXPAND, 5)
        self.tree_sizer.Add(bSizer14, 0, wx.EXPAND, 5)

        bSizer5.Add(self.tree_sizer, 1, wx.EXPAND, 5)

        self.SetSizer(bSizer5)
        self.Layout()

        self.add_event_listeners()
        self.Centre(wx.BOTH)

    def quit_app(self, e):
        dial = wx.MessageDialog(None, 'Are you sure to quit?', 'Closing program',
                                wx.YES_NO | wx.NO_DEFAULT | wx.ICON_QUESTION)

        ret = dial.ShowModal()
        if ret == wx.ID_YES:
            self.parent.Destroy()
        else:
            # stop processing an event
            e.Veto()

    def run_tests(self, e):
        import os, stat

        os.chmod(r"C:\Users\alexvord\Documents\FSW_TestAutomation\diagnostics", stat.S_IWRITE)

        for root, dirs, files in os.walk(r'C:\Users\alexvord\Documents\FSW_TestAutomation\diagnostics'):
            for fname in files:
                full_path = os.path.join(root, fname)
                os.chmod(full_path, stat.S_IWRITE)

        self.console.WriteText("ClickedRun\n")
        self.console.WriteText(str(self.current_project) + '\n')

        a = self.checkboxes.get_checkboxes_values()
        self.console.WriteText(str(a) + '\n')

        # delete: test line to see project tree checkboxes working
        self.module_manager.get_checked_items()
        SEARCH_CONFIG = self.module_manager.create_global_routine()

        with open(global_config.INPUT_GLOBAL_ROUTINE, 'w') as current_run_file:
            json.dump(SEARCH_CONFIG, current_run_file)

        global_config.COMMIT_STAGE_OVERRIDE = a['RETEST']
        global_config.DIFF_STAGE_OVERRIDE = a['RETEST']
        global_config.FUSI = a['FUSI']
        global_config.TEST_ONLY = a['TEST_ONLY']
        main.main()


    def set_current_project(self, e):
        if self.current_project != self.project_list.GetString(self.project_list.GetSelection()):
            self.current_project = self.project_list.GetString(self.project_list.GetSelection())
            self.recreate_project_tree()

    def recreate_project_tree(self):
        self.module_manager = ModuleManager(self, self.current_project)
        self.tree_sizer.Replace(self.project_tree, self.module_manager.get_custom_treectrl())
        self.project_tree.Destroy()
        self.project_tree = self.module_manager.get_custom_treectrl()
        self.Layout()

    def add_event_listeners(self):
        self.parent.Bind(wx.EVT_CLOSE, self.quit_app)
        self.parent.Bind(wx.EVT_MENU, self.menubar.on_open_directory, id=ID_ADD_PROJECT)
        self.parent.Bind(wx.EVT_MENU, self.quit_app, id=ID_MENU_QUIT)
        self.parent.Bind(wx.EVT_BUTTON, self.run_tests, id=ID_RUN_PROGRAM)
        self.parent.Bind(wx.EVT_CHOICE, self.set_current_project, id=ID_SELECT_PROJECT)


if __name__ == '__main__':
    app = wx.App()
    ex = MainWindow(None)
    app.MainLoop()
