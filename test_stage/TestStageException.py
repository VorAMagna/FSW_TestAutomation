from libs.StageException import StageException


class TestStageException(StageException):
    def __init__(self):
        self.name = "test stage"
        super().__init__(self.name)