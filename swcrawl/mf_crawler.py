#!/usr/bin/env python 
import os
import stat
import sqlite3
import re

# Open database connection
db = sqlite3.connect('swdb.db')
db.text_factory = str

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Drop table if it already exist. Remove this later.
cursor.execute("DROP TABLE IF EXISTS mftree")

# Create table as per requirement
sql = """CREATE TABLE mftree (
   key  CHAR(120),
   module  CHAR(30) NOT NULL,
   cluster CHAR(40),
   version CHAR(120),
   path CHAR(320))"""

cursor.execute(sql)

for root, dirs, files in os.walk("/sw/mf/", topdown=True):
    print(files)
    m = re.search('/sw/mf/(common|bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)/.*(.+?)/(.+?)$', root)
    if m:
        for f in files:
            module = m.group(3)
            version = f
            cluster = m.group(1)
            key = module + "_" + version
            print(key, module, version, cluster, root)
            dirs[:] = ''
            # New insert of all table
            sql = "INSERT INTO mftree (key, module, cluster, version, path) VALUES (?, ?, ?, ?, ?)"
            try:
                # Execute the SQL command
               cursor.execute(sql, (key, module,cluster, version, root))
               # Commit your changes in the database
               db.commit()
            except:
                # Rollback in case there is any error
               print("ERROR MF!\n")
               db.rollback()

#sql = "SELECT swtree.* FROM swtree NATURAL LEFT JOIN mftree WHERE mftree.key IS NULL;"
#try:
#    for i in cursor.execute(sql).fetchall():
#        print i [0]
#except:
#    print("ERROR!\n")
#
#sql = "SELECT mftree.* FROM mftree NATURAL LEFT JOIN swtree WHERE swtree.key IS NULL;"
#try:
#    for i in cursor.execute(sql).fetchall():
#        print i [0]
#except:
#    print("ERROR!\n")
#
# disconnect from server
db.close()

##########################################################################################
