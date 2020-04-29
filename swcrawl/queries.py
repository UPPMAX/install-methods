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
