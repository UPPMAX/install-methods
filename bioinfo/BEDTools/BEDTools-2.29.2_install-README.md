BEDTools/2.29.2
===============

<https://bedtools.readthedocs.io>

Used under license:
MIT

Structure creating script (makeroom_BEDTools_2.29.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/BEDTools/makeroom_2.29.2.sh

LOG
---

    TOOL=BEDTools
    VERSION=2.29.2
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f" -t "${TOOL}" -v "${VERSION}" -d "the swiss army knife for genome arithmetic" -w "https://bedtools.readthedocs.io" -l "MIT"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $VERSION
    cd src
    [[ -f bedtools-${VERSION}.tar.gz ]] || wget https://github.com/arq5x/bedtools2/releases/download/v${VERSION}/bedtools-${VERSION}.tar.gz
    [[ -d bedtools2 ]] && rm -rf bedtools2
    tar xzf bedtools-${VERSION}.tar.gz 
    cd bedtools2/
    module load gcc/9.3.0
    make clean
    make -j 8
    cp -av bin $PREFIX
    cd ..
    rm -rf bedtools2 

