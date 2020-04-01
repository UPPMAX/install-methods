nanopolish/0.12.0
========================

<https://github.com/jts/nanopolish>

Used under license:
MIT

Structure creating script (makeroom_nanopolish_0.12.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/nanopolish/makeroom_0.12.0.sh

makeroom.sh invoked with:
/home/jonass/uppmax/install-methods/makeroom.sh -t "nanopolish" -w "https://github.com/jts/nanopolish" -d "Software package for signal-level analysis of Oxford Nanopore sequencing data." -v "0.12.0" -s "misc" -l "MIT"

LOG
---

    TOOL=nanopolish
    VERSION=0.12.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/jonass/uppmax/install-methods/makeroom.sh -t "nanopolish" -w "https://github.com/jts/nanopolish" -d "Software package for signal-level analysis of Oxford Nanopore sequencing data." -v "0.12.0" -s "misc" -l "MIT"
    ./makeroom_nanopolish_0.12.0.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    git clone --recursive https://github.com/jts/nanopolish.git
    cd nanopolish
    make
    cd ..
    cp -avr nanopolish/* ../rackham/
