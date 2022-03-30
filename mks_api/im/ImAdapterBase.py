from mks_api.etc.mks_api_tools import get_args, get_args_fieldnames
from mks_api.etc.MksAdapterBase import MksAdapterBase
from libs.Singleton import Singleton


class ImAdapterBase(MksAdapterBase):
    """The basic less abstracted functions lay here"""

    def __init__(self):
        super().__init__('im')

    def _raw_get_field(self, mks_id, **kwargs) -> str:
        arguments = get_args(**kwargs)
        return self.cmd("issues", "{} {}".format(arguments, mks_id))

    def _raw_get_issues(self, mks_id, **kwargs) -> str:
        """
        gets the issues
        :param mks_id: the id of the issue
        :param kwargs: the arguments and their values
        """
        arguments = get_args(**kwargs)
        return self.cmd("issues", "{} {}".format(arguments, mks_id))

    def _raw_create_content(self, parent_id: str,
                            type: str,
                            base_arguments: dict,
                            fieldname_arguments: dict) -> str:
        arguments = get_args(
            parentId=parent_id,
            type=("'{}'".format(type)),
            **base_arguments,
            field=get_args_fieldnames(**fieldname_arguments))

        raw_return = self.cmd("createcontent", "{}".format(arguments))

        return raw_return

    def _raw_remove_content(self, mks_id: str, **kwargs) -> str:
        arguments = get_args(**kwargs)
        return self.cmd("removecotent", "{} {}".format(arguments, mks_id))

    def update_data(self, parent_id, updated_data) -> str:
        """
        Updates data in fields of item
        :param parent_id:
        :param updated_data:
        :return:
        """
        i = 1
        return ""



if __name__ == '__main__':
    im_api = ImAdapterBase()
