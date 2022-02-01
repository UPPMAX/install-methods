#!/usr/bin/env python 
import os
import stat
import sqlite3
import re
import sys
import shlex
import shutil
import time
import chardet
import grp

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
listcluster = {}
#('cellranger-ATAC_1.2.0', 'https://support.10xgenomics.com/single-cell-atac/software/pipelines/latest/what-is-cell-ranger-atac', 'Cell Ranger ATAC', 'cellranger-ATAC', 'Rackham, Irma, Bianca, Snowy', '1.2.0', 'Misc non-commercial', '', 'Bioinformatics Misc')
#(key, web, name, module, clusters, version, lic, licURL, section))

# Create table of cluster per key
cursor.execute("DROP TABLE IF EXISTS clusters")
sql = """CREATE TABLE clusters (key  CHAR(120) NOT NULL, cluster  CHAR(40) NOT NULL)"""
cursor.execute(sql)
sql = "INSERT INTO clusters (key, cluster) VALUES (?, ?)"
for entry in webpagerows:
    key = entry[0]
    webpage[key] = entry[1]
    software[key] = entry[2]
    module[key] = entry[3]
    clusters[key] = entry[4]
    version[key] = entry[5]
    license[key] = entry[6]
    licenseURL[key] = entry[7]
    section[key] = entry[8]
    listcluster[key] = clusters[key].split(", ")

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

################## I think this just selects stuff not in both
#sql = """SELECT * FROM mftree WHERE module IN modfiles"""
################## so instead ##########################
sql = """SELECT * FROM mftree"""

cursor.execute(sql)
rows_from_mftree = cursor.fetchall()

##################### Set output and other stuff for logging #####################
original_stdout = sys.stdout
logfile = 'YAML_LOG' + time.strftime("%Y-%m-%d__%H-%M", time.localtime()) + '.log'
log = open(logfile, 'w')

#('alphafold_dataset_2.1.1', 'alphafold_dataset', 'snowy', '2.1.1', '/sw/mf/snowy/data/alphafold_dataset/2.1.1', '/sw/data/alphafold_dataset/$version', 1, 1)
mftree_clusters = {}
for row in rows_from_mftree:
    mftree_key = row[0]
    if mftree_key not in mftree_clusters:
        mftree_clusters[mftree_key] = [row[2]]
    else:
        mftree_clusters[mftree_key].append(row[2])
done = {}
for row in rows_from_mftree:
    mftree_key = row[0]
    if mftree_key in done:
        continue
    mftree_tool = row[1]
    mftree_version = row[3]
    mftree_file = row[4]
    print(mftree_file, file=log)
    if os.path.isfile(mftree_file) and not os.access(mftree_file, os.R_OK):
        print('ERROR: ' + mftree_file + ' is not readable', file=log)
    #################### Scan the mf file for the path in the software tree ###########################
    if os.path.isfile(mftree_file) and os.access(mftree_file, os.R_OK):
        string = os.popen('file -bi ' + os.path.realpath(mftree_file)).read().strip()
        if (('us-ascii' not in string) and ('utf-8' not in string)):
            print('WARNING: ' + os.path.realpath(mftree_file) + ' is not ascii or utf-8, but ' + string, file=log)
        with open(mftree_file, encoding="latin-1", errors="surrogateescape") as mffile:
            for line in mffile:
                if re.match("^\W*(#|--)", line):        #Checking for commented lines
                    continue
                match_row_tcl = re.match("set\W+modroot\W+(\S+?)\/\$", line)
                match_row_lua = re.match("local\W+tooldir\W+=\W+\"\/(\S+?)\"", line)
                if match_row_lua:
                    match_row = match_row_lua
                else:
                    match_row = match_row_tcl
                if match_row:
                    path_to_sw = "/" + match_row.group(1) + "/"
                    new_yaml = path_to_sw + mftree_tool + '-' + mftree_version + '.DRAFT.yaml' 
                    readme = path_to_sw + mftree_tool + '-' + mftree_version + '_install-README.md'
                    postinstall = path_to_sw + mftree_tool + '-' + mftree_version + '_post-install.sh'
                    if not os.path.isfile(readme) or not os.access(readme, os.R_OK):
                        readme = ''
                    if not os.path.isfile(postinstall) or not os.access(postinstall, os.R_OK):
                        postinstall = ''
                    local = path_to_sw + "/mf" + mftree_version
                    if not os.path.isfile(local) or not os.access(local, os.R_OK):
                        local = ''
                    yaml = path_to_sw + mftree_tool + '-' + mftree_version + '.yaml'

###################### Make all the files #################################
                    if mftree_key not in version:
                        print("   WARNING: " + mftree_key + " from mftree not in website version", file=log)
                        modu = '' 
                        lice = ''
                        lURL = ''
                        webs = ''
                        sect = ''
                        desc = ''
                    else:
                        modu = module[mftree_key]
                        lice = license[mftree_key]
                        lURL = licenseURL[mftree_key]
                        webs = webpage[mftree_key]
                        sect = section[mftree_key]
                        desc = software[mftree_key]
                    if os.path.isdir(path_to_sw) and os.access(path_to_sw, os.W_OK):
                        with open(new_yaml, 'w') as the_file:
                            the_file.write('- TOOL:' + mftree_tool + "\n")
                            the_file.write('- VERSION:' + mftree_version + "\n")
                            the_file.write('- MODULE:' + modu + "\n")
                            the_file.write('- CLUSTER:' + "\n")
                            for clu in mftree_clusters[mftree_key]:
                                regexp = "(\S+)" + re.escape(clu) + "(\S+)"
                                match_cluster = re.match(regexp, mftree_file, re.IGNORECASE)
                                if match_cluster:
                                    common = match_cluster.group(1) + "common" + match_cluster.group(2)
                                if clu != "common":
                                    the_file.write('   - ' + clu + "\n")
                            the_file.write('- LICENSE:' + lice + "\n")
                            the_file.write('- LICENSEURL:' + lURL + "\n")
                            the_file.write('- USERGROUP:sw' + "\n")
                            the_file.write('- USERPERMISSIONS:-R u+rwX,g+rwX,o+rX-w' + "\n")
                            the_file.write('- WEBSITE:' + webs + "\n")
                            the_file.write('- LOCAL:' + local + "\n")
                            the_file.write('- SECTION:' + sect + "\n")
                            the_file.write('- POSTINSTALL:' + postinstall + "\n")
                            the_file.write('- README:' + readme + "\n")
                            if os.path.isfile(common) and os.access(common, os.R_OK):
                                the_file.write('- COMMON:' + common + "\n")
                            the_file.write('- DESCRIPTION:' + desc + "\n")
                        gid = grp.getgrnam("sw").gr_gid
                        os.chown(new_yaml, -1, gid)
                    else:
                        if not os.path.isdir(path_to_sw):
                            print("WARNING: " + path_to_sw + " from the mf does not exist", file=log)
                        if not os.access(path_to_sw, os.W_OK):
                            print("WARNING: " + path_to_sw + " is not writable", file=log)
    done[mftree_key] = True
log.close()

