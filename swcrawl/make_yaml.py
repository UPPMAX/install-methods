#!/usr/bin/env python 
import os
import stat
import sqlite3
import re
import sys
import shlex
import shutil

# Open database connection
if not os.path.exists('swdb.db'):
    print("swdb.db not found", file=sys.stderr)
    exit(1)

db = sqlite3.connect('swdb.db')
db.text_factory = str

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Create SQL as per requirement
#sql = """SELECT * FROM swtree WHERE name='x86_64'"""
#sql = """SELECT * FROM webpage INNER JOIN swtree ON webpage.key = swtree.key GROUP BY webpage.name"""
sql = """SELECT module FROM webpage EXCEPT SELECT module FROM mftree UNION SELECT module FROM mftree EXCEPT SELECT module FROM webpage"""

cursor.execute(sql)
modules = cursor.fetchall()

#Make a tuple of the webpage table
sql = """SELECT * FROM webpage"""
cursor.execute(sql)
webpagerows = cursor.fetchall()
webpage = {}
software = {}
module = {}
clusters = {}
version = {}
license = {}
licenseURL = {}
section = {}
#('cellranger-ATAC_1.2.0', 'https://support.10xgenomics.com/single-cell-atac/software/pipelines/latest/what-is-cell-ranger-atac', 'Cell Ranger ATAC', 'cellranger-ATAC', 'Rackham, Irma, Bianca, Snowy', '1.2.0', 'Misc non-commercial', '', 'Bioinformatics Misc')
#(key, web, name, module, clusters, version, lic, licURL, section))

# Create table of cluster per key
cursor.execute("DROP TABLE IF EXISTS clusters")
sql = """CREATE TABLE clusters (key  CHAR(120) NOT NULL, cluster  CHAR(40) NOT NULL)"""
cursor.execute(sql)
sql = "INSERT INTO clusters (key, cluster) VALUES (?, ?)"
for entry in webpagerows:
#    print(entry)
    key = entry[0]
    webpage[key] = entry[1]
    software[key] = entry[2]
    module[key] = entry[3]
    clusters[key] = entry[4]
    version[key] = entry[5]
    license[key] = entry[6]
    licenseURL[key] = entry[7]
    section[key] = entry[8]
#    print('Webpage:   ' + license[key] + '      ' + key)
    listcluster = clusters[key].split(", ")
#    for cluster in listcluster:
#        try:
#            cursor.execute(sql, (key, cluster))
#            db.commit()
#        except:
#            print("ERROR SW!\n")
#            db.rollback()

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
#    ('spaceranger-data_1.0.0', 'spaceranger-data', 'snowy', '1.0.0', '/sw/mf/snowy/data/spaceranger-data')
    mftree_dir = row[-1]
    key = row[0]
    mftree_software = row[1]
    mftree_server = row[2]
    mftree_version = row[3]

#### Kolla om key finns i website dictsen ovan. Om inte, kolla om det finns en yaml redan. Om inte det heller, skapa en från README-filen

#    if key not in mftree_version:
#        print(key + " not in version from mftree")
#    else:
#        print(version[key])
#        print('MF:    ' + key  + '     ' + version[key])
#        mf_with_path = os.path.join(mftree_dir, version[key])

############### Check the actual files inside the path we got from the mftree ###########################

    if os.path.isdir(mftree_dir):
        for ver_loop in os.listdir(mftree_dir):
            mf_with_path = os.path.join(mftree_dir, ver_loop)
#            print("Directory: " + mftree_dir + " Version: " + ver_loop + " Full: " + mf_with_path)
            if os.path.isfile(mf_with_path) and not os.access(mf_with_path, os.R_OK):
                print('ERROR: ' + mf_with_path + ' is not readable')

#################### Scan the mf file for the path in the software tree #################################

            if os.path.isfile(mf_with_path) and os.access(mf_with_path, os.R_OK):
                with open(mf_with_path) as mffile:
                    for line in mffile:
                        match_row = re.match("set\W+modroot\W+(.+?)\$",line)
                        if match_row:
                            path_to_sw = "/" + match_row.group(1)
                            new_yaml = path_to_sw + mftree_software + '_' + ver_loop + '.DRAFT.yaml' 
                            #+ time.strftime("%Y-%m-%d__%H-%M-%S", time.localtime()) + '.yaml'
                            readme = path_to_sw + mftree_software + '-' + ver_loop + '_install-README.md'
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
#                                            print('Readme at ' + readme + ' with webpage as ' + webpage)
                            postinstall = path_to_sw + mftree_software + '-' + ver_loop + '_post-install.sh'
#                            if os.path.isfile(postinstall) and os.access(postinstall, os.R_OK):
#                                print('Postinstall at ' + postinstall)
#                            yaml = path_to_sw + mftree_software + '-' + ver_loop + '.yaml'

###################### Make all the files #################################
                            if os.path.isdir(path_to_sw) and os.access(path_to_sw, os.W_OK):
                                with open(new_yaml, 'w') as the_file:
                                    the_file.write('Hello\n')
                            else:
                                print(path_to_sw + " does not exist\n")

###################### Save all the files #################################
#                            if os.path.isdir(path_to_sw) and os.access(path_to_sw, os.W_OK):
#                                snap = path_to_sw + '.snapshot/hourly.2021-11-11_1405/' + mftree_software + '-' + ver_loop + '.yaml'
#                                if os.path.isfile(yaml):
#                                    if len(open(yaml).readlines(  ))==1:
#                                        os.remove(yaml)
#                                if os.path.isfile(snap):
#                                    print("THIS IS THE SNAPSHOT:  " + snap)
#                                    shutil.copyfile(snap, yaml)
#                            else:
#                                print(path_to_sw + " does not exist\n")
#
###########################################################################

###########################################################################

#                            if os.path.isfile(yaml) and os.access(yaml, os.R_OK):
#                                print('Yaml at ' + yaml)
#                            else: 
#                                print('New yaml at ' + new_yaml)
#                            print(key + ' ' + mftree_software + ' ' + server + ' ' + ver_loop + ' ' + mftree_dir + ' ' + section[key] + ' ' + license[key])
                                        
#Insert dictionary with all labels from YAML and all flags from db
#     key            TOOL_ver_loop
#     software       TOOL
#     server         CLUSTER
#     version        VERSION
#     new_yaml       PATH_TO_NEW-YAML
#     webpage        URL
#     postinstall    PATH_TO_FILE
#     readme         PATH_TO README
#     mftree_dir     PATH_TO_MF (at CLUSTER, not common)

# search /sw/bioinfo/Nextflow/Nextflow-21.04.1_install-README.md
# search /sw/bioinfo/Nextflow/Nextflow-21.04.1_post-install.sh
# MF database faelt
#    (key, module, cluster, version, fullpath, modroot, link, readable))
# Nextflow-21.04.1.yaml
# 
# - TOOL:Nextflow
# - VERSION:21.04.1
# - CLUSTER:
#    - rackham
#    - irma
#    - bianca
#    - snowy
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

#Enter ".help" for usage hints.
#sqlite> .schema
#CREATE TABLE webpage (
#   key CHAR(120) NOT NULL,
#   web  CHAR(120),
#   name  CHAR(30) NOT NULL,
#   module CHAR(30),
#   cluster CHAR(40),
#   version CHAR(120),
#   license CHAR(120),
#   category CHAR(120));
#CREATE TABLE swtree (
#   key  CHAR(120),
#   name  CHAR(30) NOT NULL,
#   cluster CHAR(40),
#   version CHAR(120),
#   path CHAR(320));
#CREATE TABLE mftree (
#   key  CHAR(120),
#   module  CHAR(30) NOT NULL,
#   cluster CHAR(40),
#   version CHAR(120),
#   path CHAR(320));
#CREATE TABLE modfiles (module  CHAR(30) NOT NULL);
#sqlite>
