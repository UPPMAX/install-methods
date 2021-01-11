RAisD/2.9
========================

<https://bioinformaticshome.com/tools/descriptions/RAiSD.html>

Used under license:
GPL v2 license
<>

Structure creating script (makeroom_RAisD_2.9.sh) moved to /sw/bioinfo/RAisD/makeroom_2.9.sh

LOG
---

    TOOL=RAisD
    VERSION=2.9
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/RAisD/2.9/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "RAisD" -v "2.9" -w "https://bioinformaticshome.com/tools/descriptions/RAiSD.html" -c "bioinfo" -l "GPL v2 license" -d "A parameter free tool to detect selective sweeps using multiple signatures and enumeration of single nucleotide polymorphism \(NP\) vectors.\" -x "INSTALL" -s "misc"
    ./makeroom_RAisD_2.9.sh
    cd $SRCDIR
    wget https://github.com/alachins/raisd/archive/master.zip
    unzip master.zip
    cd raisd-master/
    ml gsl/2.6
    ./install-RAiSD.sh
    cp -r bin/ $PREFIX
    cp -r publications/ $PREFIX
    cp -r help/ $PREFIX
    cp -r evaluation/ $PREFIX
    cp -r common-outliers-SARS-CoV-2/ $PREFIX
    cp bin/release/RAisD $PREFIX 

