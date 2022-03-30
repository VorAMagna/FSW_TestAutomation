import re

RAW_INVALID_COMMAND_PATTERN = r"Invalid command: (.*)\n"


class MksInvalidCommandException(Exception):
    def __init__(self, msg, error):
        self.invalid_command = re.findall(RAW_INVALID_COMMAND_PATTERN, msg)[0]

        self.exception_desc = f"The command '{self.invalid_command}'" \
                              f"does not exist!: "

        msg = self.exception_desc + msg

        super().__init__(msg, error)


