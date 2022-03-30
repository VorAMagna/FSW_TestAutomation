MXRAY_METRICS = [
    {
        # name in the original mxary repport
        "mxray_name": "Cyclomatic Complexity",

        # name inside the postprocessed mxray report
        "final_report_name": "Cyclomatic Complexity",

        # wether the metric has a limit set by us
        "has_limit": True,

        # what type of column it is
        "type": "Metric",

        # Name of the limit field (column in excel report)
        "limit_name": "CyclomaticComplexityLimit",

        # Default upper limit if there is no user defined limit
        "default_limit": 10,

        # defined offset, if the value should be chagned before postprocessed
        "user_defined_offset": 0
    },
    {
        "mxray_name": "Local Complexity",
        "final_report_name": "Mxray Complexity",
        "has_limit": True,
        "type": "Metric",
        "limit_name": "MxrayComplexityLimit",
        "default_limit": 750,
        "user_defined_offset": -7
    },
    {
        "mxray_name": "Level",
        "final_report_name": "Level",
        "has_limit": True,
        "type": "Metric",
        "limit_name": "LevelLimit",
        "default_limit": 8,
        "user_defined_offset": 0
    }
]

# FOR XLSX Report.
# The colunns will be exported in this order
MXRAY_REPORT_COLUMNS = ([
                            {
                                "mxray_name": "Path",
                                "final_report_name": "Path",
                                "type": "Info",
                            },
                            {
                                "mxray_name": "Name",
                                "final_report_name": "Name",
                                "type": "Info",
                            }
                        ] + MXRAY_METRICS +
                        [
                            {
                                "mxray_name": "MeetingID",
                                "final_report_name": "MeetingID",
                                "type": "Info",
                            }
                        ])