class SiArchiveIdNullException(Exception):
    """Class 'general' for mks errors"""
    def __init__(self, msg, errors):
        self.exception_desc = "Archive ID is NULL: "
        msg = self.exception_desc + msg
        super().__init__(self, msg, errors)
