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

def maketable_yamlfiles(cursor):
    # Drop table if it already exist.
    cursor.execute("DROP TABLE IF EXISTS yamlfiles")
    # Create table as per requirement
    sql = """CREATE TABLE yamlfiles (
        key  CHAR(120),
       path CHAR(320),
       creator  CHAR(30) NOT NULL,
       md5  CHAR(120) NOT NULL)"""
    cursor.execute(sql)

def maketable_persons(cursor):
    # Drop table if it already exist.
    cursor.execute("DROP TABLE IF EXISTS persons")
    # Create table as per requirement
    # Fantastic list from this command
    # for i in $(curl api.uppmax.uu.se:5000/api/v1/projects?Projectname=staff\&fields=Uppmax_Members | grep Username | awk -F'"' '{print $4}'); do curl api.uppmax.uu.se:5000/api/v1/users/$i | awk -F"\"" '{print $2 "\""$4"\""}'; done | grep "Username\|Name\|Mail" | awk '{print "(\""$4"\",\""$2"\",\""$6"\"),"}' FS="\"" RS="User"
    sql = """CREATE TABLE persons (
        name  CHAR(120) NOT NULL,
        username  CHAR(120) NOT NULL,
        email CHAR(120) NOT NULL)"""
    cursor.execute(sql)
    sql = "INSERT INTO persons (name, username, email) VALUES (?, ?, ?)"
    val = [
        ('Martin Agback','agback','Martin.Agback@it.uu.se'),
        ('Elisabeth Larsson','bette','elisabeth.larsson@it.uu.se'),
        ('Marcus Lundberg','marcusl','marcus.lundberg@uppmax.uu.se'),
        ('Anders Sjölander','anderssj','anders.sjolander@uppmax.uu.se'),
        ('Douglas Scofield','douglas','douglas.scofield@uppmax.uu.se'),
        ('Diana Iusan','iusan','diana.iusan@uppmax.uu.se'),
        ('Martin Dahlö','dahlo','martin.dahlo@scilifelab.uu.se'),
        ('Pavlin Mitev','pmitev','pavlin.mitev@uppmax.uu.se'),
        ('Andreas Vallin','anwa5127','andreas.vallin@it.uu.se'),
        ('Daniel Kulawiak','kulawiak','daniel.kulawiak@uppmax.uu.se'),
        ('Erik Starbäck','erikstar','erik.starback@uppmax.uu.se'),
        ('Joxaren Jox','joxaren','system@uppmax.uu.se'),
        ('Linus Nilsson','linusn','linus.nilsson@it.uu.se'),
        ('Linus Nilsson','lni','linus.nilsson@uppmax.uu.se'),
        ('Daniel Kulawiak','dku','daniel.kulawiak@uppmax.uu.se'),
        ('Valentin Georgiev','valent','valentin.georgiev@uppmax.uu.se'),
        ('Jonas Söderberg','jonass','jonas.soderberg@scilifelab.se'),
        ('Lars Eklund','laekl991','lars.eklund@it.uu.se'),
        ('Carl Nettelblad','nettel','carl.nettelblad@it.uu.se'),
        ('Pär Lindfors','paran','par.lindfors@uppmax.uu.se'),
        ('Björn Viklund','bjornv','bjorn.viklund@uppmax.uu.se'),
        ('Björn Claremar','bjornc','bjorn.claremar@uppmax.uu.se'),
        ('Jerker Nyberg von Below','jerker','jerker.nyberg.von.below@uppmax.uu.se'),
        ('Jessica Nettelblad','jessine','jessica.nettelblad@it.uu.se'),
        ('Anders Hast','andersh','anders.hast@it.uu.se'),
        ('Niharika Gauraha','niharika','niharika.gauraha@uppmax.uu.se'),
        ('Jessica Nettelblad','jtn','jessica.nettelblad@uppmax.uu.se')
        ]
    try:
        cursor.executemany(sql, val)
        db.commit()
    except:
        print("ERROR INSERTING PERSONS INTO SWDB!\n")
        db.rollback()

def open_yaml_fixed(yaml_file):
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
            output = output + line_after
        #print(output)
        return output

# Open database connection
db = sqlite3.connect('swdb.db')
db.text_factory = str

# prepare a cursor object using cursor() method
DBcursor = db.cursor()

# Only run once
#maketable_persons(DBcursor)

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
                creator = pwd.getpwuid(os.stat(path).st_uid).pw_name
                if os.path.isfile(path) and os.access(path, os.R_OK):
                    md5_hash = hashlib.md5()
                    with open(path, 'rb') as a_file:
                        content = a_file.read()
                        md5_hash.update(content)
                        md5 = md5_hash.hexdigest()
                    yamlstream = open_yaml_fixed(path)
                    #with open(path, 'r') as yamlstream:
                    try:
                        parsed_yaml=yaml.safe_load(yamlstream)
                        try:
                            key = parsed_yaml['SQLKEY']
                        except:
                            try:
                                key = parsed_yaml['TOOL'] + "_" + str(parsed_yaml['VERSION'])
                            except:
                                print("This looks like something else: ")
                                print(parsed_yaml)
                                print(yamlstream)
                    except yaml.YAMLError as exc:
                        print(exc)
            # Get the md5 from the SQL DB and check if the file is changed
            sql = 'SELECT yamlfiles.md5 FROM yamlfiles WHERE yamlfiles.path IS "' + path + '";'
            try:
                for i in DBcursor.execute(sql).fetchall():
                    oldmd5 = i[0]
            except:
                print("ERROR!\n")
            # New insert  into chksum table to keep track of yaml files
            if oldmd5 == md5:
                print("No change to " + path)
            else:
                sql = 'SELECT persons.email FROM persons WHERE persons.username IS "' + creator +'";'
                try:
                    for i in DBcursor.execute(sql).fetchall():
                        email = i[0]
                    mail = "mailx -r \"NOREPLY\" -s " + "\"New YAML-file\" " + email
                    body = "Hi!\n\nThe YAML file at\n" + path + "\nseems to have changed.\n\nThe System"
                    cmd = "echo \"" + body + "\" | " +  mail
                    #result = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
                    #output, errors = result.communicate()
                    print("\nmailing: " + mail + "\n\n")
                except:
                    print("No e-mail registered!\n")
                sql = "INSERT INTO yamlfiles (key, path, creator, md5) VALUES (?, ?, ?, ?)"
                print(key, path, creator, md5, oldmd5)
                try:
                    # Execute the SQL command
                    DBcursor.execute(sql, (key, path, creator, md5))
                    # Commit your changes in the database
                    db.commit()
                except:
                    # Rollback in case there is any error
                    print("ERROR SW!\n")
                    db.rollback()

# disconnect from server
db.close()

