from pathlib import Path

from libs.common import find_file_recursively_upwards

DD_KEYWORDS = ["*_Composition.dd"]
MAGNALIB_KEYWORDS = ["*MagnaLib.slx", "*MagnaLib.mdl"]
PARAMFILE_KEYWORDS = ["param.m"]


def find_composition_data_dictionary(model_path) -> list:
    """Figures out the data dictionary for a given module using the
    DD_EXTENSION keywords
    :param model_path: the path of a model used to figure out the
    data_dict path"""
    model_path = Path(model_path)
    model_path = model_path.parent
    found_dd = find_file_recursively_upwards(model_path, DD_KEYWORDS)
    return found_dd


def find_magnalib(model_path) -> list:
    """Figures out the data dictionary for a given module using the
    DD_EXTENSION keywords
    :param model_path: the path of a model used to figure out the
    data_dict path"""
    current_path = Path(model_path)
    current_path = current_path.parent
    magnalib_path = find_file_recursively_upwards(model_path, MAGNALIB_KEYWORDS)

    return_values = list()
    for magnalib_path_iter in magnalib_path:
        return_values.append(str(Path(magnalib_path_iter).parent))

    return return_values


def find_model_params(model_path) -> list:
    """Figures out where the param files are file is"""
    current_path = Path(model_path)
    current_path = current_path.parent
    paramfile_paths = find_file_recursively_upwards(model_path,
                                                    PARAMFILE_KEYWORDS)
    found_paths = list()
    for paramfile_path in paramfile_paths:
        found_paths.append(str(Path(paramfile_path).parent))

    return found_paths