#!/usr/bin/env python 
import os
import stat
import sqlite3
import re
import yaml
import pwd
import hashlib
import subprocess
import nltk
import shutil
import glob
from nltk.corpus.reader.plaintext import PlaintextCorpusReader
from nltk.collocations import *
import argparse
from nltk.probability import FreqDist
from nltk.corpus import stopwords
from string import punctuation
from nltk import word_tokenize
from nltk.util import ngrams

stoplist = stopwords.words('english') + list(punctuation) + ["//","///","http","sw","bioinfo","mf"] + list("1234567890")

parser = argparse.ArgumentParser()
parser.add_argument("-n", "--newfiles", help="Generate the DATA files from scratch", action="store_true")
parser.add_argument("-c", "--newcorpusfiltered", help="Make a new corpus from the DESCRIPTION and SECTION", action="store_true")
parser.add_argument("--newcorpusall", help="Make a new corpus from ALL the files", action="store_true")
args = parser.parse_args()

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

def maketable_tags(cursor):
    # Drop table if it already exist.
    cursor.execute("DROP TABLE IF EXISTS tags")
    # Create table as per requirement
    sql = """CREATE TABLE tags (
        tag  CHAR(120),
        freq INT)"""
    cursor.execute(sql)

# Open database connection
db = sqlite3.connect('swdb.db')
db.text_factory = str

# prepare a cursor object using cursor() method
DBcursor = db.cursor()

# Only run once
#maketable_persons(DBcursor)

#Check to see if you want the files regenerated
if args.newfiles:
    prefix = '/home/jonass/nltk_data/corpora/Uppmax_Keywords/'

    for root, dirs, files in walklevel("/sw/", 3):
        if re.search('/sw/.+/src/', root):
            continue
        if re.search('/sw/links/', root):
            continue
        if re.search('/sw/\.snapshot', root):
            continue
        print('Searching in: ' + root)
        for file in files:
            m = re.search('(.*README\.md$|.*(?<!DRAFT)\.yaml.*)', file)
            if m:
                if (m.group(1)):
                    path = root + '/' + m.group(1)
                    if os.path.isfile(path) and os.access(path, os.R_OK):
                        destination = prefix + m.group(1)
                        if not os.path.isfile(destination):
                            os.symlink(path, prefix + m.group(1))

print('Links are done, now to create a new corpus from all the files')

corpusdir = '/domus/h1/jonass/nltk_data/corpora/Uppmax_Keywords/'
concat_rawdatafiles = corpusdir + 'DATA'

if args.newcorpusall:
    newcorpus = PlaintextCorpusReader(corpusdir, '.*')
    print('Make a file from all the data')
    with open(concat_rawdatafiles, 'w', encoding='utf-8', errors='ignore') as outfile:
        for filename in glob.glob(corpusdir + '*'):
            if filename == concat_rawdatafiles:
                # don't want to copy the output into the output
                continue
            with open(filename, 'r', encoding='utf-8', errors='ignore') as readfile:
                print(filename)
                shutil.copyfileobj(readfile, outfile)

if args.newcorpusfiltered:
    print('Filter the file to contain less stupid things')
    print('Then make a file from the filtered data')
    with open(concat_rawdatafiles, 'w', encoding='utf-8', errors='ignore') as outfile:
        for filename in glob.glob(corpusdir + '*'):
            if filename == concat_rawdatafiles:
                # don't want to copy the output into the output
                continue
            with open(filename, 'r', encoding='utf-8', errors='ignore') as rawdatafile:
                for line in rawdatafile:
                    if "DESCRIPTION" in line or "SECTION" in line or "COMMON" in line:
                        try:
                            print(line.split(":",1)[1], file = outfile)
                        except:
                            continue
#Construct a token list and remove stop words and punctuations.
with open(concat_rawdatafiles, 'r', encoding='utf-8', errors='ignore') as datafile:
    tokens = [token for token in nltk.word_tokenize(datafile.read()) if token not in stoplist]
#Then use a corpus reader that is not plain text but the base one to get to a new corpus.
newcorpus = PlaintextCorpusReader(corpusdir, concat_rawdatafiles)
#for word in [word for word in newcorpus.words(concat_rawdatafiles) if word not in stoplist]:
#    print(word)

print('Make the analysis')

bigram_measures = nltk.collocations.BigramAssocMeasures()
trigram_measures = nltk.collocations.TrigramAssocMeasures()
fourgram_measures = nltk.collocations.QuadgramAssocMeasures()

# change this to read in your data
finder2 = BigramCollocationFinder.from_words(tokens)
finder3 = TrigramCollocationFinder.from_words(tokens)
finder4 = QuadgramCollocationFinder.from_words(tokens)

# only bigrams that appear 3+ times
finder2.apply_freq_filter(3)
finder3.apply_freq_filter(3)
finder4.apply_freq_filter(3)

# return the 10 n-grams with the highest PMI
print(finder2.nbest(bigram_measures.pmi,10))
print(finder3.nbest(bigram_measures.pmi,10))
print(finder4.nbest(bigram_measures.pmi,10))

#compute frequency distribution for all the bigrams in the text
# take the second element for sort
def take_second(elem):
    return elem[1]

#Look at and plot the frequency of the most common words 
newcorpus_words = tokens
data_analysis = nltk.FreqDist(newcorpus_words)
  
# Let's take the specific words only if their frequency is greater than 3.
filter_words = dict([(m, n) for m, n in sorted(data_analysis.items(), key=take_second) if len(m) > 3])

print("\n#################### pairs ####################")
for k,v in sorted(finder2.ngram_fd.items(), key=take_second):
    print(v,k)
print("\n#################### triplets ####################")
for k,v in sorted(finder3.ngram_fd.items(), key=take_second):
    print(v,k)
print("\n#################### quads ####################")
for k,v in sorted(finder4.ngram_fd.items(), key=take_second):
    print(v,k)

for key in filter_words:
    if filter_words[key] < 4:
        print("%s: %s" % (key, filter_words[key]))
data_analysis = nltk.FreqDist(filter_words)
data_analysis.plot(55, cumulative=False)

# disconnect from server
db.close()

