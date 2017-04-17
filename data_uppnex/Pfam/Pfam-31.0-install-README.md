Pfam 31.0
=========

The Pfam website is now <http://pfam.xfam.org>, but the ftp is still the old EBI one.

    cd /sw/data/uppnex/Pfam
    VERSION=31.0
    mkdir $VERSION
    cd $VERSION
    lftp ftp://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam${VERSION}

Now within lftp:

    mget -d *
    quit

It will take a while, 10313 sec for 28.0.  Now unpack the files.  This will
take a while too.

    module load gnuparallel
    parallel -j 4 --line-buffer --verbose gunzip ::: *.gz

Prepare the HMM file for use with hmmer, which is used by `pfam_scan.pl` in
the `pfam_scan/1.6` module.

    module load bioinfo-tools 
    module load hmmer/3.1b2

    hmmpress Pfam-A.hmm

Extract family-specific trees and lift the directory to make them more readily
available.

    tar xzf trees.tgz
    mv nfs/production/xfam/pfam/sequpd/$VERSION/Release/$VERSION/trees .
    rm -rf nfs

Update groups and permissions.

    cd ..
    fixup -g $VERSION

