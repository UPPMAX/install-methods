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
    yaml_data = yaml.dump(data, sort_keys=False, default_flow_style=False)
    
    # Close the database connection
    conn.close()
    
    return yaml_data

def find_path_from_tool(TOOL):
    for root, dirs, files in walklevel("/sw/", 4):
        for dir in dirs:
            if re.search(".*sw/apps/bioinfo.*", root):
                continue
            elif fnmatch.fnmatch(dir, TOOL):
                ans = root + "/" + dir
                break
        else:
            continue
        break
    return ans

def fetch_data_to_dict(db_path, query):
    if not os.path.exists(db_path):
        print("swdb.db not found", file=sys.stderr)
        exit(1)
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute(query)
    columns = [description[0] for description in cursor.description]
    rows = cursor.fetchall()
    data = []
    for row in rows:
        row_dict = {columns[i]: convert_to_list_if_needed(columns[i], row[i]) for i in range(len(columns))}
        data.append(row_dict)
    conn.close()
    return data

def find_all_MR_from_path(PATH):
    healthy = {}
    for root, dirs, files in walklevel(PATH, 1):
        for d in dirs:
            VERSION = d
            makeroomfile = PATH + "/makeroom_" + TOOL + "_" + d + ".sh"
            try: 
                yamlfrommakeroom = yaml.safe_load(showmakeroomyaml(makeroomfile))
                healthy[d] = makeroomfile
            except:
                continue
    return healthy

def find_versions_from_lmod(TOOL):
    LMOD = subprocess.run("module spider " + TOOL, stderr=subprocess.PIPE, shell=True, universal_newlines=True)
    part = re.findall("Versions:(.*?)--------------", str(LMOD), re.DOTALL)
    findstr = TOOL + '/(\S+?)\\\\\\\\n'
    versions = re.findall(findstr, str(part))
    return versions


def print_makeroom(makeroomfile):
    if os.path.isfile(makeroomfile):
        print("")
        print("---------makeroomfile-----------")
        print(makeroomfile)
        print("---------content-----------")
        print(showmakeroomyaml(makeroomfile))
    else:
        print(makeroomfile + " does not exist. Should it?")

def check_makeroom(makeroomfile, mf):                    
    try: 
        yamlfrommakeroom = yaml.safe_load(showmakeroomyaml(makeroomfile))
    except:
        print("ERROR: loading yaml from makeroom " + makeroomfile)
    if yamlfrommakeroom['TOOL'] != TOOL:
        print("ERROR: makeroom tool: " + yamlfrommakeroom['TOOL'] + " != input TOOL: " + TOOL)
    if yamlfrommakeroom['LOCAL'] != mf:
        print("ERROR: makeroom LOCAL mf path" + yamlfrommakeroom['LOCAL'] + " != deduced path: /" + deduced_mf_path)
    if yamlfrommakeroom['VERSION'] != VERSION:
        print("ERROR: makeroom version: " + yamlfrommakeroom['VERSION'] + " != input VERSION: " + VERSION)
    return yamlfrommakeroom
        

################### Main ####################

# Read options
parser = OptionParser()
parser.add_option("-t", action="store", type="string", dest="TOOL")
parser.add_option("-v", action="store", type="string", dest="VERSION")
parser.add_option("-p", action="store", type="string", dest="PATH")
parser.add_option("-s", action="store", type="string", dest="SQL_FIELD")
(options, args) = parser.parse_args()
OK = 0
TOOL = options.TOOL
VERSION = options.VERSION
PATH = options.PATH
SQL_FIELD = options.SQL_FIELD
if PATH == None and TOOL == None:
    print("Too few parameters!")
    exit(1)

yml = ruamel.yaml.YAML()
yml.preserve_quotes = True
yml.explicit_start = True

#Clean path
if PATH:
    PATH = "/" + "/".join(list(filter(None, PATH.split("/"))))

if TOOL == None:
    TOOL = os.path.basename(PATH)

if PATH == None:
    PATH = find_path_from_tool(TOOL)

#Check makeroom against input
if VERSION != None:
    makeroomfile = PATH + "/makeroom_" + TOOL + "_" + VERSION + ".sh"
    deduced_mf_path = PATH + "/mf/" + VERSION
    dict_from_makeroom_yaml = check_makeroom(makeroomfile, deduced_mf_path)
    if dict_from_makeroom_yaml is None:
        OK = 0
        print_makeroom(makeroomfile)
    else:
        OK = 1
else:
    makeroomfiles = find_all_MR_from_path(PATH)
    for VERSION in makeroomfiles:
        deduced_mf_path = PATH + "/mf/" + VERSION
        dict_from_makeroom_yaml = check_makeroom(makeroomfiles[VERSION], deduced_mf_path)
        if dict_from_makeroom_yaml is None:
            OK = 0
            print_makeroom(makeroomfiles[VERSION])
        else:
            OK = 1

#Check SQL database against LMOD versions
db_path = '/sw/infrastructure/swdb.db' 
versions = find_versions_from_lmod(TOOL)
SQL_OUTPUT = {}
for VER in versions:
    sql = "SELECT * FROM yamlfiles WHERE yamlfiles.TOOL=\'" + TOOL + "\' AND yamlfiles.VERSION=\'" + VER + "\'"
    SQL_OUTPUT[VER] = fetch_data_to_dict(db_path, sql)

for v in SQL_OUTPUT:
    print(SQL_OUTPUT[v])





if TOOL != None and VERSION != None and SQL_FIELD != None:
    sql = "SELECT " + SQL_FIELD + " FROM yamlfiles WHERE yamlfiles.TOOL=\'" + TOOL + "\' AND yamlfiles.VERSION=\'" + VERSION + "\'"
elif TOOL != None and SQL_FIELD != None:
    sql = "SELECT " + SQL_FIELD + " FROM yamlfiles WHERE yamlfiles.TOOL=\'" + TOOL + "\'"
elif TOOL == None and SQL_FIELD != None:
    TOOL = os.path.basename(PATH)
    sql = "SELECT " + SQL_FIELD + " FROM yamlfiles WHERE yamlfiles.path LIKE \'" + PATH + "%\'"

if SQL_FIELD != None:
    db_path = '/sw/infrastructure/swdb.db' 
    yaml_output = fetch_data_to_yaml(db_path, sql)
    print("")
    print("------------------sql-query----------------")
    print(sql)
    print("----------------sql-output----------------")
    print(yaml_output)
