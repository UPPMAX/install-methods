#!/usr/bin/env python3
from html.parser import HTMLParser
from html.entities import name2codepoint
import sqlite3

class MyHTMLParser(HTMLParser):
    def print_sw(self, html):
        self.label = ["key", "web", "name", "module", "cluster", "version", "license", "category"]
        self.current = {"key":"", "web":"", "name":"", "module":"", "cluster":"", "version":"", "license":"", "category":""}
        self.cat = 0
        self.count = 1
        self.sw_index = 0
        self.table = []
        self.feed(html)

    def handle_starttag(self, tag, attrs):
        if tag == "tr":
            self.count = 1
        elif tag == "td":
            self.sw_index += 1
            self.count += 1
        elif tag == "th":
            self.cat = 1
            return
        self.cat = 0
        for attr in attrs:
            if self.count == 2:
                self.current[self.label[1]] += attr[1]

    def handle_endtag(self, tag):
        if tag == "tr":
            self.count = 1
            version = self.current[self.label[5]].split(",")
            for ver in version:
                ver = ' '.join(ver.split())
                self.current[self.label[0]] = self.current[self.label[2]] + ver.split(" ")[0]
                self.current[self.label[5]] = ver
                tab = []
                for x in range(0, 8):
                    tab.append(self.current[self.label[x]])
                self.table.append(tab)
            self.current = {"key":"", "web":"", "name":"", "module":"", "cluster":"", "version":"", "license":"", "category":self.current["category"]}

    def handle_data(self, data):
        if not data.strip():
            return
        if self.cat == 1:
            if data not in ["Module", "Version", "Cluster", "License"]:
                self.current["category"] = data
            self.cat = 0
            return
        self.current[self.label[self.count]] += data

parser = MyHTMLParser()

with open('website.raw') as f:
    parser.print_sw(f.read())

# Open database connection
db = sqlite3.connect('swdb.db')

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Drop table if it already exist. Remove this later.
cursor.execute("DROP TABLE IF EXISTS webpage")

# Create table as per requirement
sql = """CREATE TABLE webpage (
   key CHAR(120) NOT NULL,
   web  CHAR(120),
   name  CHAR(30) NOT NULL,
   module CHAR(30),  
   cluster CHAR(40),
   version CHAR(120),
   license CHAR(120),
   category CHAR(120))"""

cursor.execute(sql)

# New insert of all table
sql = "INSERT INTO webpage (key, web, name, module, cluster, version, license, category) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"

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

#Lägg till kategori, d v s hantera th som 7:e fältet
