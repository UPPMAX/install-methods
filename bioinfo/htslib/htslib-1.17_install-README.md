htslib/1.17
===========

<https://github.com/samtools/htslib>

Used under license:
MIT/Expat and modified 3-clause BSD

Structure creating script (makeroom_htslib_1.17.sh) moved to /sw/bioinfo/htslib/makeroom_1.17.sh

    TOOL=htslib
    VERSION=1.17

    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/samtools/${TOOL} -l "MIT/Expat and modified 3-clause BSD" -d "Tools for working with SAM/BAM/variant files"
    ./makeroom_${TOOL}_${VERSION}.sh 

    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR

    [[ -f ${TOOL}-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/${TOOL}/releases/download/${VERSION}/${TOOL}-${VERSION}.tar.bz2
    tar xjf ${TOOL}-${VERSION}.tar.bz2
    cd ${TOOL}-${VERSION}

    module load libcurl/7.85.0
    module load zlib/1.2.12
    module load bzip2/1.0.8
    module load xz/5.2.6
    module load zstd/1.5.2

    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
    make -j20
    make test
    make install

This doesn't have any problems building/testing as does samtools.

Now update RPATH info in executables to point to the new htslib, and make sure
all the executables can find their libhts and other libraries.

    cd $PREFIX/bin
    module purge
    module load uppmax
    module load patchelf/0.10
    for F in $(file * | grep 'ELF 64-bit' | cut -f1 -d:) ; do
        echo "fixing $F ..."
        patchelf --set-rpath "$(patchelf --print-rpath $F):$PREFIX/lib" $F
    done

    module purge
    ldd *

    cd $PREFIX/libexec/htslib
    module load uppmax
    module load patchelf/0.10
    for F in $(file * | grep 'ELF 64-bit' | cut -f1 -d:) ; do
        echo "fixing $F ..."
        patchelf --set-rpath "$(patchelf --print-rpath $F):$PREFIX/lib" $F
    done

    module purge
    ldd *


