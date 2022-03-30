import json

from global_config import MXRAY_LIMITS_RESULT_FILE


class PostProcessStageList:
    """Keeps track of which models are to be post processed"""
    def __init__(self):
        self.export_dict = dict()
        self.export_dict['limit_result_file'] = MXRAY_LIMITS_RESULT_FILE
        self.exceptions = dict()
        self.batch_index = 1

    def append(self, artifact):
        """Adds the exception to the list"""
        self.exceptions['batch' + str(self.batch_index)] = artifact
        self.batch_index += 1

    def export_to_file(self, file_path):
        self.export_dict['batches'] = self.exceptions
        with open(file_path, 'w') as file:
            file.write(json.JSONEncoder().encode(self.export_dict))