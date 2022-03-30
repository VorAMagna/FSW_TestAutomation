MKS_STRUCT_DELIM = ":"
MKS_STRUCT_INDENT = "    "
MKS_PARAM_DELIM = ": "


class MksStructParse:
    """Parses mks type structures"""
    def __init__(self):
        pass

    @staticmethod
    def mks_dict_parse(raw_text: str) -> dict:
        """Parses the revision string
        :param raw_text: raw string
        :type raw_text: str"""
        split_text = raw_text.split("\n")
        ret_dict = {}
        offset = 0

        for index in range(len(split_text)):

            if offset != 0:
                offset -= 1
                continue

            if split_text[index].endswith(MKS_STRUCT_DELIM):
                split_text[(index + 1):-1], offset = \
                    MksStructParse.determine_sub_struct_length(
                        split_text[(index + 1):-1])

                ret_dict[split_text[index].replace(MKS_STRUCT_DELIM, "")] = \
                    split_text[(index + 1):(index + 1) + offset]
                continue

            if MKS_PARAM_DELIM in split_text[index]:
                args = split_text[index].split(MKS_PARAM_DELIM)
                ret_dict[args[0]] = args[1]

        return ret_dict

    @staticmethod
    def determine_sub_struct_length(raw_text_list):
        return_offset = 0
        for index in range(len(raw_text_list)):
            if raw_text_list[index].startswith(MKS_STRUCT_INDENT):
                raw_text_list[index] = raw_text_list[index].replace(
                    MKS_STRUCT_INDENT, "")
                return_offset += 1
            else:
                break
        return raw_text_list, return_offset

    @staticmethod
    def si_parse_structure(raw_text_list):
        pass

    @staticmethod
    def figure_list_item(split_text):
        return 1