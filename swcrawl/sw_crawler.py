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
    print(root)
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
        print(key, name, version, cluster, path)
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

sql = "SELECT swtree.* FROM swtree NATURAL LEFT JOIN mftree WHERE mftree.key IS NULL;"
try:
    for i in cursor.execute(sql).fetchall():
        print i [0]
except:
    print("ERROR!\n")

sql = "SELECT mftree.* FROM mftree NATURAL LEFT JOIN swtree WHERE swtree.key IS NULL;"
try:
    for i in cursor.execute(sql).fetchall():
        print i [0]
except:
    print("ERROR!\n")

#        cursor.execute(sql, (key, module,cluster, version,))
#        sqlhits = cursor.fetchall()
#        print(sqlhits[0])
#        for row in sqlhits:
#            if version != sqlhits(4):
#                diff = "****DIFFER****"
#            else:
#                diff = ''
#            print(row, module, version, cluster, diff)

# Crawl and collect path, mf and format for the database. update for skillnader i databasen. 
# Set the insw and inmf parameters of the database or print them

# disconnect from server
db.close()

##########################################################################################

#sql = "SELECT * FROM software"
#cursor.execute(sql)
#htmltable = cursor.fetchall()
#
#def isex(filepath):
#    st = os.stat(filepath)
#    return bool(st.st_mode & stat.S_IXOTH)
#
