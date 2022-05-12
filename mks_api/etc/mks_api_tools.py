import os
import re
from pathlib import Path



def dir_jump_back_and_forth(func):
    """Decorator, jumps into the directory defined in args[1] then executes,
    the function, then jumps back into the original directory again"""

    def wrapper_func(*args):
        prev_dir = os.getcwd()
        os.chdir(args[1])
        res = func(*args)
        os.chdir(prev_dir)
        return res

    return wrapper_func


def get_args(*args, **kwargs) -> str:
    """
    Constructs si/im arguments based on keys and their
    respective values in kwargs,

    eg: construct_si_argument(issueId="1234", testid=1234)
    will return ' --issueId=1234 --testid=1234'

    parameters which repeat themselves with different arguments can be
    passed as a list

    eg: get_args(filter=['filt1', 'filt2'])
    will return ' --filter=filt1, --filter=filt2'

    """
    arguments = ""

    for arg in args:
        arguments += " --{}".format(arg)

    # formatting kwargs so that no errors will occour later on
    kwargs = fix_kwargs_pathobjects(kwargs.copy())
    kwargs = wrap_kwargs_in_quotes(kwargs.copy())

    for kwarg in kwargs:
        if kwargs[kwarg] is None:
            arguments += " --{}".format(kwarg)
        elif isinstance(kwargs[kwarg], list):
            for list_item in kwargs[kwarg]:
                # wraps the keyword value in quotes if it has whitespaces
                arguments += " --{}={}".format(kwarg, list_item)
        elif isinstance(kwargs[kwarg], dict):
            """For special parameters"""
            curr_dict = kwargs[kwarg]
            for curr_dict_kwarg in curr_dict:
                arguments += f" --{kwarg}.{curr_dict_kwarg}=" \
                             f"{curr_dict[curr_dict_kwarg]}"


        else:
            arguments += " --{}={}".format(kwarg, kwargs[kwarg])

    return arguments


def fix_kwargs_pathobjects(input: dict) -> dict:
    """Loops through kwargs and turns all pathobjects to strings"""
    for keyw in input:
        if isinstance(input[keyw], Path):
            input[keyw] = str(input[keyw])

    return input


def wrap_kwargs_in_quotes(input: dict) -> dict:
    """Wraps the keyword values with whitespaces in quotes so that there are no
    issues with relaying the data to mks"""
    for keyword in input:
        if isinstance(input[keyword], list):
            input[keyword] = [wrap_if_whitespaces(input_list_iter)
                          for input_list_iter in input[keyword]]
        if isinstance(input[keyword], str):
            input[keyword] = wrap_if_whitespaces(input[keyword])
    return input


def wrap_if_whitespaces(input: str) -> str:
    """takes a string wraps it in quotes if there are whitespaces
    and returns the wrapped string"""

    # if input has whitepaces and is not enclosesd in single or double quotes
    # a wrappend string will return
    if re.findall(r"\s", input) and not \
        (
        (input[0] == '"' and input[-1] == '"') or
        (input[0] == "'" and input[-1] == "'")
        ):
        return f"'{input}'"
    # otherwise a non wrapped string will return
    else:
        return input


def get_args_fieldnames(**kwargs) -> list:
    """
    Used for creating the arguments for the "field" argument in an MKS property

    Fields are of the structure 'fieldname'='fieldvalue',
    this is passed (not in this function) further along into the
    MKS argument "field" and is used fill the fields of MKS properties
    eg: Filling the fields of an Item in a Si Document

    keyword1='keyvalue1', keyword2='keyvalue2'
    will return a list with the MKS fieldname format:
        ['keyword1'='keyvalue1', 'keyword2'='keyvalue2']

    this list should be passed into:
        get_args(field=get_args_fieldnames(**kwargs))

    it will create the expected arguments for creating our fieldnames

    there is --field=PLACEHOLDER in the the
     output of this function would go in the
    PLACEHOLDER
    """

    # TODO Add Check for apostrophies! And throw error

    fieldname_arguments = list()
    for kwarg in kwargs:
        fieldname_arguments.append(
            "'{}'='{}'".format(kwarg, kwargs[kwarg]))

    # wrapping the return string in single quotes
    return fieldname_arguments

def joinpath(*args) -> Path:
    """Works like Path.joinpath, but you can toss in only strings"""
    args = [Path(arg) for arg in args]
    ret_path = Path(" ")
    for arg in args:
        ret_path = Path.joinpath(ret_path, arg)
    return ret_path


class Singleton:
    """
    A non-thread-safe helper class to ease implementing singletons.
    This should be used as a decorator -- not a metaclass -- to the
    class that should be a singleton.

    The decorated class can define one `__init__` function that
    takes only the `self` argument. Also, the decorated class cannot be
    inherited from. Other than that, there are no restrictions that apply
    to the decorated class.

    To get the singleton instance, use the `instance` method. Trying
    to use `__call__` will result in a `TypeError` being raised.

    """

    def __init__(self, decorated):
        self._decorated = decorated

    def instance(self):
        """
        Returns the singleton instance. Upon its first call, it creates a
        new instance of the decorated class and calls its `__init__` method.
        On all subsequent calls, the already created instance is returned.

        """
        try:
            return self._instance
        except AttributeError:
            self._instance = self._decorated()
            return self._instance

    def __call__(self):
        raise TypeError('Singletons must be accessed through `instance()`.')

    def __instancecheck__(self, inst):
        return isinstance(inst, self._decorated)


