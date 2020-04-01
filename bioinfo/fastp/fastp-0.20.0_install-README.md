fastp/0.20.0
========================

<https://github.com/OpenGene/fastp>

Used under license:
MIT

Structure creating script (makeroom_fastp_0.20.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/fastp/makeroom_0.20.0.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -t "fastp" -v "0.20.0" -w "https://github.com/OpenGene/fastp" -s "misc" -l "MIT" -d "fast all-in-one preprocessing for FastQ files"

LOG
---

    TOOL=fastp
    VERSION=0.20.0
    cd /sw/bioinfo
    makeroom.sh -t $TOOL -v $VERSION -w https://github.com/OpenGene/fastp -s misc -l MIT -d "fast all-in-one preprocessing for FastQ files"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    ll
    echo $PREFIX
    wget https://github.com/OpenGene/fastp/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd fastp-${VERSION}/
    ml gcc/9.1.0
    view Makefile 
    make
    mkdir /sw/bioinfo/${TOOL}/${VERSION}/rackham/bin
    make PREFIX=$PREFIX install
    cd $PREFIX/bin
    ldd fastp

