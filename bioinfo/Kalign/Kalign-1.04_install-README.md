Kalign/1.04
===========

<https://msa.sbc.su.se/cgi-bin/msa.cgi>

Used under license:


Structure creating script (makeroom_Kalign_1.04.sh) moved to /sw/bioinfo/Kalign/makeroom_1.04.sh

LOG
---

    TOOL=Kalign
    VERSION=1.04
    cd /sw/bioinfo
    makeroom.sh -f -t $TOOL -v $VERSION -s alignment -w https://msa.sbc.su.se/cgi-bin/msa.cgi -d "fast and accurate multiple sequence alignment algorithm"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget http://msa.sbc.su.se/downloads/kalign-${VERSION}.tgz
    tar xzf kalign-${VERSION}.tgz 
    cd kalign-${VERSION}/
    module load gcc/9.3.0
    make
    make PREFIX=$PREFIX install
    vi ${TOOL}-${VERSION}_post-install.sh 

The PATH needs only `$modroot`.

