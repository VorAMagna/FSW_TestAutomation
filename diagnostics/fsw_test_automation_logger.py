import logging
import sys
from global_config import LOG_FILE_PATH


logging.basicConfig(filename=LOG_FILE_PATH,
                    format='%(asctime)s %(levelname)s:%(message)s',
                    level=logging.DEBUG)

# Setting stdout as a secondary log stream
logging.getLogger().addHandler(logging.StreamHandler(sys.stdout))

logger = logging
