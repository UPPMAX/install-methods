dbCAN 4.0
=========

<http://csbl.bmb.uga.edu/dbCAN/>

LOG
---

    VERSION=4.0
    mkdir -p /sw/data/uppnex/dbCAN
    chmod g+s /sw/data/uppnex/dbCAN
    cd /sw/data/uppnex/dbCAN
    mkdir $VERSION
    cd $VERSION
    lftp http://csbl.bmb.uga.edu/dbCAN/download

Now within lftp:

    mget -d *

It did not take take that long, 213 sec for 4.0.  No further unpacking necessary.

Prepare the HMM file for use with hmmer.

    module load bioinfo-tools 
    module load hmmer/3.1b1-gcc

    hmmpress dbCAN-fam-HMMs.txt

Extract trees.

    mkdir CAZyDB-phylogeny
    cd CAZyDB-phylogeny
    tar xvzf ../CAZyDB-phylogeny.tar.gz
    cd ..

Update groups and permissions.

    cd ..
    chgrp -hR sw $VERSION
    chmod -R g+rwX,o+rX $VERSION

