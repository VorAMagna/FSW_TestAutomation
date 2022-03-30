import re

FILE_NAME_PATTERN = r"The file (.*) is not a current " \
                    r"or destined or pending member"

SANDBOX_PATH_PATTERN = r"or a subsandbox of (.*project.pj)"


class SiNoMemberException(Exception):
    """Occours when we it is tried to interact with an SiMember that
    actually isint on the server. """
    def __init__(self, msg, errors):
        self.sandbox_path = re.findall(SANDBOX_PATH_PATTERN, msg)[0]
        self.file_name = re.findall(FILE_NAME_PATTERN, msg)[0]

        self.exception_desc = f"The file {self.file_name}" \
                              f" does not belong to the {self.sandbox_path}" \
                              f" sandbox."

        msg = self.exception_desc + msg
        super().__init__(self, msg, errors)
