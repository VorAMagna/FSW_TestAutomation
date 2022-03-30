from libs.StageException import StageException


class DiffStageException(StageException):
    def __init__(self):
        self.name = "diff stage"
        super().__init__(self.name)