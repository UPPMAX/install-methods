Kalign/1.04
===========

<https://msa.sbc.su.se/cgi-bin/msa.cgi>

Used under license:


Structure creating script (makeroom_Kalign_2.04.sh) moved to /sw/bioinfo/Kalign/makeroom_2.04.sh

LOG
---

    TOOL=Kalign
    VERSION=2.04
    cd /sw/bioinfo
    makeroom.sh -f -t $TOOL -v $VERSION -s alignment -w https://msa.sbc.su.se/cgi-bin/msa.cgi -d "fast and accurate multiple sequence alignment algorithm"
    ./makeroom_${TOOL}_2.04.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_2.04 
    cd 2.04/
    cd src/
    wget http://msa.sbc.su.se/downloads/kalign/current.tar.gz
    tar xzf current.tar.gz 
    ./configure

Don't bother setting `--prefix` in this `./configure`, it is not used.

    module load gcc/9.3.0
    make
    cp kalign $PREFIX/

The PATH needs only `$modroot`.

