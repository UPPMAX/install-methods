BEDTools/2.31.1
===============

<https://bedtools.readthedocs.io>

Used under license:
MIT

Structure creating script (makeroom_BEDTools_2.31.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/BEDTools/makeroom_2.31.1.sh

LOG
---

    TOOL=BEDTools
    VERSION=2.31.1

    makeroom.sh -f -t "${TOOL}" -v "${VERSION}" -d "The swiss army knife for genome arithmetic" -w "https://bedtools.readthedocs.io" -l "MIT"
    ./makeroom_${TOOL}_${VERSION}.sh

    source /sw/bioinfo/$TOOL/SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR

    [[ -f bedtools-${VERSION}.tar.gz ]] || wget https://github.com/arq5x/bedtools2/releases/download/v${VERSION}/bedtools-${VERSION}.tar.gz
    [[ -d bedtools2 ]] && rm -rf bedtools2
    tar xf bedtools-${VERSION}.tar.gz 
    cd bedtools2/

    module load gcc/12.3.0
    module load zlib/1.2.13
    module load bzip2/1.0.8
    module load xz/5.4.5

    make clean
    make -j 8
    make prefix=$PREFIX install

    rm -rf bedtools2 

