kermit/1.0
========================

<https://github.com/rikuu/kermit>

Used under license:
MIT

Structure creating script (makeroom_kermit_1.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/kermit/makeroom_1.0.sh

LOG
---

    TOOL=kermit
    VERSION=1.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/jonass/uppmax/install-methods/makeroom.sh -t "kermit" -v "1.0" -w "https://github.com/rikuu/kermit" -s "assembly" -d "Kermit is a guided genome assembler using colored overlap graphs based on miniasm." -l "MIT"
    ./makeroom_kermit_1.0.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    git clone --recursive https://github.com/rikuu/kermit
    cd kermit/
    ml gcc/9.3.0
    make
    mkdir $PREFIX/bin
    cp kermit ../../rackham/bin/
    cp kermit-color ../../rackham/bin/
