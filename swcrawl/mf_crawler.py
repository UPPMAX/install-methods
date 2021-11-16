#!/usr/bin/env python 
import os
import stat
import sqlite3
import re
import sys
sys.path.append('install-methods/swcrawl/packages/')
from pathlib import Path

# Open database connection
db = sqlite3.connect('swdb.db')
db.text_factory = str

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Drop table if it already exist. Remove this later.
cursor.execute("DROP TABLE IF EXISTS mftree")
cursor.execute("DROP TABLE IF EXISTS vftree")

# Create table as per requirement
# modroot is parsed from the module file if it starts with "/". It is NULL otherwise
sql = """CREATE TABLE mftree (
   key  CHAR(120),
   module  CHAR(30),
   cluster CHAR(40),
   version CHAR(120),
   fullpath CHAR(320),
   modroot CHAR(320),
   link BIT,
   readable BIT)"""

cursor.execute(sql)

# Create table as per requirement
# version is set to parsed version from .version, or None, if not parsed.
# cluster is what was in the path to the vf.
sql = """CREATE TABLE vftree (
   module  CHAR(30),
   cluster CHAR(40),
   version CHAR(120),
   fullpath CHAR(320),
   link BIT,
   readable BIT)"""

cursor.execute(sql)

def isgroupreadable(filepath):
    st = os.stat(filepath)
    return bool(st.st_mode & stat.S_IRGRP)

for root, dirs, files in os.walk("/sw/mf/", topdown=True):
    m = re.search('/sw/mf/(common|bianca|irma|isis|kalkyl|milou|rackham|snowy|terry|tintin)/.*(.+?)/(.+?)$', root)
    if m:
        for f in files:
            fullpath = root + "/" + f
            module = m.group(3)
            version = f.removesuffix('.lua')
            cluster = m.group(1)
            key = module + "_" + version
            readable = None
            link = None
            modroot = None
            try:
                readable = isgroupreadable(fullpath)
            except:
                readable = None

            print(module, cluster, version, fullpath, link, readable)
            if not readable:
                if f == ".version":
                    sql = "INSERT INTO vftree (module, cluster, version, fullpath, link, readable) VALUES (?, ?, ?, ?, ?, ?)"
                    cursor.execute(sql, (module, cluster, version, fullpath, link, readable))
                else:
                    sql = "INSERT INTO mftree (key, module, cluster, version, fullpath, modroot, link, readable) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
                    cursor.execute(sql, (key, module, cluster, version, fullpath, modroot, link, readable))
                db.commit()
                continue

            link = Path(fullpath).is_symlink()
            if link:
                linktarget = root + "/" + os.readlink(fullpath)
                if not os.path.exists(linktarget):
                    link = None 

            if f == ".version":
                ###parser and into vf
                ## set ModulesVersion      "3.8-0"
                with open(fullpath) as search:
                    for line in search:
                        line = line.rstrip()
                        try:
                            st, mv, version = line.split()
                        except:
                            continue
                        if ("#" not in st and "set" in st and "ModulesVersion" in mv): 
                            version = version.strip("'").strip('"')
                            break
                sql = "INSERT INTO vftree (module, cluster, version, fullpath, link, readable) VALUES (?, ?, ?, ?, ?, ?)"
                try:
                    # Execute the SQL command
                   cursor.execute(sql, (module, cluster, version, fullpath, link, readable))
                   # Commit your changes in the database
                   db.commit()
                except:
                    # Rollback in case there is any error
                   print("ERROR VF!\n")
                   db.rollback()
                continue

            if not link is None:
                with open(fullpath, encoding="latin-1", errors="surrogateescape") as search:
                    for line in search:
                        line = line.rstrip()
                        try:
                            st, mr, mod = line.split()
                        except:
                            continue
                        if ("set" in st and "modroot" in mr): 
                            modroot = mod
                            break
                        try:
                            loc, mr, eq, mod = line.split()
                        except:
                            continue
                        if ("local" in loc and "modroot" in mr): 
                            modroot = mod
                            break
            # print(key, module, cluster, version, fullpath, modroot, link, readable)
            # dirs[:] = ''
            # New insert of all table
            sql = "INSERT INTO mftree (key, module, cluster, version, fullpath, modroot, link, readable) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            try:
                # Execute the SQL command
               cursor.execute(sql, (key, module, cluster, version, fullpath, modroot, link, readable))
               # Commit your changes in the database
               db.commit()
            except:
                # Rollback in case there is any error
               print("ERROR MF!\n")
               db.rollback()
               # Now insert into the vftree

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
