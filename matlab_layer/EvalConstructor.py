import json
from global_config import MATLAB_EVAL_FILE


class EvalConstructor:
    """Evaluation commands are assigned here and will be evaluated in the
    matlab process"""
    def __init__(self):
        self.evals = list()

    def eval_script(self, script_name):
        """You can add scripts which are to be evaluated in matlab here"""
        self.evals.append(script_name)

    def define_variables(self, **kwargs):
        """You can define variables to be evaluated in matlab here
        NOTE: Only strings and intergers can be defined here"""
        for kwarg in kwargs:
            if isinstance(kwargs[kwarg], str):
                self.evals.append("{} = '{}'".format(kwarg, kwargs[kwarg]))
            if isinstance(kwargs[kwarg], int):
                self.evals.append("{} = {}".format(kwarg, kwargs[kwarg]))

    def export_to_file(self, filepath):
        export_dict = {
            "evals": self.evals
        }
        with open(filepath, "w") as file:
            json.dump(export_dict, file)


if __name__ == '__main__':
    eval = EvalConstructor()
    eval.define_variables(test1="blablabla", test2=124, test3="kurac")
    eval.eval_script("Script1")
    eval.export_to_file(MATLAB_EVAL_FILE)