import re

from pathlib import Path

from mks_api.si.SiAdapter import SiAdapter
from mks_api.etc.exceptions.SiNoMemberException import SiNoMemberException

from mks_api.si.SiChangePackage import SiChangePackage


class SiMemberTestOnly:

    def __init__(self):
        self.revision_info = '1.0'
        self.win_username = 'TEST_ONLY (Check MKS!)'

    def get_win_username(self) -> str:
        return self.win_username

    @property
    def revision(self) -> str:
        return self.revision_info