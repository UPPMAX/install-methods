#!/usr/bin/env python 
import os
import re

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
        n = False
        for file in files:
            n = re.search('(.*\.yaml)', file)
        if n:
            del dirs[:]
            path = root + '/' + n.group(1)
            print(path)
            continue
        elif base_depth + depth <= cur_depth:
            del dirs[:]

################### Main ####################
for root, dirs, files in walklevel("/sw/", 5):
    if re.search('/sw/.+/src/', root):
        continue
    if re.search('/sw/links/', root):
        continue
    if re.search('/sw/\.snapshot', root):
        continue
    # Standard path is /sw/<category>/<sw_name>/<yamlfile> Thus the matching below.
    for file in files:
        m = re.search('(.*\.yamlTEST|.*\.DRAFT.yaml)', file)
        if m:
            path = root + '/' + m.group(1)
            print(path)
            os.remove(path)
