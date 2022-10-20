Pfam/35.0
========================

<http://pfam.xfam.org/>


Note that the Pfam website is in sunset, and will soon redirect to the InterPro website https://www.ebi.ac.uk/interpro

Releases are still available at the ftp site listed below.

Used under license:
CC0
<https://creativecommons.org/publicdomain/zero/1.0/>

Structure creating script (makeroom_Pfam_35.0.sh) moved to /sw/data/Pfam/makeroom_35.0.sh

LOG
---

    makeroom.sh "-t" "Pfam" "-v" "35.0" "-c" "data" "-w" "http://pfam.xfam.org/" "-l" "CC0" "-L" "https://creativecommons.org/publicdomain/zero/1.0/" "-d" "a large collection of protein families, each represented by multiple sequence alignments and hidden Markov models (HMMs)"
    ./makeroom_Pfam_35.0.sh
    source /sw/data/Pfam/SOURCEME_Pfam_35.0 && cd $VERSIONDIR
    rm -rf *

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
    module load hmmer/3.2.1

    hmmpress Pfam-A.hmm

Extract family-specific trees and lift the directory to make them more readily
available.

    tar xf trees.tgz
    mv nfs/production/xfam/pfam/sequpd/$VERSION/Release/$VERSION/trees .
    rm -rf nfs

Update groups and permissions.

    cd ..
    fixup $VERSION

Pfam/35.0
========================

<http://pfam.xfam.org/>

Used under license:
CC0
<https://creativecommons.org/publicdomain/zero/1.0/>

Structure creating script (makeroom_Pfam_35.0.sh) moved to /sw/data/Pfam/makeroom_35.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-t" "Pfam" "-v" "35.0" "-c" "data" "-w" "http://pfam.xfam.org/" "-l" "CC0" "-L" "https://creativecommons.org/publicdomain/zero/1.0/" "-d" "a large collection of protein families, each represented by multiple sequence alignments and hidden Markov models (HMMs)"
    ./makeroom_Pfam_35.0.sh
