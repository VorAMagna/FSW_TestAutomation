import json
import locale
import logging
import stat

import wx

import global_config
import main
import os, sys
from event_identifiers import *
from Menubar import MenuBar
from ModuleManager import ModuleManager
from ProjectManager import ProjectManager
from GlobalConfigSetting import GlobalConfigSetting
import diagnostics.fsw_test_automation_logger
from libs import joinpath


class MainWindow(wx.Frame):

    def __init__(self, parent):
        wx.Frame.__init__(self, parent, id=wx.ID_ANY, title=wx.EmptyString, pos=wx.DefaultPosition,
                          size=wx.Size(800, 500), style=wx.DEFAULT_FRAME_STYLE | wx.TAB_TRAVERSAL)
        self.panel = Panel(self)
        self.CreateStatusBar()
        self.SetMenuBar(self.panel.menubar)
        self.SetTitle("MXAM Module Testing")
        self.Show()


class Panel(wx.Panel):

    def __init__(self, parent):
        self.locale = wx.Locale(wx.LANGUAGE_ENGLISH)
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
        self.leftPanel = wx.BoxSizer(wx.VERTICAL)
        self.init_ui()

    def init_ui(self):
        windowPanel = wx.BoxSizer(wx.HORIZONTAL)

        self.leftPanel = wx.BoxSizer(wx.VERTICAL)

        projectListPanel = wx.BoxSizer(wx.VERTICAL)

        self.m_staticText1 = wx.StaticText(self, wx.ID_ANY, u"Project", wx.DefaultPosition, wx.DefaultSize,
                                           wx.ALIGN_CENTER_HORIZONTAL)
        self.m_staticText1.Wrap(-1)
        projectListPanel.Add(self.m_staticText1, 0, wx.ALL | wx.ALIGN_CENTER_HORIZONTAL, 5)

        # Project Dropdown
        self.project_manager.parse_project_list()
        self.project_list = wx.Choice(self, ID_SELECT_PROJECT, wx.DefaultPosition, wx.DefaultSize,
                                      self.project_manager.get_project_list(), 0)
        self.project_list.SetSelection(0)
        projectListPanel.Add(self.project_list, 0, wx.ALL | wx.ALIGN_CENTER_HORIZONTAL, 5)

        self.leftPanel.Add(projectListPanel, 0, 0, 5)
        # tree
        self.module_manager = ModuleManager(self, self.current_project)
        self.project_tree = self.module_manager.get_custom_treectrl()
        self.leftPanel.Add(self.project_tree, 1, wx.EXPAND | wx.ALL, 5)

        windowPanel.Add(self.leftPanel, 1, wx.EXPAND, 5)

        rightPanel = wx.BoxSizer(wx.VERTICAL)

        settingPanel = wx.GridSizer(0, 5, 0, 0)

        checkBoxPanel = wx.BoxSizer(wx.VERTICAL)

        # Checkboxes for init global config
        self.checkboxes = GlobalConfigSetting(self)
        checkBoxPanel.Add(self.checkboxes.get_outer_sizer(), 0, wx.EXPAND, 5)

        settingPanel.Add(checkBoxPanel, 0, wx.ALIGN_RIGHT | wx.EXPAND, 5)

        rightPanel.Add(settingPanel, 0, 0, 5)

        consolePanel = wx.BoxSizer(wx.VERTICAL)

        consoleTextPanel = wx.BoxSizer(wx.VERTICAL)

        self.console_title = wx.StaticText(self, wx.ID_ANY, u"Console Output", wx.DefaultPosition, wx.DefaultSize, 0)
        self.console_title.Wrap(-1)

        consoleTextPanel.Add(self.console_title, 0, wx.ALL | wx.ALIGN_CENTER_HORIZONTAL, 5)

        consolePanel.Add(consoleTextPanel, 0, wx.EXPAND, 5)

        self.console = wx.TextCtrl(self, wx.ID_ANY, wx.EmptyString, pos=wx.DefaultPosition, size=wx.DefaultSize,
                                   style=wx.TE_MULTILINE)
        # redirect stdout to console log in app
        sys.stdout = self.console
        logging.getLogger().addHandler(logging.StreamHandler(self.console))
        diagnostics.fsw_test_automation_logger.logger = logging

        consolePanel.Add(self.console, 3, wx.EXPAND | wx.ALL, 5)

        runPanel = wx.BoxSizer(wx.HORIZONTAL)

        bitmapPanel = wx.BoxSizer(wx.VERTICAL)

        self.m_bitmap1 = wx.StaticBitmap(self, wx.ID_ANY, wx.NullBitmap, wx.DefaultPosition, wx.DefaultSize, 0)
        bitmapPanel.Add(self.m_bitmap1, 0, wx.ALL, 5)

        runPanel.Add(bitmapPanel, 1, wx.EXPAND, 5)

        runButtonPanel = wx.BoxSizer(wx.VERTICAL)

        self.run_button = wx.Button(self, wx.ID_ANY, u"Run", wx.DefaultPosition, wx.DefaultSize, 0)
        runButtonPanel.Add(self.run_button, 0, wx.ALIGN_RIGHT | wx.ALL, 5)

        runPanel.Add(runButtonPanel, 1, wx.EXPAND, 5)

        consolePanel.Add(runPanel, 0, wx.EXPAND, 5)

        rightPanel.Add(consolePanel, 1, wx.EXPAND, 5)

        windowPanel.Add(rightPanel, 1, wx.EXPAND, 5)

        self.SetSizer(windowPanel)
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


        joinpath(global_config.PROJ_ROOT, 'diagnostics')
        os.chmod(joinpath(global_config.PROJ_ROOT, 'diagnostics'), stat.S_IWRITE)

        for root, dirs, files in os.walk(joinpath(global_config.PROJ_ROOT, 'diagnostics')):
            for fname in files:
                full_path = os.path.join(root, fname)
                os.chmod(full_path, stat.S_IWRITE)

        #self.console.WriteText("ClickedRun\n")
        #self.console.WriteText(str(self.current_project) + '\n')

        a = self.checkboxes.get_checkboxes_values()
        #self.console.WriteText(str(a) + '\n')


        self.module_manager.get_checked_items()
        SEARCH_CONFIG = self.module_manager.create_global_routine()

        with open(global_config.INPUT_GLOBAL_ROUTINE, 'w') as current_run_file:
            json.dump(SEARCH_CONFIG, current_run_file)

        global_config.COMMIT_STAGE_OVERRIDE = a['RETEST']
        global_config.DIFF_STAGE_OVERRIDE = a['RETEST']
        global_config.SYNC_STAGE_ACTIVE = a['SYNC']
        main.main()


    def set_current_project(self, e):
        if self.current_project != self.project_list.GetString(self.project_list.GetSelection()):
            self.current_project = self.project_list.GetString(self.project_list.GetSelection())
            self.recreate_project_tree()

    def recreate_project_tree(self):
        self.module_manager = ModuleManager(self, self.current_project)
        self.leftPanel.Replace(self.project_tree, self.module_manager.get_custom_treectrl())
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
