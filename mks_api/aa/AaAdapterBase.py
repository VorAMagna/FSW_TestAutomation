from mks_api.etc.mks_api_tools import get_args
from mks_api.etc.MksAdapterBase import MksAdapterBase


class AaAdapterBase(MksAdapterBase):
    def __init__(self):
        super().__init__("aa")

