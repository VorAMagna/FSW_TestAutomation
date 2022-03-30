class MksAuthException(Exception):
    def __init__(self, msg, errors):
        self.exception_desc = "Authentication error!"
        msg = self.exception_desc + msg
        super().__init__(self, msg, errors)
