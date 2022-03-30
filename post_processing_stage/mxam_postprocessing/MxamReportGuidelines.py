from post_processing_stage.mxam_postprocessing.MxamReportTestCase import \
    MxamReportTestCase

from post_processing_stage.mxam_postprocessing.MxamReportTestCaseFinding import \
    MxamReportTestCaseFinding


class MxamReportGuidelines:
    """Representing a guideline with testcases inside of an mxam report"""

    def __init__(self, base):
        self.base = base
        self.testcases = self.get_test_cases()
        self.testcases_and_findings = self.get_findings(True)

        self.testcases_with_findings_prioritized = self.prioritize_findings(
            self.testcases_and_findings.copy())

        self.findings = self.get_findings()

    def prioritize_findings(self, testcases_and_findings: list) -> list:
        """Takes a list with testcases and failed findings and prioritizes
        the findings so that they are the first to show"""
        prioritized_list = list()
        for testcase in testcases_and_findings:
            if isinstance(testcase, MxamReportTestCaseFinding):
                prioritized_list.append(testcase)
        for testcase in testcases_and_findings:
            if isinstance(testcase, MxamReportTestCase):
                prioritized_list.append(testcase)

        return prioritized_list

    def get_findings(self, with_testcases=False):
        """
        Gets all the findings with the test cases
        :param with_testcases: if set to true will return a list mixed
        with findins and test cases,
        false will return only findings
        :return:
        """
        return_list = list()
        for testcase in self.testcases:
            if testcase.findings:
                return_list += testcase.findings
            elif with_testcases:
                return_list.append(testcase)
        return return_list

    def get_test_cases(self):
        """Extracts the test cases from the raw data"""
        raw_test_cases = self.base['check']
        return [MxamReportTestCase(raw_tc) for raw_tc in raw_test_cases]

#    def get_failed_test_cases_count(self):
#        return len(self.findings)
#
#    def get_aborted_test_cases_count
#
    @property
    def result(self):
        return self.base['result']

    @property
    def name(self):
        return self.base['@id']