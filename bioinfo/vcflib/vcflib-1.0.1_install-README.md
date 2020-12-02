vcflib/1.0.1
========================

<https://github.com/vcflib/vcflib>

Used under license:
MIT

Structure creating script (makeroom_vcflib_1.0.1.sh) moved to /sw/bioinfo/vcflib/makeroom_1.0.1.sh

C++ library and utilities for manipulating VCF files.

Use the source bundle, and unpack over in PREFIX.  Its utility as a library to
build against is limited, but the scripts and tools it provides are all still
available via PATH.

LOG
---

    TOOL=vcflib
    VERSION=1.0.1
    cd /sw/bioinfo/${TOOL}
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/${TOOL}/${TOOL} -d "C++ library for parsing and manipulating VCF files" -l MIT
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR
    wget https://github.com/${TOOL}/${TOOL}/releases/download/v${VERSION}/${TOOL}-${VERSION}-src.tar.gz
    tar xzf ${TOOL}-${VERSION}-src.tar.gz 
    module load python/3.7.2
    module load gcc/8.4.0
    rmdir $PREFIX
    tar xzf ${TOOL}-${VERSION}-src.tar.gz 
    mv ${TOOL}-${VERSION}-src $PREFIX
    cd $PREFIX
    make -j 10

In the mf file, set CPATH and CPLUS_INCLUDE_PATH and LIBRARY_PATH and PATH.
