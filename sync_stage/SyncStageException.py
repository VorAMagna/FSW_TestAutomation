from libs.StageException import StageException


class SyncStageException(StageException):
    def __init__(self):
        self.name = "sync stage"
        super().__init__(self.name)