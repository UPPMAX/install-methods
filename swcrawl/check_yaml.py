#!/usr/bin/env python 
import os
import sys
import stat
import re
import yaml
import pwd
import subprocess
import sqlite3
import ruamel.yaml
from optparse import OptionParser
import fnmatch
import ast

def removeDuplicates(lst):
    return list(set([i for i in lst]))

def walklevel(path, depth = 1):
    """It works just like os.walk, but you can pass it a level parameter
       that indicates how deep the recursion will go.
       If depth is 1, the current directory is listed.
       If depth is 0, nothing is returned.
       If depth is -1 (or less than 0), the full depth is walked.
    """
    if depth < 0:
        for root, dirs, files in os.walk(path, followlinks=False):
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
        #I think the -1 is needed to make 1 list just the current dir.
        if base_depth + depth -1 <= cur_depth:
            del dirs[:]

def showmakeroomyaml(makeroomfile): 
    with open(makeroomfile, 'r') as infile:
        e = infile.read()
        yamlpath = re.findall("(/.*yaml)", e)[0]
        e1 = re.findall("EOF4(.*)?EOF4", e, re.DOTALL)
        yamlpartofmakeroom = e1[0]
        yamlmr0 = (re.sub("^.+LOCAL:", "  LOCAL:", yamlpartofmakeroom, flags=re.M))
        yamlmr0p5 = (re.sub("^.+COMMON:", "  COMMON:", yamlmr0, flags=re.M))
        yamlmr1 = (re.sub("^- ", "  ", yamlmr0p5, flags=re.M))
        yamlmr1p5 = yamlmr1.replace("\\", "")
        yamlmr2 = (re.sub(r'(^\s+\S+?):(\S+?)', r"\1: \2", yamlmr1p5, flags=re.M))
        yamlmr3 = (re.sub(r'(^\s+- \S+?):(\S+?)', r"\1: \2", yamlmr2, flags=re.M))
        yamlmr4 = (re.sub(r'(\S+?: )(.*:.*)', r'\1"\2"', yamlmr3, flags=re.M))
        yamlmr = (re.sub(r"(\S+?: )(.+'.+)", r'\1"\2"', yamlmr4, flags=re.M))
        return yamlmr

def convert_to_list_if_needed(key, value):
    if key in ["CLUSTER", "KEYWORDS"]:
        if isinstance(value, str) and ' ' in value:
            return value.split()
    return value

def fetch_data_to_yaml(db_path, query):
    # Open database connection
    if not os.path.exists(db_path):
        print("swdb.db not found", file=sys.stderr)
        exit(1)

    # Connect to the SQLite database
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    # Execute the query
    cursor.execute(query)
    columns = [description[0] for description in cursor.description]
    rows = cursor.fetchall()
    
    # Construct the data as a list of dictionaries
    data = []
    for row in rows:
        row_dict = {columns[i]: convert_to_list_if_needed(columns[i], row[i]) for i in range(len(columns))}
        data.append(row_dict)
    
    # Convert the data to YAML format
    yaml_data = yaml.dump(data, sort_keys=False)
    
    # Close the database connection
    conn.close()
    
    return yaml_data

################### Main ####################

# Read options
parser = OptionParser()
parser.add_option("-t", action="store", type="string", dest="TOOL")
parser.add_option("-v", action="store", type="string", dest="VERSION")
parser.add_option("-p", action="store", type="string", dest="PATH")
parser.add_option("-s", action="store", type="string", dest="SQL_FIELD")
(options, args) = parser.parse_args()
TOOL = options.TOOL
VERSION = options.VERSION
PATH = options.PATH
SQL_FIELD = options.SQL_FIELD
if PATH == None and TOOL == None:
    print("Too few parameters!")
    exit(1)

if TOOL != None:
    print("TOOL: " + TOOL)
if PATH != None:
    print("PATH: " + PATH)
if VERSION != None:
    print("VERSION: " + VERSION)

yml = ruamel.yaml.YAML()
yml.preserve_quotes = True
yml.explicit_start = True

if TOOL != None and VERSION != None:
    sql = "SELECT " + SQL_FIELD + " FROM yamlfiles WHERE yamlfiles.TOOL=\'" + TOOL + "\' AND yamlfiles.VERSION=\'" + VERSION + "\'"
elif TOOL != None:
    sql = "SELECT " + SQL_FIELD + " FROM yamlfiles WHERE yamlfiles.TOOL=\'" + TOOL + "\'"
elif TOOL == None:
    TOOL = os.path.basename(PATH)
    sql = "SELECT " + SQL_FIELD + " FROM yamlfiles WHERE yamlfiles.path LIKE \'" + PATH + "%\'"

#<======================================================
#Hitta rätt path nedan

if PATH == None:
    for root, dirs, files in walklevel("/sw/", 4):
        for dir in dirs:
            if fnmatch.fnmatch(dir, TOOL):
                PATH = root + "/" + dir
                break
        else:
            continue
        break

if VERSION != None:
    makeroomfile = PATH + "/makeroom_" + TOOL + "_" + VERSION + ".sh"
    if os.path.isfile(makeroomfile):
        print(makeroomfile)
        print(showmakeroomyaml(makeroomfile))
    if TOOL != None:
        print("TOOL: " + TOOL)
    if PATH != None:
        print("PATH: " + PATH)
    if VERSION != None:
        print("VERSION: " + VERSION)
else:
    for root, dirs, files in walklevel(PATH, 1):
        for d in dirs:
            VERSION = d
            makeroomfile = PATH + "/makeroom_" + TOOL + "_" + d + ".sh"
            if os.path.isfile(makeroomfile):
                print("")
                print("---------makeroomfile-----------")
                print(makeroomfile)
                print("---------content-----------")
                print(showmakeroomyaml(makeroomfile))
            else:
                print(makeroomfile + " does not exist. Should it?")
            if TOOL != None:
                print("TOOL: " + TOOL)
            if PATH != None:
                print("PATH: " + PATH)
            if VERSION != None:
                print("VERSION: " + VERSION)

db_path = '/sw/infrastructure/swdb.db' 
yaml_output = fetch_data_to_yaml(db_path, sql)
print("")
print("------------------sql-query----------------")
print(sql)
print("----------------sql-output----------------")
print(yaml_output)
