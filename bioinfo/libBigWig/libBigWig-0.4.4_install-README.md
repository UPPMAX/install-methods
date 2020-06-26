libBigWig/0.4.4
========================

<https://github.com/dpryan79/libBigWig>

Used under license:
MIT

Structure creating script (makeroom_libBigWig_0.4.4.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/libBigWig/makeroom_0.4.4.sh

LOG
---


    cd /sw/bioinfo
    TOOL=libBigWig
    VERSION=0.4.4
    makeroom.sh -f -t $TOOL -v $VERSION -s annotation -d "A C library for handling bigWig files" -w https://github.com/dpryan79/${TOOL} -l MIT
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget https://github.com/dpryan79/${TOOL}/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz 
    cd ${TOOL}-${VERSION}/
    module load libcurl/7.45.0
    make prefix=$PREFIX install

Use mf file from zlib, but this only provides static and shared libraries and
header files, no pkgconfig etc.
