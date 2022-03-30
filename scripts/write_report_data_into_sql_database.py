import MySQLdb
import sys

SQLHOST = "lanmseet1.magna.global"
SQLUSER = "lanmseet1"
SQLPW = ""
SQL_DB = "eetservices"

if __name__ == '__main__':

    # print 'Argument List:', str(sys.argv)

    if len(sys.argv) != 13:
        print("Not all required 12 arguments given ..exit")
        print(
            "Usage: python mxam_mxray_db_insert Modulname DD_Revision MDL_Revision Aborted Warning Failed Info Repaired Passed MXRay_Cyclomatic_Complexity MXRay_CC_Refued last_edited_by")
        exit

    try:
        db = MySQLdb.connect(host=SQLHOST, user=SQLUSER, passwd=SQLPW, db=SQL_DB)

        statement = "INSERT INTO software_modules_revision_overview (module_name, dd_revision, mdl_revision, mxam_aborted, mxam_warning, mxam_failed, mxam_info, mxam_repaired, mxam_passed, mxray_cyclomatic_complexity, mxray_cc_refued, last_edited_by) VALUES ('%s', %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, '%s') " % (
        sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5], sys.argv[6], sys.argv[7], sys.argv[8],
        sys.argv[9], sys.argv[10], sys.argv[11], sys.argv[12]) \
                    + "ON DUPLICATE KEY UPDATE mxam_aborted = %s, mxam_warning = %s, mxam_failed = %s, mxam_info = %s, mxam_repaired = %s, mxam_passed = %s, mxray_cyclomatic_complexity = %s, mxray_cc_refued = %s, last_edited_by = '%s'" % (
                    sys.argv[4], sys.argv[5], sys.argv[6], sys.argv[7], sys.argv[8], sys.argv[9], sys.argv[10],
                    sys.argv[11], sys.argv[12])

        print("Executing SQL STATEMENT: %s " % statement)

        db.cursor().execute(statement)
        db.commit()
        db.close()
    except Exception as e:
        print("ERROR: %s" % str(e))
