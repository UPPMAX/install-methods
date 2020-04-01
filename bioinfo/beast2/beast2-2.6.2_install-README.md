beast2/2.6.2
========================

<https://github.com/CompEvol/beast2>

Used under license:
LGPL v2.1

Structure creating script (makeroom_beast2_2.6.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/beast2/makeroom_2.6.2.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -f" -t "beast2" -s "phylogeny" -v "2.6.2" -w "https://github.com/CompEvol/beast2" -d "Bayesian Evolutionary Analysis by Sampling Trees" -l "LGPL v2.1"

Replace the `$PREFIX` with the unpacked package directory.

LOG
---

    TOOL=beast2
    VERSION=2.6.2
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t ${TOOL} -s phylogeny -v ${VERSION} -w https://github.com/CompEvol/beast2 -d "Bayesian Evolutionary Analysis by Sampling Trees" -l "LGPL v2.1"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION}
    cd ${VERSION}/
    cd src/
    wget https://github.com/CompEvol/beast2/releases/download/v${VERSION}/BEAST.v${VERSION}.Linux.tgz
    tar xzf BEAST.v${VERSION}.Linux.tgz 
    rmdir $PREFIX
    mv beast $PREFIX

Use the 2.4.8 mf file, but add `BEAST2_ROOT` variable.
