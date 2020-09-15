grocsvs/0.2.5
========================

<https://github.com/grocsvs/grocsvs>

Used under license:
MIT

Structure creating script (makeroom_grocsvs_0.2.5.sh) moved to /sw/bioinfo/grocsvs/makeroom_0.2.5.sh

LOG
---

    TOOL=grocsvs
    VERSION=0.2.5
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/grocsvs/0.2.5/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "grocsvs" -v "0.2.5" -w "https://github.com/grocsvs/grocsvs" -d "Genome-wide Reconstruction of Complex Structural Variants\, or GROC-SVs\, is a software pipeline for identifying large-scale structural variants\, performing sequence assembly at the breakpoints\, and reconstructing the complex structural variants using the long-fragment information from the 10x Genomics platform." -l "MIT" -s "misc"
    cd $SRCDIR
    wget https://github.com/grocsvs/idba/archive/1.1.3g1.tar.gz
    tar xvfz 1.1.3g1.tar.gz
    cd idba-1.1.3g1/
    ml python/2.7.15
    ml samtools/1.10
    ml Graphviz/2.40.1
    ml bwa/0.7.17
    ./build.sh
    mkdir $PREFIX/bin/
    cp bin/idba_ud $PREFIX/bin/
    cd $SRCDIR
    wget https://github.com/grocsvs/grocsvs/archive/v0.2.5.tar.gz
    tar xvfz v0.2.5.tar.gz
    cd grocsvs-0.2.5/
    PYTHONUSERBASE=$PREFIX pip install --user .

