from mks_api.etc.exceptions.ChangePackageInvalidException import \
    ChangePackageInvalidException
from mks_api.etc.exceptions.ImFieldException import ImFieldException
from mks_api.etc.exceptions.MksException import MksException
from mks_api.etc.exceptions.MksInvalidCommandException import \
    MksInvalidCommandException
from mks_api.etc.exceptions.NoAssociatedChangePackage import \
    NoAssociatedChangePackage
from mks_api.etc.exceptions.SiNoMemberException import SiNoMemberException
from mks_api.etc.exceptions.SiArchiveIDNullException import SiArchiveIdNullException
from mks_api.etc.exceptions.MksAlreadyDisconnectedException import MksAlreadyDisconnectedException
from mks_api.etc.exceptions.MksAuthException import MksAuthException

# Error regex-es are bound to their exceptions here
# since these are checked in the order they are defined here
# the general errors should come at the end and the more specific
# errors should be at the top


ERROR_BINDS = [
    # 1. REGEX PATTERN # 2. EXCEPTION BOUND TO IT
    (r"The file .* is not a current or destined or pending member",
     SiNoMemberException),

    (r"\**\* MKS125449: The change package ID is invalid",
     ChangePackageInvalidException),

    (r"\**\* MKS5613057:",
     SiArchiveIdNullException),

    (r"\d*: This Integrity item has no associated change packages\.",
     NoAssociatedChangePackage),

    (r"Invalid command: .*\n",
     MksInvalidCommandException),

    (r"You are not connected to \w*:\d*",
     MksAlreadyDisconnectedException),

    (r"Authentication failed for \w* on \w*:\d*",
     MksAuthException),

    (r'\**\** The field ".*" does not contain the relationship flag ".*"\.*',
     ImFieldException),

    (r"MKS\d{1,}:",
     MksException),

    # TODO add no connection exception
]
