
class MksException(Exception):
    """Class 'general' for mks errors"""
    def __init__(self, msg, errors):
        self.exception_desc = "General MKS Error: "
        msg = self.exception_desc + msg
        super().__init__(self, msg, errors)

