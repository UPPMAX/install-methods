#!/usr/bin/env python 
import os
import stat
import re
import yaml
import pwd
import subprocess
import ruamel.yaml
yml = ruamel.yaml.YAML()
yml.preserve_quotes = True
yml.explicit_start = True

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
                if not re.search(":", line_after) and not re.search(" - ", line_after):
                    line_after = re.sub("^  ", "  - ", line_after)
                output = output + line_after
            return output
    except Exception:
        return ''

################### Main ####################
for root, dirs, files in walklevel("/sw/", 6):
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
                        try: parsed_yaml['TOOL']
                        except:
                            print(path + " is not a sw yaml.")
                            continue
                        try:
                            key = parsed_yaml['TOOL'] + "_" + str(parsed_yaml['VERSION'])
                            sqlkey_old = -1
                            try:
                                sqlkey_old = parsed_yaml['SQLKEY']
                            except:
                                sqlkey_old = 0
                            if key != sqlkey_old:
                                print("Changing SQLKEY in " + path)
                                parsed_yaml['SQLKEY'] = key
                            else:
                                pass
                        except yaml.YAMLError as exc:
                            print(exc)
                            print("sql key")
                            continue
                    except yaml.YAMLError as exc:
                        print(exc)
                        print("yaml open")
                        continue
                    new_file = re.search('(^.*)\.DRAFT(.*$)', path)
                    new_yaml = path
                    if new_file:
                        new_yaml = new_file.group(1) + new_file.group(2)
                        try:
                            old_file = new_file.group(1) + new_file.group(2)
                        except Exception as exc:
                            print(exc)
                            print("old file name construction")
                        try:
                            old_yamlstream = open_yaml_fixed(old_file)
                        except Exception as exc:
                            print(exc)
                            print("opening the old yaml file")
                        try:
                            old_parsed_yaml=yaml.safe_load(old_yamlstream)
                        except Exception as exc:
                            print(exc)
                            print("making the yaml object")
                        if(old_parsed_yaml):
                            try:
                                parsed_yaml.update(old_parsed_yaml)
                            except Exception as exc:
                                print(exc)
                                print(old_parsed_yaml)
                                print("merging the old into the new")
                            os.rename(old_file, old_file + ".OLDLEGACY")
                    try:
                        with open(new_yaml, 'w') as outfile:
                            yml.dump(parsed_yaml, outfile)
                            print("New file " + new_yaml + " made.")
                    except Exception as exc:
                        print(exc)
                        print("dump")

