class ChangePackageInvalidException(Exception):
    """Called when an change package is invalid"""
    def __init__(self, msg, errors):
        self.exception_desc = "The Change Package ID does not exist:"
        msg = self.exception_desc + msg
        super().__init__(self, msg, errors)
