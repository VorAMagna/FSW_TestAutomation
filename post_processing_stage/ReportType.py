from abc import abstractmethod
from pathlib import Path


class ReportType:
    """
    Base Class for Reports
    """
    @abstractmethod
    def __init__(self, base: dict or Path, generate_flag: bool):
        pass

    @property
    @abstractmethod
    def model_revision(self) -> str:
        pass





