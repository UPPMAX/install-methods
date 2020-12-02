selscan/1.3.0
========================

<https://github.com/szpiech/selscan/releases/tag/v1.3.0>

Used under license:
GPL 3 license
<>

Structure creating script (makeroom_selscan_1.3.0.sh) moved to /sw/bioinfo/selscan/makeroom_1.3.0.sh

LOG
---

    TOOL=selscan
    VERSION=1.3.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/selscan/1.3.0/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "selscan" -v "1.3.0" -w "https://github.com/szpiech/selscan/releases/tag/v1.3.0" -c "bioinfo" -l "GPL 3 license" -d "Positive selection scans on haplotypes." -x "INSTALL" -f
    ./makeroom_selscan_1.3.0.sh
    cd $SRCDIR
    wget https://github.com/szpiech/selscan/releases/download/v1.3.0/selscan-linux-1.3.0.tar.gz
    tar xvf selscan-linux-1.3.0.tar.gz 
    cd selscan-linux-1.3.0
    cp selscan ../../rackham
    cp norm ../../rackham
#

