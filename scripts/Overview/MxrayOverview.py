from post_processing_stage.mxray_postprocessing.MxrayReport import MxrayReport


class MxrayOverview:
    """Represents an overview for a single mxray report"""
    def __init__(self, mxray_report: MxrayReport):
        self.report_loc = mxray_report.path_generator.path_report_post_xlsx
        self.mxray_report = mxray_report

        subsystem_values = [subsystem.values
                            for subsystem in mxray_report.subsystems]

        self.flat_values = sum(subsystem_values, [])

        self.overlimit_metrics_count = \
            len([val for val in self.flat_values
                 if val.over_limit and not val.meeting_id()])

        cyclomatic_complexities_non_review = \
            [val for val in self.flat_values
             if (val.name == 'Cyclomatic Complexity')
             and val.data['MeetingID'] is None]

        if self.mxray_report.path_generator.model_name == 'NVMWriteC10':
            print('gotcha')

        cyclomatic_complexities_review = \
            [val for val in self.flat_values
             if (val.name == 'Cyclomatic Complexity' and val.meeting_id())]

        self.highest_review_cyclomatic_complexity = 0
        if cyclomatic_complexities_review:
            self.highest_review_cyclomatic_complexity = \
                max([int(iter_cc.value)
                     for iter_cc in cyclomatic_complexities_review])

        self.highest_non_review_cyclomatic_complexity = \
            max([int(iter_cc.value)
                 for iter_cc in cyclomatic_complexities_non_review])

    def highest_non_review_cyclomatic_complexity_okay(self) -> bool:
        """Returns true if a non reviewed cyclomatic complexity
        values is over it's limit"""
        for val in self.flat_values:
            if val.over_limit:
                if val.meeting_id() is None:
                    return False
        return True

    def overlimit_metrics_okay(self) -> bool:
        return False if self.overlimit_metrics_count > 0 else True





