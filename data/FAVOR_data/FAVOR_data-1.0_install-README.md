FAVOR_data/1.0
========================

<https://dataverse.harvard.edu/dataverse/favor>

Used under license:
CC0 1.0
<http://creativecommons.org/publicdomain/zero/1.0>

Structure creating script (makeroom_FAVOR_data_1.0.sh) moved to /sw/data/FAVOR_data/makeroom_1.0.sh

Need to get a login to the Harvard Dataverse, where these databases are kept.
It is possible to sign up using Uppsala universitet and authenticating using
SWAMID.

    https://dataverse.harvard.edu/

Once that is completed, under Account, select the "API Token" tab and generate
a token. Copy it to the clipboard and keep it in a safe place.  I keep mine in
and generate a token. Copy it to the clipboard and keep it in a safe place.  I
keep mine in $(cat $HOME/.ssh/dataverse.harvard.edu-API-token).

We are going to use the CSV versions of these databases. This affects which
data files we download.



LOG
---

    makeroom.sh -f -t FAVOR_data -v 1.0 -c data -w https://dataverse.harvard.edu/dataverse/favor -l "CC0 1.0" -L http://creativecommons.org/publicdomain/zero/1.0 -d "Functional Annotation of Variants - Online Resource (FAVOR, https://favor.genohub.org) is a comprehensive whole-genome variant annotation database"
    ./makeroom_FAVOR_data_1.0.sh 
    source /sw/data/FAVOR_data/SOURCEME_FAVOR_data_1.0
    cd $SRCDIR

Spent a lot of time working out how to use the API. Dataverse examples
(https://guides.dataverse.org/en/5.13/api/dataaccess.html) and hunting around
the Harvard Dataverse pages for the databases and metadata of interest got me
the basics after about an hour. The rest was learning to use python to traverse
the JSON metadata to pull out the needed files programmatically.


### FAVOR Essential database

An extensive but still limited set of annotation tags for many variants.

Under
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/1VGTJI
is a Metadata tab, with an Export Metadata button. Pressing that opens up a
complete JSON for this database. I saved it into
FAVOR-essential.metadata.json.orig.  Produce a well-formatted version with

    jq < FAVOR-essential.metadata.json.orig > FAVOR-essential.metadata.json && rm -f FAVOR-essential.metadata.json.orig
    view FAVOR-essential.metadata.json

This gives a better view of the JSON structure. From this we get the basic
database characters, and the pieces we need to download each file: its format
(SQL, CSV, aGSD), the file ID for the API, and its save name.

The basic format of file fetch with the API is

    curl -L -o SAVE-NAME -H "X-Dataverse-key:API-TOKEN" https://dataverse.harvard.edu/api/access/datafile/FILE-ID

I wrote a python script `FAVOR_fetch.py` under `$TOOLDIR` to form these queries
as well as .md5 files for checking downloads. It required python/3.10.8. It
takes an argument, the JSON of database file metadata.

    module load python/3.10.8

    FAVOR_fetch.py -j/--json metadata.json

This first uses the little `FAVOR_api_token` package (in `FAVOR_api_token.py`)
to check whether the API token is expired, and then fetches it from its secure
location.  The method `FAVOR_api_token.get_token_bash()` produces a bash
command substitution which fetches its value from its secure location, to be
used within the `.fetch.sh` file (see below) so that the API is never exposed.
It is kept within `$HOME/.ssh/` so that only the owner (me, or whoever has
placed their own token there) can fetch it.  See `FAVOR_api_token.py` for what
to name the token file.

`FAVOR_fetch.py` then scans the JSON. It pulls some basic info about the
dataset.  Then, for each CSV file, it pulls SAVE-NAME, FILE-ID, and MD5.
`FAVOR_fetch.py` creates a file named after the JSON file, `metadata.md5`, that
is a correctly formatted `.md5` file for use with `md5sum -c metadata.md5`.
This contains filenames and associated MD5 checksums.  `FAVOR_fetch.py` also
creates a `metadata.fetch.sh` file that contains API commands for downloading
files.

`FAVOR_fetch.py` tries to be helpful.  If a file with SAVE-NAME is found in the
current directory, it checks its MD5 against the one the metadata has for that
SAVE-NAME. If it matches, we avoid downloading that file in the `.fetch.sh`
script, printing a message about skipping it.  If the MD5 does not match, then
the `.fetch.sh` script removes the file first, before including the API command
to fetch it.

Decompress each file into $PREFIX. Maybe Essential and Full into separate
directories? That will take digging into the Full tarballs and reading some
more FAVOR docs.

The Essential database files have the form

    chr2.tar.gz

### Unpacking Essential data

Each database file is a compressed tarball with unnecessary path components
prior to the split CSV information for that chromosome.  Subdirectory will be
`FAVOR_Essential`, which we will move to `$PREFIX` after it's been filled.

    cd $SRCDIR
    mkdir $PREFIX/FAVOR_Essential
    for C in $(seq 1 22) ; do
        tar xvf chr${C}.tar.gz --strip-components 7 -C $PREFIX/FAVOR_Essential
    done

This one already had .idx files built for each .csv.

### FAVOR Full database

An extensive set of annotation tags for many variants.

Under
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/KFUBKG
is a Metadata tab, with an Export Metadata button. Pressing that opens up a
complete JSON for this database. I saved it into
FAVOR-full.metadata.json.orig.  Produce a well-formatted version with

    jq < FAVOR-full.metadata.json.orig > FAVOR-full.metadata.json && rm -f FAVOR-full.metadata.json.orig
    view FAVOR-full.metadata.json

This gives a better view of the JSON structure. From this we get the basic
database characters, and the pieces we need to download each file: its format
(SQL, CSV, aGSD), the file ID for the API, and its save name.

The files for the full database have the form

    FAVOR.FullDB.Chr5.tar.gz

To get these, I'll modify `FAVOR_fetch.py` to use this JSON, and key off the file
name or some other piece of metadata to know that it is fetching essential or
full files.

### Unpacking Full database data

Each database file is a compressed tarball with no unnecessary path components
prior to the split CSV information for that chromosome.  Subdirectory will be
`FAVOR_FullDB`, which we will move to `$PREFIX` after it's been filled.

    cd $SRCDIR
    mkdir $PREFIX/FAVOR_FullDB
    for C in $(seq 1 22) ; do 
        tar xvf FAVOR.FullDB.Chr${C}.tar.gz -C $PREFIX/FAVOR_FullDB
    done

Use `xsv`, installed within `rust/1.67.0`, to create .idx files for each .csv.

    cd $PREFIX/FAVOR_FullDB/

    module load rust/1.67.0
    module load gnuparallel/20230422

    parallel -j 4 xsv index ::: *.csv

