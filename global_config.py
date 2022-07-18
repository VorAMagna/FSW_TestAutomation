"""Holds all the important variables multiple files use"""
import os
from pathlib import Path
from libs.common import joinpath

# Testing tools
MXAM_ACTIVE = True
MXRAY_ACTIVE = True
# -------------------------------------------------------------------------------------------------------
# Activate individual stages
# -------------------------------------------------------------------------------------------------------
SYNC_STAGE_ACTIVE = True  # default: True; False if CHECKPOINT has to be tested (sync MKS manually)
# -------------------------------------------------------------------------------------------------------
TEST_STAGE_ACTIVE = True  # default: True; (TEST)
POST_PROCESSING_STAGE_ACTIVE = True  # default: True; (GENERATE REPORTS)

DIFF_STAGE_OVERRIDE = True  # default: False; Retest
COMMIT_STAGE_OVERRIDE = True  # default: False
TEST_ONLY = False  # default: False; no MKS, no DIFF (iALM server)

MXAM_NEW_VERSION = False
FUSI = True  # default: True; for new projects (iALM server)
# -------------------------------------------------------------------------------------------------------
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

PROJ_ROOT = Path(__file__).parent
matlab_layer_folder = "matlab_layer"
input_folder = "prep_run_stage"

MATLAB_2015B_PATH = ''#os.environ['matlab15']
MATLAB_2017B_PATH = os.environ['matlab17']
# MATLAB_2019B_PATH = os.environ['matlab19']

# 2015b or 2017b or None, if None user will be prompted to pick a version
DEFAULT_MATLAB_VERSION = None
SI_ACTIVE = True
COMMIT_CHKIN = True  # default: True; a switch should be properly implemented to suppress MKS check in!!!

NO_JSON_CHKIN = True  # default: True; json should not be checked in. This variable should be deleted in the future!
MEMBER_REVISION_OVERRIDE = False  # default: False; -> slower (uses Matlab engine) but more accurate

CURRENT_SERVER = 'MPT_Lannach' # 'MPT_StValentin'
current_model = ""

if FUSI:
    MXAM_GUIDELINES = ('Only_User_Checks', 'MISRA_TL_Selected_Checks', 'ISO26262_Selected_Checks')
else:
    MXAM_GUIDELINES = ('Only_User_Checks', 'MISRA_TL_Selected_Checks')
MXAM_REPORT_FILENAME = '_MXAM_Report'  # it should be deleted in the future - all reports have to be with prefix
MXRAY_REPORT_FILENAME = '_MXRAY_Report'  # it should be deleted in the future - all reports have to be with prefix
MXAM_POST_REPORT_SUFFIX = "_final"  # it should be deleted in the future - all reports have to be with prefix
MXRAY_POST_REPORT_SUFFIX = "_final"  # it should be deleted in the future - all reports have to be with prefix
USE_PREFIX = True  # it should be deleted in the future - all reports have to be with prefix
MXAM_REPORT_PREFIX = "MXAM-Report_"
MXRAY_REPORT_PREFIX = "MXRAY-Report_"

MXAM_REPORT_XLSX = ('EXCEL', '.xlsx', False)  # Last value  activates report
MXAM_REPORT_HTML = ('HTML', '.html', False)
MXAM_REPORT_XML = ('XML', '.xml', True)  # Needs to be active for postprocessing

MXRAY_REPORT_EXCEL = ('Excel', '.xlsx', False)
MXRAY_REPORT_HTML = ('NoHTML', '.html', False)  # When set to false there will be no html reports generated
MXRAY_REPORT_XML = ('XML', '.xml', True) # XML Needs to be active for postprocessing

if MXAM_NEW_VERSION:
    MXAM_DRIVE_PATH = r'C:\OtherPrograms\MXAM_DRIVE_7_2_0'
    #MXAM_DRIVE_PATH = r'C:\OtherPrograms\MXAM_DRIVE_7-3-0'
else:
    MXAM_DRIVE_PATH = r'C:\OtherPrograms\MXAM_DRIVE_5-1-0'
MXRAY_PATH = r'C:\Sandbox\Product_Group\SW\Development\FSW_Tools\mxray'
FSW_TOOLS_PATH = r'C:\Sandbox\Product_Group\SW\Development\FSW_Tools'

LOG_FILE_PATH = joinpath(PROJ_ROOT, "diagnostics", "fsw_test_automation.log")

MATLAB_START_PATH = joinpath(PROJ_ROOT, "matlab_layer")

INPUT_GLOBAL_ROUTINE = joinpath(
    PROJ_ROOT, input_folder, "models_to_be_checked_routine.json"
)

INPUT_GLOBAL_TEMPORARY = joinpath(
    PROJ_ROOT, input_folder, "models_to_be_checked_temp.json"
)

FINISHED_MODELS_FILE = joinpath(
    PROJ_ROOT, input_folder, "output_models", "finished_models.json"
)

INPUT_JSON_SYNC_DIFF = joinpath(
    PROJ_ROOT, input_folder, "models_to_be_checked_iter.json")

MODELS_TO_TEST_FILE = joinpath(
    PROJ_ROOT, input_folder, "models_to_be_tested.json")

MATLAB_LOG_FILE_NAME = str(joinpath(
    PROJ_ROOT, matlab_layer_folder, "logs/matlab_comms_"))

MXRAY_EXPORT_LIMITS_FILE = str(joinpath(
    PROJ_ROOT, matlab_layer_folder,
    "matlab_communication", "mxray_models_to_except.json"))

MXRAY_LIMITS_RESULT_FILE = str(joinpath(
    PROJ_ROOT, matlab_layer_folder,
    "matlab_communication",
    "matlab_limits_result.json"))

MXAM_EXPORT_POSTPROCESSING_FILE = str(joinpath(
    PROJ_ROOT, matlab_layer_folder,
    "matlab_communication", "mxam_models_for_post_processing.json"))

BATCH_CONFIGURATION_FILE = str(joinpath(
    PROJ_ROOT, matlab_layer_folder,
    "matlab_communication", "mxam_mxray_batchconfig.json"))

MXAM_PROJECT_PATH = str(joinpath(
    PROJ_ROOT, matlab_layer_folder, "MXAM_libs",
    "fsw_test_automation.mxmp"))

COMMIT_FILE_PATH = str(joinpath(PROJ_ROOT, "commit_stage", "commits.json"))

MATLAB_EVAL_FILE = str(joinpath(PROJ_ROOT,
                                matlab_layer_folder,
                                "matlab_eval.json"))

if SI_ACTIVE:
    #Operckal
    SI_ISSUE_ID = "2584860"
    SI_CHANGE_PACKAGE_DESCRIPTION = "MXAM/MXRAY Automated Tests"
    SI_ISSUE_ID_IALM = "242926"

    #Vordermaier
    #SI_ISSUE_ID = "2584860"
    #SI_CHANGE_PACKAGE_DESCRIPTION = "MXAM/MXRAY Automated Tests"
    #SI_ISSUE_ID_IALM = "1743885"


# Test Stage Related
BATCH_SIZE_LIMIT = 4
MXAM_TIMEOUT_SECS = 12000 #7200  # Watchdog
MAX_MXAM_TRIES = 2
MAX_MXRAY_TRIES = 1
MXRAY_AFTERWAIT_SECS = 60
EXPORT_BATCH_CONFIG_TO_FILE = True
IS_EXPORT_MXRAY_LIMIT_EXCEPTIONS = True
PID_KEYWORD = "PID="
MATLAB_SCRIPT_MXAM = "ExecuteBatch_MXAM"
MATLAB_SCRIPT_MXRAY = "ExecuteBatch_MXRAY"
MXRAY_INIT_REPORT_FILE_PREFIX = 'mxray_Report_'
MXAM_STYLES_INITIALIZES = False



# Reports
WORD_WRAP_THRESHOLD = 100

# MISC
KILL_SWITCH = False



"""
TEMPLATE

A template how how the ACTIVE Flags should look like by default

# Testing tools
MXAM_ACTIVE = True
MXRAY_ACTIVE = True

SI_ACTIVE = True
# Activate individual stages
# These should be all set to True under normal conditions
SYNC_STAGE_ACTIVE = True
TEST_STAGE_ACTIVE = True
POST_PROCESSING_STAGE_ACTIVE = True

# If set to true, it will flag every model as to be checked
# this is supposed to be active only for debugging/special purposes
DIFF_STAGE_OVERRIDE = False

# If set to true, will check_in all models at the end without asking questions
# this is supposed to be active only for debugging/special purposes
COMMIT_STAGE_OVERRIDE = False

"""