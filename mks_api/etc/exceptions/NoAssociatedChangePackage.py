class NoAssociatedChangePackage(Exception):
    """Occours when we it is tried to interact with an SiMember that
    actually isint on the server. """
    def __init__(self, msg, errors):
        self.exception_desc = "The Item has no no associated change package!:"
        msg = self.exception_desc + msg
        super().__init__(self, msg, errors)
