""" 'Diffing' means checking if the reports are up to date"""

from diff_stage.DiffStage import DiffStage

if __name__ == '__main__':
    diff = DiffStage()
    diff.export_diff()
