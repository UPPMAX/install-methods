samtools/1.7
=============

<https://github.com/samtools/samtools>

Used under license:
MIT/Expat and modified 3-clause BSD

Structure creating script (makeroom_samtools_1.7.sh) moved to /sw/bioinfo/samtools/makeroom_1.7.sh

LOG
---

Build new htslib, then build samtools, referring to this new htslib.
Configure htslib plugins, and a few other things.


    TOOL=samtools
    VERSION=1.7

    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/samtools/${TOOL} -l "MIT/Expat and modified 3-clause BSD" -d "Tools for working with SAM/BAM/variant files"
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR
    [[ -f ${TOOL}-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/${TOOL}/releases/download/${VERSION}/${TOOL}-${VERSION}.tar.bz2
    tar xf ${TOOL}-${VERSION}.tar.bz2 
    cd ${TOOL}-${VERSION}

    module load libcurl/7.85.0
    module load zlib/1.2.12
    module load bzip2/1.0.8
    module load xz/5.2.6

    cd htslib-${VERSION}
    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
    make -j10
    make -j10 test
    make install
    cd ..

    ./configure --prefix=$PREFIX --with-htslib=$PREFIX
    make -j10
    PATH=$PREFIX/bin:$PATH LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH  make -j20 test
    make install


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

