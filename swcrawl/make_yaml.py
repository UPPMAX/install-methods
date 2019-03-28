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
sql = """SELECT * FROM swtree WHERE name='x86_64'"""
#sql = """SELECT * FROM webpage INNER JOIN swtree ON webpage.key = swtree.key GROUP BY webpage.name"""

cursor.execute(sql)
rows = cursor.fetchall()
for row in rows:
    print(row)
