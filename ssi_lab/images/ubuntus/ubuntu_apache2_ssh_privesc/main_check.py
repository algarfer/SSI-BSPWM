import imp

checker = imp.load_source('file_check', '/tmp/file_check.py')
checker.check_file_integrity()
