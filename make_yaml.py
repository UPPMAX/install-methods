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
sql = """SELECT * FROM webpage"""

cursor.execute(sql)
rows = cursor.fetchall()
for row in rows:
    print(row)
