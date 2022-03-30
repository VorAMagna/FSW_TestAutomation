from pathlib import Path
from mks_api.etc.mks_api_tools import joinpath

PROJ_ROOT = Path(__file__).parent
SI_FOLDER = "si"
IM_FOLER = "im"
ETC_FOLDER = "etc"

SERVERS_CONFIG = joinpath(PROJ_ROOT, ETC_FOLDER, "servers.json")

