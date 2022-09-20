Eagle2/2.4.1
========================

<https://alkesgroup.broadinstitute.org/Eagle/>

Used under license:
GPL v3


Structure creating script (makeroom_Eagle2_2.4.1.sh) moved to /sw/bioinfo/Eagle2/makeroom_2.4.1.sh

LOG
---
   ####EAGLE2

    TOOL=Eagle2
    VERSION=2.4.1
    makeroom.sh -f -t $TOOL -v $VERSION -w https://alkesgroup.broadinstitute.org/Eagle/ -s misc -l "GPL v3" -d "The Eagle software estimates haplotype phase [1] either within a genotyped cohort or using a phased reference panel"
    
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    cd $PREFIX


    wget https://storage.googleapis.com/broad-alkesgroup-public/Eagle/downloads/Eagle_v2.4.1.tar.gz
