RMBlast/2.2.28
==============

<https://www.repeatmasker.org/rmblast/>

Used under license:
Public domain


Structure creating script (makeroom_RMBlast_2.2.28.sh) moved to /sw/bioinfo/RMBlast/makeroom_2.2.28.sh

LOG
---

    makeroom.sh "-f" "-c" "bioinfo" "-s" "alignment" "-t" "RMBlast" "-v" "2.2.28" "-w" "https://www.repeatmasker.org/rmblast/" "-l" "Public domain" "-d" "RMBlast is a RepeatMasker compatible version of the standard NCBI blastn program. The primary difference between this distribution and the NCBI distribution is the addition of a new program rmblastn for use with RepeatMasker and RepeatModeler."
    ./makeroom_RMBlast_2.2.28.sh
    cd /sw/bioinfo/RMBlast
    source SOURCEME_RMBlast_2.2.28

The instructions from the original installation:

    CLUSTER=rackham
    OTHERCLUSTERS="irma bianca"
    VERSION=2.2.28
    TOOL=/sw/apps/bioinfo/rmblast
    mkdir -p $TOOL/$VERSION $TOOL/src
    cd $TOOL/src
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/rmblast/$VERSION/ncbi-rmblastn-$VERSION-x64-linux.tar.gz
    tar xf ncbi-rmblastn-$VERSION-x64-linux.tar.gz
    mv ncbi-rmblastn-2.2.28 ../$VERSION/$CLUSTER
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    chgrp -R sw $TOOL/$VERSION
    chmod -R g+rwx $TOOL/$VERSION

