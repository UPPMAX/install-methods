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

def open_yaml_fixed(yaml_file):
    try:
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
                if not re.search(":", line_after):
                    line_after = re.sub("^  ", "  - ", line_after)
                output = output + line_after
            return output
    except Exception:
        return ''

def maketable_keywords(cursor):
    # Drop table if it already exist.
    cursor.execute("DROP TABLE IF EXISTS keywords")
    # Create table as per requirement
    sql = """CREATE TABLE keywords (
    key  CHAR(120) NOT NULL,
    keyword CHAR(120))"""
    cursor.execute(sql)

def get_list(list_file_name):
    with open(list_file_name, 'r', encoding='utf-8', errors='ignore') as lf:
        keywords = lf.read().splitlines()
    return keywords



############### Start #################

# Open database connection
db = sqlite3.connect('swdb.db')
db.text_factory = str

#Make a new table and delete the old
maketable_keywords(db)

# prepare a cursor object using cursor() method
DBcursor = db.cursor()

# Get the keywords
keywords = get_list('all_curated_keywords')
pairs = []

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
                        except Exception:
                            try:
                                key = parsed_yaml['TOOL'] + "_" + str(parsed_yaml['VERSION'])
                            except Exception:
                                print("This looks like something else: ")
                                print(parsed_yaml)
                                print(yamlstream)
                        try:
                            text_to_check = str(parsed_yaml['DESCRIPTION']) + " "
                        except Exception:
                            text_to_check = ''
                        try:
                            text_to_check = text_to_check + str(parsed_yaml['SECTION']) + " "
                        except Exception:
                                pass
                        try:
                            text_to_check = text_to_check + str(parsed_yaml['COMMON']) + " "
                        except Exception:
                                pass
                        if text_to_check == '':
                            print("\n\nThis sw has no keywords")
                            print(parsed_yaml)
                            print("____________")
                            continue
                        for kw in keywords:
                            if text_to_check != None and (kw in text_to_check.casefold() or kw.replace('-',' ') in text_to_check.casefold()):
                                pairs.append([key, kw])
                                continue
                    except yaml.YAMLError as exc:
                        print("Error reading" + yamlstream)
                        print(exc)
#It is currently looking in both live and DRAFT files so some keywords are doubled.

#Look through the keywords from Lmod and see if they are already in 'pairs'
#
#
#


for pair in pairs:
    key = pair[0]
    keyword = pair[1]
    sql = "INSERT INTO keywords (key, keyword) VALUES (?, ?)"
    print("SQLkey: ", key, "  KEYWORD: ", keyword)
    try:
        # Execute the SQL command
        DBcursor.execute(sql, (key, keyword))
        # Commit your changes in the database
        db.commit()
    except Exception:
        # Rollback in case there is any error
        print("ERROR SW!\n")
        db.rollback()
# disconnect from server
db.close()

