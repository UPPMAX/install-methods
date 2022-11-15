#!/usr/bin/env python 
import os
import stat
import sqlite3
import re
import yaml
import pwd
import hashlib
import subprocess

def walklevel(path, depth = 1):
    """It works just like os.walk, but you can pass it a level parameter
       that indicates how deep the recursion will go.
       If depth is 1, the current directory is listed.
       If depth is 0, nothing is returned.
       If depth is -1 (or less than 0), the full depth is walked.
    """
    if depth < 0:
        for root, dirs, files in os.walk(path, followlinks=True):
            yield root, dirs[:], files
        return
    elif depth == 0:
        return

    base_depth = path.rstrip(os.path.sep).count(os.path.sep)
    for root, dirs, files in os.walk(path, followlinks=True):
        #From 2nd iter, yield gives the generator for the objects root, dirs and files, not the objects
        yield root, dirs[:], files
        cur_depth = root.count(os.path.sep)
        #So if depth too big it removes dirs and they won't be generated and walking is over
        if base_depth + depth <= cur_depth:
            del dirs[:]

def maketable_yamlfiles(cursor):
    # Drop table if it already exist.
    cursor.execute("DROP TABLE IF EXISTS yamlfiles")
    # Create table as per requirement
    sql = """CREATE TABLE yamlfiles (
        key  CHAR(120),
       path CHAR(320),
       creator  CHAR(30) NOT NULL,
       md5  CHAR(120) NOT NULL)"""
    cursor.execute(sql)

def open_yaml_fixed(yaml_file):
    with open(yaml_file, 'r', encoding='utf-8', errors='ignore') as yamlstream:
        try:
            lines = yamlstream.readlines()
        except:
            print(yaml_file)
        output = ''
        for line in lines:
            line_after = re.sub("^- ", "  ", line)
            line_after = re.sub("\'", "\"", line_after)
            line_after = re.sub("^    - LOCAL", "  LOCAL", line_after)
            line_after = re.sub("^    - COMMON", "  COMMON", line_after)
            line_after = re.sub(":", ": ", line_after, 1)
            line_after = re.sub(":  ", ": ", line_after, 1)
            line_after = re.sub("(^.+?): (.+\s+.+)", r"\1: '\2'", line_after, 1)
            output = output + line_after
        #print(output)
        return output

# Open database connection
db = sqlite3.connect('swdb.db')
db.text_factory = str

# prepare a cursor object using cursor() method
DBcursor = db.cursor()

for root, dirs, files in walklevel("/sw/", 3):
    if re.search('/sw/.+/src/', root):
        continue
    if re.search('/sw/links/', root):
        continue
    if re.search('/sw/\.snapshot', root):
        continue
    # Standard path is /sw/<category>/<sw_name>/<yamlfile> Thus the matching below.
    for file in files:
        m = re.search('(.*\.yaml)', file)
        if m:
            if (m.group(1)):
                path = root + '/' + m.group(1)
                if os.path.isfile(path) and os.access(path, os.R_OK):
                    yamlstream = open_yaml_fixed(path)
                    try:
                        parsed_yaml=yaml.safe_load(yamlstream)
                        try:
                            key = parsed_yaml['SQLKEY']
                        except:
                            try:
                                key = parsed_yaml['TOOL'] + "_" + str(parsed_yaml['VERSION'])
                            except:
                                print("This looks like something else: ")
                                print(parsed_yaml)
                                print(yamlstream)
                    except yaml.YAMLError as exc:
                        print(exc)
        #Now we have SQL_KEY
        



            with open(filename, 'r', encoding='utf-8', errors='ignore') as rawdatafile:
                for line in rawdatafile:
                    if "DESCRIPTION" in line or "SECTION" in line or "COMMON" in line:
                        try:
                            print(line.split(":",1)[1], file = outfile)
                        except:
                            continue



                sql = "INSERT INTO keywords (key, word) VALUES (?, ?)"
                print(key, word)
                try:
                    # Execute the SQL command
                    DBcursor.execute(sql, (key, word))
                    # Commit your changes in the database
                    db.commit()
                except:
                    # Rollback in case there is any error
                    print("ERROR SW!\n")
                    db.rollback()

# disconnect from server
db.close()

