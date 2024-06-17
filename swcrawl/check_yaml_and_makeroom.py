#!/usr/bin/env python 
import os
import stat
import re
import yaml
import pwd
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

for root, dirs, files in walklevel("/sw/", 5):
    if re.search('/sw/.+/src/', root):
        continue
    if re.search('/sw/links/', root):
        continue
    if re.search('/sw/\.snapshot', root):
        continue
    if re.search('/sw/apps/conda/.+/', root):
        continue
    if re.search('/sw/apps/R_packages/.+/', root):
        continue
    # Standard path is /sw/<category>/<sw_name>/<yamlfile> Thus the matching below.
    for file in files:
        m = re.search('(.*\.yaml)', file)
        if m:
            if (m.group(1)):
                path = root + '/' + m.group(1)
                if os.path.isfile(path) and os.access(path, os.R_OK):
                    with open(path, 'r') as yamlstream:
                        try:
                            parsed_yaml=yaml.safe_load(yamlstream)
                            try:
                                key = parsed_yaml['SQLKEY']
                            except:
                                try:
                                    key = parsed_yaml['TOOL'] + "_" + str(parsed_yaml['VERSION'])
                                except:
                                    print(path + " looks like it is not a sw yaml.")
                                    continue
                        except yaml.YAMLError as exc:
                            print(exc)
                            continue
            if parsed_yaml:
                yamlcontent = parsed_yaml['TOOL'] + "-" + str(parsed_yaml['VERSION']) + ".yaml"
                if(yamlcontent != m.group(1)):
                    print(yamlcontent + "  !=  " + path)

        n = re.search('(.*makeroom_.*\.sh)', file)
        if n:
            if (n.group(1)):
                makeroomfile = root + '/' + n.group(1)
                if os.path.isfile(makeroomfile) and os.access(makeroomfile, os.R_OK):
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
                            #with open("TMPFILE", 'w') as outfile:
                            #    print(yamlmr, file=outfile)
                            #with open("TMPFILE", 'r') as infile:
                                #print(yamlfile)
                                #print(yamlpartofmakeroom)
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

