SNeP/1.1
========================

<https://bioinformaticshome.com/tools/descriptions/SNeP.html>

Used under license:
AS IS
<>

Structure creating script (makeroom_SNeP_1.1.sh) moved to /sw/bioinfo/SNeP/makeroom_1.1.sh

LOG
---

    TOOL=SNeP
    VERSION=1.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/SNeP/1.1/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "SNeP" -v "1.1" -w "https://bioinformaticshome.com/tools/descriptions/SNeP.html" -c "bioinfo" -l "AS IS" -d "Estimates trends in effective population size trajectories using genome-wide SNP data. A user can adjust parameters for sample size\, mutation\, phasing\, and recombination rate." -x "INSTALL" -s "misc"
    ./makeroom_SNeP_1.1.sh
    cd $SRCDIR
    wget https://sourceforge.net/projects/snepnetrends/files/binaries/SNeP1.1/download
#   this is a pre-build binary
    cp SNeP1.1 $PREFIX

