from post_processing_stage.mxam_postprocessing import MxamReport


class MxamOverview:
    def __init__(self, mxam_report: MxamReport):
        self.mxam_report = mxam_report
        guidelines = mxam_report.get_report_guidelines()

        tc_results = []
        for guideline in guidelines:
            tc_results += list(map(lambda tc: tc.result, guideline.testcases))

        self.module_name = self.mxam_report.name
        if self.module_name == 'FreezeFrameC10':
            print('gotcha')
        self.report_loc = self.mxam_report.path_generator.path_report_post_xlsx
        self.passed_tc_count = tc_results.count("Passed")
        self.passed_tc_count += tc_results.count("Passed with Infos")
        self.aborted_tc_count = tc_results.count("Aborted")
        self.failed_tc_count = tc_results.count("Failed")

    def failed_tc_okay(self):
        return True if self.failed_tc_count == 0 else False

    def aborted_tc_okay(self):
        return True if self.aborted_tc_count == 0 else False
