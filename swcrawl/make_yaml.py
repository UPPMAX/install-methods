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

# Create SQL as per requirement
#sql = """SELECT * FROM swtree WHERE name='x86_64'"""
#sql = """SELECT * FROM webpage INNER JOIN swtree ON webpage.key = swtree.key GROUP BY webpage.name"""
sql = """SELECT module FROM webpage EXCEPT SELECT module FROM mftree UNION SELECT module FROM mftree EXCEPT SELECT module FROM webpage"""
sql = """SELECT module FROM webpage EXCEPT SELECT module FROM mftree UNION SELECT module FROM mftree EXCEPT SELECT module FROM webpage"""

cursor.execute(sql)
modules = cursor.fetchall()

# Create table as per requirement
cursor.execute("DROP TABLE IF EXISTS modfiles")
sql = """CREATE TABLE modfiles (module  CHAR(30) NOT NULL)"""
cursor.execute(sql)
sql = "INSERT INTO modfiles (module) VALUES (?)"
try:
    cursor.executemany(sql, (modules))
    db.commit()
except:
    print("ERROR SW!\n")
    db.rollback()

sql = """SELECT * FROM mftree WHERE module IN modfiles"""

cursor.execute(sql)
rows = cursor.fetchall()
for row in rows:
    print(row)
