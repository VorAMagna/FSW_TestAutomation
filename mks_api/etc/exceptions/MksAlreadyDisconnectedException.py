class MksAlreadyDisconnectedException(Exception):
    def __init__(self, msg, errors):
        self.exception_desc = "Server already disconnected"
        msg = self.exception_desc + msg
        super().__init__(self, msg, errors)
