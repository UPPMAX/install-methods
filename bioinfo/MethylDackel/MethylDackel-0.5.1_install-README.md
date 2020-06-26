MethylDackel/0.5.1
========================

<https://github.com/dpryan79/MethylDackel>

Used under license:
MIT

Structure creating script (makeroom_MethylDackel_0.5.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/MethylDackel/makeroom_0.5.1.sh

Needed to create libBigWig/0.4.4 before this.

LOG
---

    TOOL=MethylDackel
    VERSION=0.5.1

    cd /sw/bioinfo
    cd $TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -d "A (mostly) universal methylation extractor for BS-seq experiments" -w https://github.com/dpryan79/${TOOL} -l MIT
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget https://github.com/dpryan79/${TOOL}/archive/${VERSION}.tar.gz
    tar xzf $VERSION.tar.gz
    cd ${TOOL}-${VERSION}/
    ml bioinfo-tools
    ml htslib/1.9
    ml libBigWig/0.4.4
    ml gcc/9.3.0
    make LIBBIGWIG=$LIBBIGWIG_ROOT/lib/libBigWig.a prefix=$PREFIX install

