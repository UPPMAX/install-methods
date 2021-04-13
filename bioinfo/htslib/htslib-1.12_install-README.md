htslib/1.12
========================

<https://github.com/samtools/htslib>

Used under license:
MIT/Expat and modified 3-clause BSD

Structure creating script (makeroom_htslib_1.12.sh) moved to /sw/bioinfo/htslib/makeroom_1.12.sh

LOG
---

    TOOL=htslib
    VERSION=1.12
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/samtools/${TOOL} -l "MIT/Expat and modified 3-clause BSD" -d "Tools for working with SAM/BAM/variant files"
    ./makeroom_${TOOL}_${VERSION}.sh 

    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR
    [[ -f ${TOOL}-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/${TOOL}/releases/download/${VERSION}/${TOOL}-${VERSION}.tar.bz2
    tar xjf ${TOOL}-${VERSION}.tar.bz2
    cd ${TOOL}-${VERSION}
    module load libcurl/7.45.0
    module load zlib/1.2.11
    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
    make -j20
    make test
    make install

This doesn't have any problems building/testing as does samtools.
