import logging

DB_TABLE_NAME = 'jobads'
DB_FILE_NAME = 'jobads_database_test10.db'
TIMESTAMP_FILE = 'timestamp.txt'

BASE_URL = 'https://jobstream.api.jobtechdev.se'
STREAM_URL = f"{BASE_URL}/stream"
SNAPSHOT_URL = f"{BASE_URL}/snapshot"

SLEEP_TIME_MINUTES = 720 # This is every 12 hours
MAX_UPDATES = 4

DATE_FORMAT = "%Y-%m-%dT%H:%M:%S"

# Logging
LOG_LEVEL = logging.INFO  # Change INFO to DEBUG for verbose logging
LOG_FORMAT = '%(asctime)s  %(levelname)-8s %(message)s'
LOG_DATE_FORMAT = '%Y-%m-%d %H:%M:%S'

"""
Examples for the municiplaities in Västerbottens Län:
Skellefteå - kicB_LgH_2Dk
Robertsfors - p8Mv_377_bxp
Norsjö - XmpG_vPQ_K7T
Vindeln - izT6_zWu_tta
Umeå - QiGt_BLu_amP
Vännäs - utQc_6xq_Dfm
Göteborg - PVZL_BQT_XtL
"""

# if you don't want to do geographical filtering, set PLACES = []
# PLACES = ['kicB_LgH_2Dk', 'p8Mv_377_bxp', 'XmpG_vPQ_K7T', 'izT6_zWu_tta', 'QiGt_BLu_amP', 'utQc_6xq_Dfm']
PLACES = ['PVZL_BQT_XtL']

# if you don't want to do filtering on occupations, set OCCUPATIONS = []
# OCCUPATIONS = ['Z6TY_xDf_Yup']  # Städare
OCCUPATIONS = []
