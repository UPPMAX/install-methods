Bracken/2.6.2
========================

<https://github.com/jenniferlu717/Bracken>

Used under license:



Structure creating script (makeroom_Bracken_2.6.2.sh) moved to /sw/bioinfo/Bracken/makeroom_2.6.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "Bracken" -v "2.6.2" -w "https://github.com/jenniferlu717/Bracken" -d "Bracken is a companion program to Kraken 1 or Kraken 2 While Kraken classifies reads to multiple levels in the taxonomic tree." -f"
    ./makeroom_Bracken_2.6.2.sh

    
    TOOL=Bracken
    VERSION=2.6.2
    cd /sw/bioinfo/${TOOL}/
    source SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR
    wget https://github.com/jenniferlu717/Bracken/archive/refs/tags/v2.6.2.tar.gz
    tar xfvz v2.6.2.tar.gz --strip 1 -C $PREFIX
    cd $PREFIX/src && make






Bracken/2.5
========================

<https://ccb.jhu.edu/software/bracken>

Used under license:
GPL v3

Structure creating script (makeroom_Bracken_2.5.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Bracken/makeroom_2.5.sh

LOG
---

    TOOL=Bracken
    VERSION=2.5
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_Bracken_2.5.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget http://
    tar xvf 
    make

