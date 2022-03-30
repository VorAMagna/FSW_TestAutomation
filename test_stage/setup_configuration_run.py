"""Sets the additional configuration needed for a mxam run"""
import os
import json
import warnings
from pathlib import Path
# Search keywords

# Note, if the file name is changed here it also needs to be changed
# in the matlab scripts

from test_stage.MxamArtifactPathGenerator import MxamArtifactPathGenerator
from test_stage.MxrayArtifactPathGenerator import MxrayArtifactPathGenerator
from global_config import MXAM_REPORT_XLSX, MXAM_REPORT_HTML, MXAM_REPORT_XML, \
    MXRAY_REPORT_EXCEL, MXRAY_REPORT_XML, MXAM_GUIDELINES, MXAM_ACTIVE, \
    MXRAY_ACTIVE, BATCH_CONFIGURATION_FILE, MXAM_DRIVE_PATH, MXRAY_PATH, \
    MXAM_PROJECT_PATH, FSW_TOOLS_PATH, MXRAY_REPORT_HTML


# False would mean no Html report in this case

# Guidelines from the mxam proejct file to be executed through
from test_stage.setup_finders import find_composition_data_dictionary, find_magnalib, \
    find_model_params


def configure_mxam_run(modules_to_check, export_to_file=False):
    """Takes in the models which are to be checked, figures out additional
    dependencies needed for the mxam config
    :param preconfig: input dictionary with the model info
    :param export_to_file: wether it should save the config the
    mxam_mxray_batchconfig.json File"""
    configuration = {}

    search_base = modules_to_check[0]
    configuration['data_dictionary_path'] = find_composition_data_dictionary(search_base)
    configuration['magnalib_path'] = find_magnalib(search_base)
    configuration['modelparam_path'] = find_model_params(search_base)
    configuration['artifacts'] = generate_artifacts(modules_to_check)
    configuration['mxam_drive_path'] = MXAM_DRIVE_PATH
    configuration['mxray_path'] = MXRAY_PATH
    configuration['mxam_project_path'] = MXAM_PROJECT_PATH
    configuration['fsw_tools_path'] = FSW_TOOLS_PATH
    configuration['mxam_active'] = MXAM_ACTIVE
    configuration['mxray_active'] = MXRAY_ACTIVE

    if export_to_file:
        with open(BATCH_CONFIGURATION_FILE, "w") as f:
            f.write(json.JSONEncoder().encode(configuration))
    return configuration


def generate_artifacts(modelpaths) -> dict:
    """Generates artifact data for the MXAM api
    :param modelpaths: the individual paths of the models
    :type modelpaths: list of strings"""
    complete_artifacts = dict()
    artifact_count = 1

    # check if the model exists
    for modelpath in modelpaths:
        if not Path(modelpath).exists():
            warnings.warn("The Model " + modelpath +
                          "does not exist!... Skipping")
            continue
        modelpath = Path(modelpath)
        mxray_paths = MxrayArtifactPathGenerator(modelpath)
        mxam_paths = MxamArtifactPathGenerator(modelpath)
        model_name = os.path.splitext(modelpath.parts[-1])[0]
        mxam_report_types = list()

        if MXAM_REPORT_XLSX[2]:
            mxam_report_types.append(MXAM_REPORT_XLSX[0])
        if MXAM_REPORT_HTML[2]:
            mxam_report_types.append(MXAM_REPORT_HTML[0])
        if MXAM_REPORT_XML[2]:
            mxam_report_types.append(MXAM_REPORT_XML[0])

        complete_artifacts['model' + str(artifact_count)] = {
            "model_name": model_name,

            "source_file": str(modelpath),

            "source_dir": str(mxray_paths.source_dir),

            "result_dir": str(mxray_paths.result_dir),

            "report_filename_mxam": mxam_paths.report,

            "report_filename_mxam_post": mxam_paths.report_post,

            "report_filepath_mxam_xlsx": str(mxam_paths.path_report_xlsx),

            "report_filepath_mxam_xml": str(mxam_paths.path_report_xml),

            "report_filepath_mxam_post_json":
                str(mxam_paths.path_report_post_json),

            "report_filepath_mxam_post_xlsx":
                str(mxam_paths.path_report_post_xlsx),

            "report_filename_mxray": mxray_paths.report,

            "report_filename_mxray_post": mxray_paths.report_post,

            "report_filepath_mxray_xlsx":
                str(mxray_paths.path_report_xlsx),

            "report_filepath_mxray_xml":
                str(mxray_paths.path_report_xml),

            "report_filepath_mxray_post_json":
                str(mxray_paths.path_report_post_json),

            "report_filepath_mxray_post_xlsx":
                str(mxray_paths.path_report_post_xlsx),

            "mxam_report_types": mxam_report_types,

            "mxam_guidelines": MXAM_GUIDELINES,

            "mxray_eval_string": mxray_generate_eval_string(
                modelpath,
                mxray_paths.result_dir)

        }
        artifact_count += 1
    return complete_artifacts


def mxray_generate_eval_string(model_path, result_dir) -> str:
    """Generates a matlab eval string which will execute the mxray analysis
    with our configured parameters
    :param model_path: path of the matlab mdl/slx file"""

    result_dir = str(result_dir)
    model_path = str(model_path)

    ret_str = ("mxray_createReport('" + model_path + "'" + ", 'Directory'" +
               ", '" + result_dir + "'")

    inbetween_str = (", '", "'")
    if MXRAY_REPORT_EXCEL[2]:
        ret_str += (inbetween_str[0] + MXRAY_REPORT_EXCEL[0] + inbetween_str[1])
    if MXRAY_REPORT_XML[2]:
        ret_str += (inbetween_str[0] + MXRAY_REPORT_XML[0] + inbetween_str[1])
    if not MXRAY_REPORT_HTML[2]:
        ret_str += (inbetween_str[0] + MXRAY_REPORT_HTML[0] + inbetween_str[1])

    ret_str += (", 'AllColumns', 'KeepClose');")
    return ret_str


