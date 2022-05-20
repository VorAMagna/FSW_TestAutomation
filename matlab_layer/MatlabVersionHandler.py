import re
from global_config import MATLAB_2015B_PATH, MATLAB_2017B_PATH, \
    DEFAULT_MATLAB_VERSION

from diagnostics.fsw_test_automation_logger import logger

SIMULINK_MAP = {
    "8.6": "2015b",
    "9.0": "2017b",
    "9.?": "2019b"
}


class MatlabVersionHandler:
    """
    SINGLETON

    Handles matlab versions
    """
    __instance__ = None

    def __init__(self):
        self.version = DEFAULT_MATLAB_VERSION
        self.matlab_path = ""

        if MatlabVersionHandler.__instance__ is None:
            MatlabVersionHandler.__instance__ = self
        else:
            raise Exception("You cannot create another SingletonGovt class")

    def set_version(self, version):
        if version == "2017b":
            self.version = "2017b"
            self.matlab_path = MATLAB_2017B_PATH
        elif version == "2015b":
            self.version = "2015b"
            self.matlab_path = MATLAB_2015B_PATH
        elif version == "2019b":
            self.version = "2019b"
            #self.matlab_path = MATLAB_2019B_PATH

    @property
    def matlab_path(self):
        """Gets matlab path, if there isint one set, it it will
        ask for the version"""
        if not self.version:
            self.set_version(
                input("There is no matlab version set! Type in 2017b or 2015b: "))
        return self._matlab_path

    @matlab_path.setter
    def matlab_path(self, value):
        self._matlab_path = value

    @staticmethod
    def get_instance():
        """ Static method to fetch the current instance.
       """
        if not MatlabVersionHandler.__instance__:
            MatlabVersionHandler()
        return MatlabVersionHandler.__instance__

    @staticmethod
    def find_matlab_numeric_version_from_model(path) -> str:
        """
        Finds matlab version from simulink model
        :param path: path to simulink model
        :return: version
        """
        fileContents = ""
        with open(path, "r", encoding="utf8") as file:
            fileContents = file.read()

        #version = re.findall(r"Version\s*(\d*\.\d*)", fileContents)[0]
        version = re.findall(r"Version\s*(\d*\.\d*)", fileContents)[0]
        return version

if __name__ == '__main__':
    matlab_version = MatlabVersionHandler.get_instance()
    logger.info(matlab_version.matlab_path)
    model = MatlabVersionHandler.find_matlab_numeric_version_from_model(r"C:\Sandbox\Product_Group\SW\Verification\Module_Test\FSW\CC\modules\AngTubeC10\AngTubeC10_TLTF.mdl")
