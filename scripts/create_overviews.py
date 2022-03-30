"""
Will loop through all of the configured
runs and create overview files from the report
data.
"""
import scripts_pathmagic  # NOQA
from pathlib import Path
from libs.common import joinpath
from post_processing_stage.mxray_postprocessing.MxrayReport import MxrayReport

from scripts.Overview.MxamOverview import MxamOverview
from scripts.Overview.MxrayOverview import MxrayOverview

from test_stage.MxamArtifactPathGenerator import MxamArtifactPathGenerator
from prep_run_stage.PrepRunStage import PrepRunStage
from post_processing_stage.mxam_postprocessing.MxamReport import MxamReport
from scripts.Overview.MxamReportOverviewExcelGenerator import MxamMxrayOverviewExcelGenerator
from mks_api.si.SiMember import SiMember
from commit_stage.CommitStage import CommitStage

from test_stage.MxrayArtifactPathGenerator import MxrayArtifactPathGenerator

# An overview will be created only for the "run" names in this list
overview_name_list = ['ROUTINE__EVA_2_CP',
                      'ROUTINE__EVA_2_SO',
                      'ROUTINE__P_G_CC',
                      'ROUTINE__EVA_2_CPS',
                      'ROUTINE__EVA_2_SI',
                      'ROUTINE__P_G_DS_devbranch_5_6_0_CC',
                      'ROUTINE__P_G_VCb',
                      'ROUTINE__P_G_DC',
                      'ROUTINE__P_G_VCa',
                      'ROUTINE__Maserati_DSUV_Actimax_SO',
                      'ROUTINE__Maserati_DSUV_Actimax_SC',
                      'ROUTINE__P_G_SC',
                      'ROUTINE__481_BMW_SC',
                      'ROUTINE__481_BMW_SO',
                      'ROUTINE__481_BMW_TR',
                      'ROUTINE__P_G_BC',
                      'ROUTINE__P_G_DS_CC',
                      'ROUTINE__P_G_HG']

# Get runs list
run_stage = PrepRunStage()
runs_list = run_stage.global_runs_list

# Get standard change package object for checkins
commit_stage = CommitStage.instance()
commit_stage.manage_change_packages()
cp = commit_stage.change_package


def create_overview(run):
    print(f"Creating overview for {run['name']}")

    mxam_report_json_paths = [
        MxamArtifactPathGenerator(path).path_report_post_json
        for path in run['modelpath']
    ]
    mxray_report_json_paths = [
        MxrayArtifactPathGenerator(path).path_report_post_json
        for path in run['modelpath']
    ]

    mxam_reports = \
        [MxamReport(Path(path)) for path in mxam_report_json_paths]
    mxray_reports = \
        [MxrayReport(Path(path)) for path in mxray_report_json_paths]

    overview_list_mxam = \
        [MxamOverview(mxam_report) for mxam_report in mxam_reports]
    overview_list_mxray = \
        [MxrayOverview(mxray_report) for mxray_report in mxray_reports]

    overview = MxamMxrayOverviewExcelGenerator(overview_list_mxam, overview_list_mxray)

    export_path = mxam_report_json_paths[0].parent.parent
    export_path = joinpath(
        export_path, export_path.parts[-1] + '_MXAM_MXRAY_Overview.xlsx')

    # export xlsx report
    print(f"Exporting {export_path}")
    overview.export_file(export_path)

    # check in file
    print(f"Checking in {export_path}")
    SiMember(export_path, True, cp).\
        submit(cp, f"Overview for {run['name'].replace('ROUTINE__', '')}")


[create_overview(run) for run in runs_list
 if (run['name'] in overview_name_list)]