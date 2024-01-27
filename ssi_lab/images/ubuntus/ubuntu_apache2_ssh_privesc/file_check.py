from os import path


def check_file_integrity ():
	if (not path.isfile("/bin/ls")):
        	# Usually this should be emailed to an admin, put into an external log system...
	        print("A critical executable is missing!")
	else:
		print("All checks OK")

