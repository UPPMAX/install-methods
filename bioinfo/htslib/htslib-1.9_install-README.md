htslib/1.9
==========

<https://github.com/samtools/htslib>

Used under license:
MIT/Expat for everything bit the `cram/` subdirectory, modified 3-clause BSD for the `cram/` subdirectory.

Structure creating script (makeroom_htslib_1.9.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/htslib/makeroom_1.9.sh

    TOOL=htslib
    VERSION=1.9
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/samtools/${TOOL} -l "MIT/Expat and modified 3-clause BSD" -d "Tools for working with SAM/BAM/variant files"
    ./makeroom_${TOOL}_${VERSION}.sh 

    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSION/src
    [[ -f ${TOOL}-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/${TOOL}/releases/download/${VERSION}/${TOOL}-${VERSION}.tar.bz2
    tar xjf ${TOOL}-${VERSION}.tar.bz2
    cd ${TOOL}-${VERSION}
    module load libcurl/7.45.0
    module load zlib/1.2.11
    ./configure --prefix=$PREFIX
    make -j 4
    make test
    make install

