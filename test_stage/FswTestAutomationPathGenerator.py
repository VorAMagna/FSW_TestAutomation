import os
from abc import abstractmethod
from pathlib import Path

from test_stage.setup_finders import find_composition_data_dictionary, find_magnalib

DATA_DICTIONARY_EXT = "dd"


class FswTestAutomationPathGenerator:
    """Abstract Base class with common implementations
    for path generation"""
    def __init__(self, modelpath):
        self.model_path = str(modelpath)
        self.source_dir = Path(modelpath).parent
        self.json_ext = ".json"
        self.result_dir = Path(modelpath).parent
        self.model_name = os.path.splitext(Path(modelpath).parts[-1])[0]

    # Abstract methods
    @property
    @abstractmethod
    def path_report_post(self) -> Path:
        """Path of the postprocessed report (without extentions)"""
        pass

    # REPORT POSTPROCESSING FILENAMES
    @property
    @abstractmethod
    def report_post_json(self) -> str:
        """Filename of the postprocessed json report"""
        pass

    @property
    @abstractmethod
    def report_post_xlsx(self) -> str:
        """Filename of the postprocessed xlsx report"""
        pass

    @property
    @abstractmethod
    def path_report_post_xlsx(self) -> Path:
        """Path of the postprocessed xlsx report """
        pass

    @property
    @abstractmethod
    def path_report_post_json(self) -> Path:
        """Path of the postprocessed json report """
        pass

    # implemented common methods
    @property
    def path_composition_data_dictionary(self) -> Path:
        return Path(find_composition_data_dictionary(self.model_path)[0])

    @property
    def path_module_data_dictionary(self) -> Path:
        return self.joinpath(self.source_dir,
                             f"{self.model_name}.{DATA_DICTIONARY_EXT}")

    @property
    def path_magnalib(self) -> Path:
        return Path(find_magnalib(self.model_path)[0])

    @staticmethod
    def joinpath(*args) -> Path:
        """Works like Path.joinpath, but you can toss in only strings"""
        args = [Path(arg) for arg in args]
        ret_path = Path(" ")
        for arg in args:
            ret_path = Path.joinpath(ret_path, arg)
        return ret_path
