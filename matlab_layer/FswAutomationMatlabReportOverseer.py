from matlab_layer.FswAutomationMatlabProcess import FswAutomationMatlabProcess
from test_stage.MxamArtifactPathGenerator import MxamArtifactPathGenerator


class FswAutomationMatlabReportOverseer(FswAutomationMatlabProcess):
    """
    Base Matlab Overseer Class
    """

    def __init__(self, batch_config, config_path_name=""):
        super().__init__()
        self.reports = None
        self.batch_config = batch_config
        self.config_path_name = config_path_name

    def __del__(self):
        self.kill_matlab()

    @staticmethod
    def get_report_paths(batch_config, report_pathname) -> list:
        """fetches the mxam report names given a batch_config"""
        report_paths = list()
        for batch_config_iter in batch_config['artifacts'].values():
            pathgen = MxamArtifactPathGenerator(batch_config_iter['source_file'])
            report_paths.append(pathgen.path_report_xml)
        return report_paths
