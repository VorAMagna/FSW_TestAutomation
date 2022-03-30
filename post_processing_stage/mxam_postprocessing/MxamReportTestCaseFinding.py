class MxamReportTestCaseFinding:
    """Represents a finding in a test case"""
    def __init__(self, base, parent_test_case):
        self.base = base
        self.parent_test_case = parent_test_case
        self.test = self.parent_test_case.name

    @property
    def name(self):
        return self.parent_test_case.name

    @property
    def message(self):
        return self.base['message']

    @property
    def result(self):
        return self.base['result']

    @property
    def path(self):
        return self.base['path']