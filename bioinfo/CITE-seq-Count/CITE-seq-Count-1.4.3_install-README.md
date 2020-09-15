CITE-seq-Count/1.4.3
========================

<https://hoohm.github.io/CITE-seq-Count/>

Used under license:
MIT

Structure creating script (makeroom_CITE-seq-Count_1.4.3.sh) moved to /sw/bioinfo/CITE-seq-Count/makeroom_1.4.3.sh

LOG
---

    TOOL=CITE-seq-Count
    VERSION=1.4.3
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/CITE-seq-Count/1.4.3/src
    /home/douglas/bin/makeroom.sh -f" -t "CITE-seq-Count" -v "1.4.3" -s "misc" -w "https://hoohm.github.io/CITE-seq-Count/" -d "python package that allows to count antibody TAGS from a CITE-seq and/or cell hashing experiment" -l "MIT"
    ./makeroom_CITE-seq-Count_1.4.3.sh
    cd /sw/bioinfo/CITE-seq-Count/1.4.3/src
    wget http://
    tar xvf 
    make

    cd /sw/bioinfo
    TOOL=CITE-seq-Count
    VERSION=1.4.3
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://hoohm.github.io/CITE-seq-Count/ -d "python package that allows to count antibody TAGS from a CITE-seq and/or cell hashing experiment" -l "MIT"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    module load python/3.7.2
    PYTHONUSERBASE=$PREFIX pip install --user ${TOOL}==$VERSION
