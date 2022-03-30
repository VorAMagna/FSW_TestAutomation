from typing import Union

from post_processing_stage.mxray_postprocessing \
    .mxray_report_postprocessing_config import MXRAY_METRICS


class MxrayReportValue:
    """A mxray metric value contained in a subsystem"""

    def __init__(self, values):
        self.data = values
        self.data['Limit'] = {}
        self.limit = self.data['Limit']
        self.set_default_limit()
        self.value_offset = self.get_value_offset()

    @property
    def over_limit(self) -> bool:
        """Tells if the value is over its given limit, returns False, if no
        limit exists!"""
        if self.limit:
            if float(self.value) > self.limit['Value']:
                return True
        return False

    @property
    def value(self) -> str:
        return self.data['Value']

    @value.setter
    def value(self, value_inner):
        self.data['Value'] = value_inner

    @property
    def name(self) -> str:
        return self.data['Name']

    @name.setter
    def name(self, value):
        self.data['Name'] = value

    def set_limit(self, new_limit):
        self.limit['Value'] = new_limit

    def get_limit(self) -> str:
        return self.limit['Value']

    def set_default_limit(self):
        """sets the default limit for a metric"""
        for metric_type in MXRAY_METRICS:
            if self.name == metric_type['mxray_name']:
                self.set_limit(metric_type['default_limit'])

    def get_default_limit(self) -> Union[str, None]:
        """Gets default limit for the metric, if there isint any,
        none is returned"""
        for metric_type in MXRAY_METRICS:
            if self.name == metric_type['mxray_name']:
                return metric_type['default_limit']
        return None

    def offset_value(self):
        """If the limit non default (user defined) and a possible offset
        is defined in the metric definitions, the value of the metric will
        be offset by that amount"""
        if self.is_user_defined_limit() and self.value_offset:
            self.value = str(float(self.value) + self.value_offset)

    def is_user_defined_limit(self) -> bool:
        """Determines if a metric value in a subsystem if user defined
        (limit differs from default limit)"""
        if self.get_default_limit() != self.get_limit():
            return True
        else:
            return False

    def get_value_offset(self) -> Union[str, None]:
        """Gets the value offset for the specific metric, if one exists.
        else it returns None"""
        for metric_type in MXRAY_METRICS:
            if self.name == metric_type['mxray_name']:
                if 'user_defined_offset' in metric_type:
                    return metric_type['user_defined_offset']
        return None

    def meeting_id(self) -> Union[str, None]:
        return self.data['MeetingID']


