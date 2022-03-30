from typing import List

from post_processing_stage.mxray_postprocessing\
    .mxray_report_postprocessing_config import MXRAY_METRICS
from post_processing_stage.mxray_postprocessing.MxrayReportValue import \
    MxrayReportValue


class MxrayReportSubsystem:
    """A subystem contained in a MXRAY Report"""

    def __init__(self, raw_subsystem_dict):
        self.data = raw_subsystem_dict

        if not ('MeetingID' in self.data):
            self.data['MeetingID'] = None
            self.level = self.data['Level']
            self.add_level_metric()
            self.values = self.order_values()
            self.path = self.data['FullPath']

    def has_meeting_id(self) -> bool:
        if self.data['MeetingID'] is None:
            return False
        else:
            return True

    @property
    def meeting_id(self):
        return self.data['MeetingID']

    @meeting_id.setter
    def meeting_id(self, value):
        self.data['MeetingID'] = value

    def order_values(self) -> List[MxrayReportValue]:
        value_list = list()
        for value in self.data['Values']['Value']:

            if self.has_meeting_id():
                value['MeetingID'] = self.meeting_id
            else:
                value['MeetingID'] = None

            value_list.append(MxrayReportValue(value))
        return value_list

    def add_level_metric(self):
        self.data['Values']['Value'].append(
            {'Name': 'Level',
             'Value': int(self.level)}
        )

    def add_limit_and_offset(self, limit):
        """Adds Limit to its corresponding mxray metric value, and
        offsets it if an offset exsists"""
        for mxray_limit_pair_iter in MXRAY_METRICS:
            value = self.get_value_by_mxray_name(
                mxray_limit_pair_iter['mxray_name'])
            value.set_limit(limit[mxray_limit_pair_iter['limit_name']])
            value.offset_value()
            self.meeting_id = limit['MeetingID']

    def get_value_by_mxray_name(self, name) -> MxrayReportValue:
        retval = None
        for value in self.values:
            if value.name == name:
                retval = value
                break
        return retval