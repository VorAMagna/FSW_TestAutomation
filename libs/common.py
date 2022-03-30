import os, sys
from contextlib import contextmanager
import subprocess
import warnings
from pathlib import Path


def win_make_writable(path: Path) -> int:
    """Uses a system call to make the file writable
    :param path: path of the dir
    :type path: Path or str
    :return: success"""
    return os.system('attrib -R ' + str(path))


def winfind(startpath, filenames) -> list:
    """Finds files meeting a criteria and returns a list with the filenames
    using the windows dir function (works a lot faster than python native stuff)
    :param startpath: starting search path
    :param filenames: filenames that are to be found (can include wildcards)
    :type filenames: list"""
    if isinstance(startpath, Path):
        startpath = str(startpath)
    found_files = list()
    for filename in filenames:
        exec_string = "dir " + os.path.join(startpath, filename)
        exec_string += " /S /B"
        returned_output = subprocess.getoutput(exec_string)
        if ("Datei nicht" in returned_output
                or "Not" in returned_output):
            returned_output = list()
        else:
            returned_output = returned_output.split("\n")
        found_files += returned_output
    return found_files


RECUR_LIMIT = 5  # For the file searching


class OutOfScopeError(Exception):
    def __init__(self, arg):
        self.args = arg


def find_file_recursively_upwards(start_path, keywords):
    """Finds a given file recursively upwards, (starting from the start path)
    going up paths untill it finds the file containing the file with the
    given keywords
    :param start_path: path wherwwe to start from
    :type start_path: WindowsPath or String
    :param keywords: keywords in a filename to search for
    :type keywords: list"""
    ticks = 0
    current_path = start_path
    # limit as to how many times to go up recursively
    recur_limit = RECUR_LIMIT
    recurred = 0
    found = False
    try:
        while not found:
            found_files = winfind(current_path, keywords)
            if found_files:
                found = True
            if not found and recurred < recur_limit:
                current_path = Path(current_path)
                current_path = current_path.parent
                recurred += 1
            if recurred > recur_limit and not found:
                raise OutOfScopeError(
                    "Could not Find any file started from:" + start_path)
        return found_files
    except OutOfScopeError as e:
        return ""


def joinpath(*args) -> Path:
    """Works like Path.joinpath, but you can toss in only strings"""
    args = [Path(arg) for arg in args]
    ret_path = Path(" ")
    for arg in args:
        ret_path = Path.joinpath(ret_path, arg)
    return ret_path


def figure_if_same_component(reference, model_in) -> bool:
    """Figures out if if the reference is in the same component as the model
    :param reference: the refreence model used to compare
    :param model_in: the model you are comparing to
    TODO: Refine for ST.Valentin"""
    reference_split = Path(reference).parts
    model_split = Path(model_in).parts
    try:
        if (reference_split[reference_split.index('Development') + 1] ==
                model_split[model_split.index('Development') + 1]):
            return True
        else:
            return False
    except ValueError:
        warnings.warn("FILE:" + __file__ +
                      " \n figure_if_same_component, function is not"
                      "sophisticated enough for"
                      " figuring out the same component:"
                      "\n Model1: " + reference + "\n"
                                                  "Model2: " + model_in)
        return False


@contextmanager
def suppress_stdout():
    with open(os.devnull, "w") as devnull:
        old_stdout = sys.stdout
        sys.stdout = devnull
        try:
            yield
        finally:
            sys.stdout = old_stdout

@contextmanager
def suppress_stderr():
    with open(os.devnull, "w") as devnull:
        old_stdout = sys.stderr
        sys.stderr = devnull
        try:
            yield
        finally:
            sys.stderr = old_stdout
