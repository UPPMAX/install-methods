MEGAN/6.20.17
========================

<https://software-ab.informatik.uni-tuebingen.de/download/megan6/welcome.html>

Used under license:

<>

Structure creating script (makeroom_MEGAN_6.20.17.sh) moved to /sw/bioinfo/MEGAN/makeroom_6.20.17.sh

LOG
---

    TOOL=MEGAN
    VERSION=6.20.17
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/MEGAN/6.20.17/src
    /home/pmitev/GIT/install-methods/makeroom.sh -t "MEGAN" -v "6.20.17" -c "bioinfo" -w "https://software-ab.informatik.uni-tuebingen.de/download/megan6/welcome.html" -s "phylogeny" -f"
    ./makeroom_MEGAN_6.20.17.sh
    cd $SRCDIR
    wget https://software-ab.informatik.uni-tuebingen.de/download/megan6/MEGAN_Community_unix_6_20_17.sh
    sh MEGAN_Community_unix_6_20_17.sh

