from libs.StageException import StageException


class PostProcessExceptionMxray(StageException):
    def __init__(self):
        self.name = "mxray post process stage"
        super().__init__(self.name)