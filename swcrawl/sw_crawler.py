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

sql = "SELECT * FROM software"
cursor.execute(sql)
htmltable = cursor.fetchall()

def isex(filepath):
    st = os.stat(filepath)
    return bool(st.st_mode & stat.S_IXOTH)

for root, dirs, files in os.walk("/sw/apps/", topdown=True):
    m = re.search('/sw/apps.*/(.+?)/(.+?)/(rackham|milou|bianca|irma|snowy)$', root)
    if m:
        name = m.group(1)
        version = m.group(2)
        cluster = m.group(3)
        print(name, version, cluster, root)
        dirs[:] = ''
        sql = "SELECT * FROM software WHERE name = ?"
        cursor.execute(sql, (name,))
        sqlhits = cursor.fetchall()
        print(sqlhits[0])
        for row in sqlhits:
            if version != sqlhits(4):
                diff = "****DIFFER****"
            else:
                diff = ''
            print(row, name, version, cluster, diff)

# Crawl and collect path, mf and format for the database. update for skillnader i databasen. 
# Set the insw and inmf parameters of the database or print them

# disconnect from server
db.close()

##########################################################################################
db = sqlite3.connect('swdb.db')

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Drop table if it already exist. Remove this later.
cursor.execute("DROP TABLE IF EXISTS software")

# Create table as per requirement
sql = """CREATE TABLE software (
   web  CHAR(120),
   name  CHAR(30) NOT NULL,
   module CHAR(30),
   cluster CHAR(40),
   version CHAR(120),
   license CHAR(120),
   category CHAR(120))"""

cursor.execute(sql)

# New insert of all table
sql = "INSERT INTO software (web, name, module, cluster, version, license, category) VALUES (?, ?, ?, ?, ?, ?, ?)"

try:
   # Execute the SQL command
#   print(sql, parser.table)
   cursor.executemany(sql, parser.table)
   # Commit your changes in the database
   db.commit()
except:
   # Rollback in case there is any error
   print("ERROR!\n")
   db.rollback()

# disconnect from server
db.close()

