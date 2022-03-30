from prep_run_stage.RunConfig import RunConfig


class StageException(Exception):
    def __init__(self, stage_name):
        super().__init__(f"Unknown failure at {stage_name}"
                         f"\nCONFIG: \n"
                         f"{RunConfig().run_config}")