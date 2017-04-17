    cd /sw/data/uppnex/Pfam
    VERSION=28.0
    mkdir $VERSION
    cd $VERSION
    lftp ftp://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam${VERSION}

Now within lftp:

    mget -d *

It will take a while, 10313 sec for 28.0.  Now unpack the files.  This will
take a while too.

    module load gnuparallel
    parallel -j 4 gunzip ::: *.gz

Prepare the HMM file for use with hmmer, which is used by pfam_scan.pl in
the pfam_scan module.

    module load bioinfo-tools 
    module load hmmer/3.1b1-gcc

    hmmpress Pfam-A.hmm

Extract family-specific trees and lift the directory to make them more readily
available.

    tar xzf trees.tgz
    mv nfs/production/xfam/pfam/sequpd/$VERSION/trees .
    rm -rf nfs
    
Update groups and permissions.

    cd ..
    chgrp -hR sw $VERSION
    chmod -R g+rwX,o+rX $VERSION

