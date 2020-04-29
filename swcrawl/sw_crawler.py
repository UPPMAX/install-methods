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
cursor.execute("DROP TABLE IF EXISTS swtree")

# Create table as per requirement
sql = """CREATE TABLE swtree (
   key  CHAR(120),
   name  CHAR(30) NOT NULL,
   cluster CHAR(40),
   version CHAR(120),
   path CHAR(320))"""

cursor.execute(sql)

for root, dirs, files in os.walk("/sw/", topdown=True):
    if re.search('/sw/.+/src/', root):
        continue
    # What if the following pattern is followed: /sw/apps/OpenFOAM/rackham/ThirdParty-2.4.0/b
    p = re.search('/sw/.+/(.+?)/(bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)/(.+?)/$', root)
    if p:
        path = root
        version = p.group(3)
        cluster = p.group(2)
        name = p.group(1)
        key = name + "_" + version
        print("P:", key, name, version, cluster, path)
    # Standard path is /sw/<category>/<sw_name>/<version>/<cluster>/ Thus the matching below.
    m = re.search('/sw/.+/(.+?)/(.+?)/(bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)$', root)
    if m:
        path = root
        version = m.group(2)
        cluster = m.group(3)
        if (m.group(1) == "x86_64" or m.group(1) == "build") and "old" in m.group(2):
            m = re.search('/sw/.+/(.+?)/.+/(.+?)/(.+?)/(bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)$', root)
            version = m.group(2) + m.group(3)
            cluster = m.group(4)
#        elif (m.group(1) == "PLplot" and "old" in m.group(2)):
#            m = re.search('/sw/.+/(.+?)/(.+?)/(bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)$', root)
#            version = m.group(2)
#            cluster = m.group(3)
        elif (m.group(1) == "x86_64" or m.group(1) == "build"):
            m = re.search('/sw/.+/(.+?)/.+/(.+?)/(bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)$', root)
            version = m.group(2)
            cluster = m.group(3)
        elif ("old" in m.group(2) or m.group(2) == "gcc") and (m.group(1) != "PLplot" and m.group(1) != "piper"):
            m = re.search('/sw/.+/(.+?)/(.+?)/(.+?)/(bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)$', root)
            version = m.group(2) + m.group(3)
            cluster = m.group(4)
        elif (m.group(1) == "matlab"):
            m = re.search('/sw/.+/(.+?)/.+?/(.+?)/.+/(bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)$', root)
            version = m.group(2)
            cluster = m.group(3)
        name = m.group(1)
        key = name + "_" + version
        print("M", key, name, version, cluster, path)
        dirs[:] = ''
        # New insert of all table
        sql = "INSERT INTO swtree (key, name, cluster, version, path) VALUES (?, ?, ?, ?, ?)"
        try:
            # Execute the SQL command
           cursor.execute(sql, (key, name, cluster, version, path))
           # Commit your changes in the database
           db.commit()
        except:
            # Rollback in case there is any error
           print("ERROR SW!\n")
           db.rollback()

# disconnect from server
db.close()

