from os import path


if (not path.exists("/critical_dir")):
        # Usually this should be emailed to an admin, put into an external log system...
        print("The filesystem integrity has been compromised. Please restore the directory")