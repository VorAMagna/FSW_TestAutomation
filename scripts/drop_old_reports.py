import os
from mks_api.si.SiMember import SiMember


import scripts_pathmagic # NOQA

from commit_stage.CommitStage import CommitStage
from libs import winfind

DROP_ROOT = ["C:\Sandbox\Product_Group\SW\Development\CC\CC_Composition\CC_Modules"]
START_PREFIXES = ["*MXAM-Report*", "*MXRAY-Report*"]

if __name__ == '__main__':
    commit_stage = CommitStage.instance()
    commit_stage.manage_change_packages()
    cp = commit_stage.change_package

    for root_dir in DROP_ROOT:
        results = winfind(root_dir, START_PREFIXES)
        for result in results:
            if not result.endswith(".xlsx"):
                continue
            print(f"Dropping {result}")
            SiMember(result).drop(cp)

