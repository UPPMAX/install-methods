NanoPlot/1.33.1
========================

<https://pypi.org/project/NanoPlot/>

Used under license:
GPL3 license
<>

Structure creating script (makeroom_NanoPlot_1.33.1.sh) moved to /sw/bioinfo/NanoPlot/makeroom_1.33.1.sh

LOG
---

    TOOL=NanoPlot
    VERSION=1.33.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/NanoPlot/1.33.1/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "NanoPlot" -v "1.33.1" -w "https://pypi.org/project/NanoPlot/" -c "bioinfo" -l "GPL3 license" -d "Plotting tool for long read sequencing data and alignments." -s "misc" -x "INSTALL" -f
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    PYTHONVERSION=3.7.2

    cd $PREFIX
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PREFIX pip install --user NanoPlot==1.33.1

