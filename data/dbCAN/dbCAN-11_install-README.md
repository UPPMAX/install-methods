dbCAN/11
========

<https://bcb.unl.edu/dbCAN2/>

Used under license:



Structure creating script (makeroom_dbCAN_11.sh) moved to /sw/data/dbCAN/makeroom_11.sh

LOG
---

    makeroom.sh "-c" "data" "-f" "-t" "dbCAN" "-v" "11" "-w" "https://bcb.unl.edu/dbCAN2/" "-d" "carbohydrate-active enzymes database"
    ./makeroom_dbCAN_11.sh

    cd $PREFIX

    echo "mget -d *" | lftp https://bcb.unl.edu/dbCAN2/download/Databases/V11/

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

