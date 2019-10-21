dbCAN 4.0
=========

<http://csbl.bmb.uga.edu/dbCAN/>

LOG
---

    VERSION=5.0
    mkdir -p /sw/data/dbCAN
    cd /sw/data/dbCAN
    mkdir $VERSION
    chgrp sw $VERSION
    chmod g+s $VERSION
    cd $VERSION
    echo "mget -d *" | lftp http://csbl.bmb.uga.edu/dbCAN/download

It did not take take that long, 213 sec for 4.0.  No further unpacking necessary.

Prepare the HMM file for use with hmmer.

    module load bioinfo-tools 
    module load hmmer/3.1b2

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

