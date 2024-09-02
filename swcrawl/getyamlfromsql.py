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
yml = ruamel.yaml.YAML()
yml.preserve_quotes = True
yml.explicit_start = True

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
        if base_depth + depth <= cur_depth:
            del dirs[:]


################### Main ####################

# Open database connection
if not os.path.exists('/sw/infrastructure/swdb.db'):
    print("swdb.db not found", file=sys.stderr)
    exit(1)

db = sqlite3.connect('/sw/infrastructure/swdb.db')
db.text_factory = str

# prepare a cursor object using cursor() method
cursor = db.cursor()

sql = "SELECT * FROM yamlfiles"
cursor.execute(sql)
field_names = [i[0] for i in cursor.description]
database = {}
result = [dict(zip(field_names,row)) for row in cursor.fetchall()]
for yamlfile in result:
    name = os.path.basename(yamlfile["path"])
    base = os.path.dirname(yamlfile["path"])
    if yamlfile["CLUSTER"] is not None:
        yamlfile["CLUSTER"] = yamlfile["CLUSTER"].split()
    if yamlfile["KEYWORDS"] is not None:
        yamlfile["KEYWORDS"] = yamlfile["KEYWORDS"].split()
    try:
        sqlkey = yamlfile["TOOL"] + "_" + yamlfile["VERSION"]
    except:
        print(yamlfile)
    for i in yamlfile:
        print(i, yamlfile[i])
    file_name = name.replace("DRAFT.","")
    file_name = file_name.replace(".yaml","")
    content_name = yamlfile["TOOL"] + "-" + yamlfile["VERSION"]
    match=(re.search("-", file_name))
    if match is not None:
        for i in match.span():
            makeroomtest = base + "/makeroom_" + file_name[:i] + "_" + file_name[i+1:] + ".sh"
            print(makeroomtest)
            if os.path.isfile(makeroomtest):
                makeroomfile = makeroomtest
                break
    else:
        makeroomfile = base + "/makeroom_" + file_name + ".sh"
        if not os.path.exists(makeroomfile):
            break
    if (file_name!=content_name):
        print(yamlfile["path"] + " contains info from " + content_name)
        print(file_name, "   ", content_name)
        try: 
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
                with open("TMPFILE", 'w') as outfile:
                    print(yamlmr, file=outfile)
                with open("TMPFILE", 'r') as infile:
                    print(yamlfile)
                    print(yamlpartofmakeroom)
                try:
                    yamlfile = yml.load(yamlmr)
                except yaml.YAMLError as exc:
                    if hasattr(exc, 'problem_mark'):
                        if exc.context != None:
                            print ('  parser says\n' + str(exc.problem_mark) + '\n  ' +
                                str(exc.problem) + ' ' + str(exc.context) +
                                '\nPlease correct data and retry.')
                        else:
                            print ('  parser says\n' + str(exc.problem_mark) + '\n  ' +
                                str(exc.problem) + '\nPlease correct data and retry.')
                    else:
                        print(makeroomfile + " not working")
                    print("--------------------yamlmr------------------------")
                    print(yamlmr)
                    print("--------------------path------------------------")
                    print(yamlpath)
                    print("---------------------yamlfile------------------------------")
                    print(yamlfile)
                    print("---------------------end------------------------------")
                yamlfile["path"] = yamlpath
                try:
                    sqlkey = yamlfile["TOOL"] + "_" + str(yamlfile["VERSION"])
                except:
                    print("################### " + sqlkey + " ##########################")
                print(yamlfile["TOOL"])
                database[sqlkey] = yamlfile
        except:
            print("################### " + "No makeroomfile" + " ##########################")
            print(yamlfile["path"])
    else:
        try:
            yamlfile["path"] = yamlfile["path"].replace("DRAFT.","")
        except:
            pass
        database[sqlkey] = yamlfile


#Populera databasen även med fel, så länge de har rätt sqlkey.
#Kolla efter en makeroomfil, där finns hela YAML med ibland, men i hemskt format.

for key in database:
    name = os.path.basename(database[key]["path"])
    testfil="/home/jonass/uppmax/install-methods/swcrawl/test/" + name
    #testfil=database[key]["path"]
    try:
        content_name = database[key]["TOOL"] + "-" + str(database[key]["VERSION"])
    except:
        print("ERROR!" + database[key])
        next
    file_name = name.replace("DRAFT.","")
    file_name = file_name.replace(".yaml","")
    if (file_name!=content_name):
        print(database[key]["path"] + "    NOT CONTAINING    " + content_name)
        match=(re.search("-", file_name))
        if match is not None:
            for i in match.span():
                sqltest = file_name[:i] + "_" + file_name[i+1:]
                if sqltest in database:
                    print("SQL KEY " + sqlkey + " SET TO " + sqltest + " for " + database[key]["path"])
                    sqlkey = sqltest
                    break
                else:
                    #print(sqltest + " " + i)
                    sqlkey = key
        else:
            sqlkey = key
            print("                  " + name + " " + sqlkey)
    try:
        thefile = database[sqlkey]
        thefile["path"] = database[key]["path"]
        with open(testfil, 'w') as output:
            yml.dump(thefile, output)
            print("Printing to " + testfil)
    except:
        print("File " + database[key]["path"] + " not in database under key: ." + sqlkey + "!")
        pass
