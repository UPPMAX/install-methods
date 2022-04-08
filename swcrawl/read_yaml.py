#!/usr/bin/env python 
import os
import stat
import sqlite3
import re
import yaml
import pwd


def walklevel(path, depth = 1):
    """It works just like os.walk, but you can pass it a level parameter
       that indicates how deep the recursion will go.
       If depth is 1, the current directory is listed.
       If depth is 0, nothing is returned.
       If depth is -1 (or less than 0), the full depth is walked.
    """
    if depth < 0:
        for root, dirs, files in os.walk(path):
            yield root, dirs[:], files
        return
    elif depth == 0:
        return

    base_depth = path.rstrip(os.path.sep).count(os.path.sep)
    for root, dirs, files in os.walk(path):
        #From 2nd iter, yield gives the generator for the objects root, dirs and files, not the objects
        yield root, dirs[:], files
        cur_depth = root.count(os.path.sep)
        #So if depth too big it removes dirs and they won't be generated and walking is over
        if base_depth + depth <= cur_depth:
            del dirs[:]

# Open database connection
db = sqlite3.connect('swdb.db')
db.text_factory = str

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Drop table if it already exist. Remove this later.
cursor.execute("DROP TABLE IF EXISTS yamlfiles")

# Create table as per requirement
sql = """CREATE TABLE yamlfiles (
   key  CHAR(120),
   yamlfilename  CHAR(30) NOT NULL,
   path CHAR(320),
   creator  CHAR(30) NOT NULL)"""

cursor.execute(sql)

for root, dirs, files in walklevel("/sw/", 3):
    if re.search('/sw/.+/src/', root):
        continue
    # Standard path is /sw/<category>/<sw_name>/<yamlfile> Thus the matching below.
    for file in files:
        m = re.search('(.*yaml)', file)
        if m:
            if (m.group(1)):
                path = root
                yamlfile = root + '/' + m.group(1)
                creator = pwd.getpwuid(os.stat(yamlfile).st_uid).pw_name
                print(creator)
                if os.path.isfile(yamlfile) and os.access(yamlfile, os.R_OK):
                    with open(yamlfile, 'r') as yamlstream:
                        try:
                            parsed_yaml=yaml.safe_load(yamlstream)
                            for y in parsed_yaml:
                                print(y)
                            print(parsed_yaml)
                        except yaml.YAMLError as exc:
                            print(exc)
            # New insert  into chksum table to keep track of yaml files
            sql = "INSERT INTO yamlfiles (key, yamlfilename, path, creator) VALUES (?, ?, ?, ?)"
            try:
                # Execute the SQL command
               cursor.execute(sql, (key, yamlfilename, path, creator))
               # Commit your changes in the database
               db.commit()
            except:
                # Rollback in case there is any error
               print("ERROR SW!\n")
               db.rollback()

# disconnect from server
db.close()

