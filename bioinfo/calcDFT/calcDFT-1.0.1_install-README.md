clacDFT/1.0.1
========================

<https://sourceforge.net/projects/dnase2tfr/calcDFT/>

LOG
---

    TOOL=clacDFT
    VERSION=1.0.1
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh

    mkdir calcDFT
    cd calcDFT
    wget https://downloads.sourceforge.net/project/dnase2tfr/calcDFT/Makefile
    wget https://downloads.sourceforge.net/project/dnase2tfr/calcDFT/calcDFT.cpp
    wget https://downloads.sourceforge.net/project/dnase2tfr/calcDFT/bamfilereader.h
    wget https://downloads.sourceforge.net/project/dnase2tfr/calcDFT/bamfilereader.cpp
    ml bamtools/2.3.0
Edit the Makefile with the correct paths.
    BAMTOOL_INCLUDEDIR=/sw/apps/bioinfo/bamtools/2.3.0/rackham/include/bamtools/
    BAMTOOL_LIBDIR=/sw/apps/bioinfo/bamtools/2.3.0/rackham/lib/
    make
    cp -av calcDFT ../../rackham/
