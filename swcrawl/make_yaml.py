#!/usr/bin/env python 
import os
import stat
import sqlite3
import re
import time
import shlex
import sys

# Open database connection
if not os.path.exists('swdb.db'):
    print('swdb.db not found',file=sys.stderr)
    exit(1)

db = sqlite3.connect('swdb.db')
db.text_factory = str

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Create SQL as per requirement
#sql = """SELECT * FROM swtree WHERE name='x86_64'"""
#sql = """SELECT * FROM webpage INNER JOIN swtree ON webpage.key = swtree.key GROUP BY webpage.name"""
sql = """SELECT module FROM webpage EXCEPT SELECT module FROM mftree UNION SELECT module FROM mftree EXCEPT SELECT module FROM webpage"""
sql = """SELECT module FROM webpage EXCEPT SELECT module FROM mftree UNION SELECT module FROM mftree EXCEPT SELECT module FROM webpage"""

cursor.execute(sql)
modules = cursor.fetchall()

# Create table as per requirement
cursor.execute("DROP TABLE IF EXISTS modfiles")
sql = """CREATE TABLE modfiles (module  CHAR(30) NOT NULL)"""
cursor.execute(sql)
sql = "INSERT INTO modfiles (module) VALUES (?)"
try:
    cursor.executemany(sql, (modules))
    db.commit()
except:
    print("ERROR SW!\n")
    db.rollback()

sql = """SELECT * FROM mftree WHERE module IN modfiles"""

cursor.execute(sql)
rows = cursor.fetchall()
for row in rows:
    path_to_mf = row[-1]
#    ('spaceranger-data_1.0.0', 'spaceranger-data', 'snowy', '1.0.0', '/sw/mf/snowy/data/spaceranger-data')
    key = row[0]
    software = row[1]
    server = row[2]
    version = row[3]
    directory = path_to_mf
    if os.path.isdir(directory):
        for version in os.listdir(directory):
            mf_with_path = os.path.join(directory, version)
            if os.path.isfile(mf_with_path) and not os.access(mf_with_path, os.R_OK):
                print('ERROR: ' + mf_with_path + ' is not readable')
            if os.path.isfile(mf_with_path) and os.access(mf_with_path, os.R_OK):
                with open(mf_with_path) as mffile:
                    for line in mffile:
                        match_row = re.match("set\W+modroot\W+(.+?)\$",line)
                        #print path_to_sw
                        if match_row:
                            path_to_sw = "/" + match_row.group(1)
                            new_yaml = path_to_sw + software + '_' + version + '.DRAFT.yaml' 
                            #+ time.strftime("%Y-%m-%d__%H-%M-%S", time.localtime()) + '.yaml'
                            readme = path_to_sw + software + '-' + version + '_install-README.md'
                            if os.path.isfile(readme) and os.access(readme, os.R_OK):
                                webpage = '<empty>'
                                with open(readme) as readmefile:
                                    for line in readmefile:
                                        match = re.search('/makeroom.sh',line)
                                        if match:
                                            linesplit = line.replace('-f"', '-f')
                                            linesplit = shlex.split(linesplit)
                                            keyword = {}
                                            for i in linesplit:
                                                if re.match("^-\w$",i):
                                                    flag = i
                                                elif 'flag' in locals():
                                                    keyword[flag] = i
                                                    print(flag + '  ' + keyword[flag])
                                                    del flag
 #Insert dictionary with all labels from YAML and all flags from db
                                        match_row = re.match("<(.+?)>",line)
                                        if match_row:
                                            webpage = match_row.group(1)
                            #    print('Readme at ' + readme + ' with webpage as ' + webpage)
                            #postinstall = path_to_sw + software + '-' + version + '_post-install.sh'
                            #if os.path.isfile(postinstall) and os.access(postinstall, os.R_OK):
                            #    print('Postinstall at ' + postinstall)
                            #yaml = path_to_sw + software + '-' + version + '.yaml'
                            #if os.path.isfile(yaml) and os.access(yaml, os.R_OK):
                            #    print('Yaml at ' + yaml)


# search /sw/bioinfo/Nextflow/Nextflow-21.04.1_install-README.md
# search /sw/bioinfo/Nextflow/Nextflow-21.04.1_post-install.sh
# MF database faelt
#    (key, module, cluster, version, fullpath, modroot, link, readable))
# Nextflow-21.04.1.yaml
# 
# - TOOL:Nextflow
# - VERSION:21.04.1
# - CLUSTER:
# - rackham
# - irma
# - bianca
# - snowy
# - LICENSE:Creative Commons Attribution-ShareAlike 4.0 International Public License
# - LICENSEURL:https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt
# - USERGROUP:sw
# - USERPERMISSIONS:-R u+rwX,g+rwX,o+rX-w
# - WEBSITE:https://github.com/nextflow-io/nextflow
# - LOCAL:/sw/bioinfo/Nextflow/mf/21.04.1
# - COMMON:/sw/mf/common/bioinfo-tools/pipelines/Nextflow/21.04.1
# - DESCRIPTION:A DSL for data-driven computational pipelines http://nextflow.io


#install-README.md
#Nextflow/21.04.1
#========================
#
#<https://github.com/nextflow-io/nextflow>
#
#Used under license:
#    Creative Commons Attribution-ShareAlike 4.0 International Public License
#    <https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt>
#
#    Structure creating script (makeroom_Nextflow_21.04.1.sh) moved to /sw/bioinfo/Nextflow/makeroom_21.04.1.sh
#
#    LOG
#    ---
#
#        /home/jonass/uppmax/makeroom.sh -t "Nextflow" -v "21.04.1" -d "A DSL for data-driven computational pipelines http://nextflow.io" -w "https://github.com/nextflow-io/nextflow" -l "Creative Commons Attribution-ShareAlike 4.0 International Public License" -L "https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt" -f"
#            ./makeroom_Nextflow_21.04.1.sh



#post-install.sh
#. /domus/h1/jonass/uppmax/install-methods//uppmax_functions.sh
#chgrp 'sw' /sw/bioinfo/Nextflow
################ 2775 = g+s,u+rwX,g+rwX,o+rX-w
#chmod 2775 /sw/bioinfo/Nextflow
#find /sw/bioinfo/Nextflow -maxdepth 1 -type f -exec chgrp "sw" {} \;
#fixup /sw/bioinfo/Nextflow/mf
#fixup /sw/bioinfo/Nextflow/21.04.1
#cp -av /sw/bioinfo/Nextflow/mf/21.04.1 /sw/mf/common/bioinfo-tools/pipelines/Nextflow/21.04.1
#all_mflink -f -i Nextflow 21.04.1
#chgrp -h 'sw' /sw/bioinfo/Nextflow
#echo "News:"
#echo "[bio] Nextflow/21.04.1 installed on all systems" 1>&2
#echo "Nextflow (A DSL for data-driven computational pipelines http://nextflow.io) version 21.04.1 installed on all systems as module Nextflow/21.04.1." 1>&2
#echo "https://github.com/nextflow-io/nextflow" 1>&2
#echo "rackham, irma, bianca, snowy" 1>&2
#echo "21.04.1" 1>&2
#echo "Creative Commons Attribution-ShareAlike 4.0 International Public License" 1>&2

