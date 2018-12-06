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
   version CHAR(120))"""

cursor.execute(sql)

for root, dirs, files in os.walk("/sw/apps/", topdown=True):
    m = re.search('/sw/apps.*/(.+?)/(.+?)/(bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)$', root)
    if m:
        name = m.group(1)
        version = m.group(2)
        cluster = m.group(3)
        print(name, version, cluster, root)
        key = name + version
        dirs[:] = ''
        # New insert of all table
        sql = "INSERT INTO swtree (key, name, cluster, version) VALUES (?, ?, ?, ?)"
        try:
            # Execute the SQL command
           cursor.execute(sql, (key, name,cluster, version))
           # Commit your changes in the database
           db.commit()
        except:
            # Rollback in case there is any error
           print("ERROR!\n")
           db.rollback()

# Drop table if it already exist. Remove this later.
cursor.execute("DROP TABLE IF EXISTS mftree")

# Create table as per requirement
sql = """CREATE TABLE mftree (
   key  CHAR(120),
   name  CHAR(30) NOT NULL,
   cluster CHAR(40),
   version CHAR(120))"""

cursor.execute(sql)

for root, dirs, files in os.walk("/sw/mf/", topdown=True):
    m = re.search('/sw/mf/(bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)/.*(.+?)/(.+?)$', root)
    if m:
        for f in files:
            name = m.group(3)
            version = f
            cluster = m.group(1)
            key = name + version
            print(key, name, version, cluster)
            dirs[:] = ''
            # New insert of all table
            sql = "INSERT INTO mftree (key, name, cluster, version) VALUES (?, ?, ?, ?)"
            try:
                # Execute the SQL command
               cursor.execute(sql, (key, name,cluster, version))
               # Commit your changes in the database
               db.commit()
            except:
                # Rollback in case there is any error
               print("ERROR!\n")
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

#        cursor.execute(sql, (key, name,cluster, version,))
#        sqlhits = cursor.fetchall()
#        print(sqlhits[0])
#        for row in sqlhits:
#            if version != sqlhits(4):
#                diff = "****DIFFER****"
#            else:
#                diff = ''
#            print(row, name, version, cluster, diff)

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
