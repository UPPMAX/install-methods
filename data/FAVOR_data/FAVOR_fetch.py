#!/usr/bin/env python3

import os
import sys
import json
import hashlib
import argparse

# a very simple little package to fetch my Harvard Dataverse API token
import FAVOR_api_token

if FAVOR_api_token.is_expired():
    print("*** Harvard Dataverse API token expired", file=sys.stderr())
    exit(1)

#API_TOKEN = FAVOR_api_token.get_token()
API_TOKEN = '$API_TOKEN'
print('\nusing API token securely\n', file=sys.stderr)
SERVER_URL = 'https://dataverse.harvard.edu'

parser = argparse.ArgumentParser(
    prog='fetch.py',
    description='Harvard Dataverse FAVOR annotation database data fetcher for UPPMAX')
parser.add_argument('-j', '--json')  # the JSON metadata file to parse
args = parser.parse_args()
if args.json is None:
    print("Requires metadata file as -j/--json METADATA.json")
    exit(1)

#json_FILE  = 'FAVOR-essential.metadata.json'
json_FILE  = args.json
md5_FILE   = os.path.splitext(json_FILE)[0] + '.md5'
fetch_FILE = os.path.splitext(json_FILE)[0] + '.fetch.sh'

def check_file_md5(file, md5):
    with open(file, "rb") as f:
        file_hash = hashlib.md5()
        while chunk := f.read(8192):
            file_hash.update(chunk)
        print(file + '  expected ' + md5 + '  computed ' + file_hash.hexdigest(), end='\n', file=sys.stderr)
        if md5 == file_hash.hexdigest():
            return True
        else:
            return False

def form_command(file_id, file_name):
    curl = 'curl -L'
    output = '-o ' + file_name
    key = '-H "X-Dataverse-key:' + API_TOKEN + '"'
    url = SERVER_URL + '/api/access/datafile/' + str(file_id)
    return curl + ' ' + output + ' ' + key + ' ' + url

with open(json_FILE, "r") as json_file:
    topd = json.load(json_file)

md5_file   = open(md5_FILE, "w")
fetch_file = open(fetch_FILE, "w")
fetch_file.write('#!/bin/bash\n\n')
fetch_file.write('API_TOKEN=' + FAVOR_api_token.get_token_bash() + '\n\n')

d = topd['datasetVersion']

data_title = json_FILE
if d['metadataBlocks']['citation']['fields'][0]['typeName'] == "title":
    data_title = d['metadataBlocks']['citation']['fields'][0]['value']
if d['metadataBlocks']['citation']['fields'][1]['typeName'] == "subtitle":
    data_title = data_title + ' : ' + d['metadataBlocks']['citation']['fields'][1]['value']
data_info = 'source = {publisher}  date = {publicationDate}'.format(**topd) + '  id = {datasetId}'.format(**d) + '  license = ' + d['license']['name']
print(data_title + '\n' + data_info + '\n', file=sys.stderr)
fetch_file.write('# ' + data_title + '\n' + '# ' + data_info + '\n#\n')

for f in d['files']:
    if f['directoryLabel'] != 'CSV':
        continue
    ff = f['dataFile']
    print('filename {filename}  md5 {md5}  file-id {id}'.format(**ff), file=sys.stderr)
    md5_file.write('{md5}  {filename}\n'.format(**ff))
    if os.path.isfile(ff['filename']):
        print('*** {filename} exists, checking md5'.format(**ff), file=sys.stderr)
        if check_file_md5(ff['filename'], ff['md5']):
            print('    OK  will not download', file=sys.stderr)
            fetch_file.write('echo "skipping file-id {id} {filename}, md5 matches {md5}"\n'.format(**ff))
            continue
        else:
            print('    FAIL  script will remove and download', file=sys.stderr)
            #exit(1)  # for testing
            fetch_file.write('rm -f ' + ff['filename'] + '\n')
    fetch_file.write('echo "Fetching {filename} ..."\n'.format(**ff))
    fetch_file.write(form_command(ff['id'], ff['filename']) + '\n')


