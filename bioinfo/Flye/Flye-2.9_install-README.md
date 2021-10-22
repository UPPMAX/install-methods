Flye/2.9
========================

<https://github.com/fenderglass/Flye>

Used under license:
BSD 3-clause


Structure creating script (makeroom_Flye_2.9.sh) moved to /sw/bioinfo/Flye/makeroom_2.9.sh

LOG
---

    TOOL=Flye
    VERSION=2.9
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION  -d "de novo assembler for single molecule sequencing reads\, such as those produced by PacBio and Oxford Nanopore Technologies" -s "assembly" -l "BSD 3-clause" -w "https://github.com/fenderglass/Flye"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR
    wget https://github.com/fenderglass/${TOOL}/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz 
    cd ${TOOL}-${VERSION}/
    ml python/3.7.2
    ml gcc/9.3.0
    which python3
    python3 setup.py build
    PYTHONUSERBASE=$PREFIX python3 setup.py install --user

