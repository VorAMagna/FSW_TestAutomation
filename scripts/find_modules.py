import json
# noinspection PyUnresolvedReferences
import scripts_pathmagic # NOQA
from libs import winfind
from pathlib import Path

"""
Used for generating an incomplete config for modules to be tested.
"""
# -------------------------------------------------------------------------------------------------------
# Paths so be searched through recursively for modules
SEARCH_CONFIG = [
    (r"C:\Sandbox\INT_018_Product_Platform_EDrive\SW\STD\Development\ED_Group",
     "ROUTINE_INT_018_Product_Platform_ED_Group"),
(r"C:\Sandbox\INT_018_Product_Platform_EDrive\SW\STD\Development\HG_Group",
     "ROUTINE_INT_018_Product_Platform_HG_Group")
]
DEFAULT_MATLAB_VERSION = "2017b"

# Search patterns that tell the search ALGORITHM Which modules are to be searched for

#MODULE_SPECIFIERS = ['*.mdl']
#MODULE_SPECIFIERS = ['*.slx']
MODULE_SPECIFIERS = ['*.mdl', '*.slx']
# -------------------------------------------------------------------------------------------------------

# If paths which contain these substrings exist, they will be removed
NOT_WANTED = ['MagnaLib',
              '_Composition.mdl',
              '_Interface',
              'SVC', #'AFO',
              'SWC_CC_ClutchCtrlC02.mdl',
              'SWC_CC_ClutchCtrlC10.mdl', 'SWC_VC_BasicValueCalcV10.mdl',
              'SWC_VC_VehDynCtrlV10.mdl', 'SWC_VC_SignalConditioningV10.mdl',
              'CC_Composition.mdl', 'CC02.mdl', 'CC10.mdl',
              'RTE_Write_SC.mdl', 'RTE_Write_VC.mdl', 'RTE_Write_TR.mdl',
              'BC_Composition.mdl', 'VC_Composition.mdl',
              'DC_Composition.mdl', 'DC02.mdl', 'DC10.mdl',
              'SC_Composition.mdl', 'SigCondS10.mdl',
              'SO_Composition.mdl', 'SigOutO10.mdl',
              'TS_Composition.mdl', 'SysCoordT10.mdl',
              'HG_Composition.mdl', 'HG10.mdl',
              'CP_Composition.mdl', 'CP10.mdl', 'CP02.mdl', 'CPS02.mdl',
              'SI_Composition.mdl', 'SI02.mdl', 'SI02.slx', 'SI10.slx',
              'SC02.slx', 'SC10.slx', 'SO02.slx', 'SO10.slx',
              'DLC_Composition.mdl', 'CPS_Composition.mdl',
              'PFMEndS10.mdl', 'PFMStartS10.mdl',
              'UnusedSignalsS10.mdl', 'SO_Composition.slx','SI_Composition.slx',
              ]







def is_wanted_module(path: str or Path):
    """Checks if a path is not wanted
    :return: True if the path contains an not wanted substring and if folder name equals filename"""
    for not_wanted in NOT_WANTED:
        if not_wanted in str(path) or Path(path).parent.name != Path(path).name[:-4]:
            return False
    return True


run_configs = []
for search_path, search_name in SEARCH_CONFIG:
    found_modules = winfind(search_path, MODULE_SPECIFIERS)
    wanted_modules = \
        [module for module in found_modules if is_wanted_module(module)]
    if wanted_modules:
        run_configs.append(
            {
                "name": search_name,
                "modelpath": wanted_modules,
                "sync": [search_path],
                "matlab_version": DEFAULT_MATLAB_VERSION
            }
        )

print(json.dumps(run_configs))


"""
    (r"C:\Sandbox\MPT_011_eDS48V_BMW_HDT_P1\SW\STD\Development\SI",
     "ROUTINE__BMW_HDT_SI"),
    (r"C:\Sandbox\MPT_011_eDS48V_BMW_HDT_P1\SW\STD\Development\SO",
     "ROUTINE__BMW_HDT_SO")
"""