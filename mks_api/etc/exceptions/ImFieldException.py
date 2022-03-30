class ImFieldException(Exception):
    def __init__(self, msg, errors):
        self.exception_desc = "Field Error"
        msg = self.exception_desc + msg
        super().__init__(self, msg, errors)
