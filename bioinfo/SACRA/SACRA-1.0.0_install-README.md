SACRA/1.0.0
========================

<https://github.com/hattori-lab/SACRA>

Used under license:
MIT license
<>

Structure creating script (makeroom_SACRA_1.0.0.sh) moved to /sw/bioinfo/SACRA/makeroom_1.0.0.sh

LOG
---

    TOOL=SACRA
    VERSION=1.0.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/SACRA/1.0.0/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "SACRA" -v "1.0.0" -w "https://github.com/hattori-lab/SACRA" -c "bioinfo" -l "MIT license" -d "SACRA splits the chimeric reads to the non-chimeric reads in PacBio long reads of MDA-treated virome sample." -s "misc" -x "INSTALL"
    ./makeroom_SACRA_1.0.0.sh
    cd $SRCDIR
    git clone https://github.com/hattori-lab/SACRA.git
    cd SACRA/
    cd scripts/
    sh SACRA.sh
    cp scripts/* $PREFIX

