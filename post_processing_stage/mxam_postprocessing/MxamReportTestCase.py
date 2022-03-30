from post_processing_stage.mxam_postprocessing.MxamReportTestCaseFinding \
    import \
    MxamReportTestCaseFinding


class MxamReportTestCase:
    def __init__(self, base):
        self.base = base
        self.findings = []
        self.findings = self._get_error_findings()

    @property
    def result(self):
        return self.base['result']

    def _get_error_findings(self):
        return self._get_findings_of_type("Failed")

    def _get_aborted_findings(self):
        return self._get_findings_of_type("Aborted")

    def _get_findings_of_type(self, type: str):
        """Gets findings if any exist o"""

        # if there are multiple findings return them all (multiple findings
        # intrinsically mean the test case is failed)
        if isinstance(self.base['finding'], list):
            return [MxamReportTestCaseFinding(raw_finding, self)
                    for raw_finding in
                    self.base['finding']]

        # if there is a single one and its set to failed return that one
        # as a list of one item
        elif self.base['finding']['result'] == type:
            return [MxamReportTestCaseFinding(self.base['finding'], self)]

        # otherwise it means that there are no failed test cases
        # i.e. no findings
        else:
            return []


    @property
    def message(self):
        """Gives a proper message with finding results if any test
        findings do exist"""
        return_string = ""

        # if findings exist loop them
        # formating them into a compact string
        if self.findings:
            for finding in self.findings:
                return_string += \
                    "Finding_Path: {}\nFinding_message: {}\n\n".format(
                        finding.path, finding.message)
        else:
            # if none exist get the standard message
            return_string = self.base['finding']['message']

        return return_string

    @property
    def name(self):
        return self.base['@id']

    @property
    def path(self):
        return ""
