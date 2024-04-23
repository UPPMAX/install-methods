samtools/1.20
=============

<https://github.com/samtools/samtools>

Used under license:
MIT/Expat and modified 3-clause BSD

Structure creating script (makeroom_samtools_1.20.sh) moved to /sw/bioinfo/samtools/makeroom_1.20.sh

LOG
---


    makeroom.sh -f -t samtools -v 1.20 -s misc -w https://github.com/samtools/samtools -l "MIT/Expat and modified 3-clause BSD" -d "Tools for working with SAM/BAM/variant files"
    ./makeroom_samtools_1.20.sh
    source /sw/bioinfo/samtools/SOURCEME_samtools_1.20

    cd $SRCDIR
    [[ -f ${TOOL}-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/${TOOL}/releases/download/${VERSION}/${TOOL}-${VERSION}.tar.bz2
    [[ -d ${TOOL}-${VERSION} ]] && rm -rf ${TOOL}-${VERSION}
    tar xf ${TOOL}-${VERSION}.tar.bz2 
    cd ${TOOL}-${VERSION}

    module load gcc/12.3.0
    module load libcurl/8.4.0
    module load zlib/1.3
    module load bzip2/1.0.8
    module load xz/5.4.5
    module load libdeflate/1.19

    cd htslib-${VERSION}
    ./configure --with-libdeflate --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
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

Wrap up.  The same mf file from 1.16 should suffice, make sure there's a symlink for it.

    cd $TOOLDIR/mf
    ls -l $VERSION

Final step.

    cd $TOOLDIR
    ./samtools-${VERSION}_post-install.sh

