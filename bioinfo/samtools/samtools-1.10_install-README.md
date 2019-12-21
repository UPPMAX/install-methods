samtools 1.10
============

    TOOL=samtools
    VERSION=1.10
    cd /sw/bioinfo
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do test -L $CL || ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    cd src
    [[ -f ${TOOL}-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/${TOOL}/releases/download/${VERSION}/${TOOL}-${VERSION}.tar.bz2
    tar xjf ${TOOL}-${VERSION}.tar.bz2 
    cd ${TOOL}-${VERSION}

    module load libcurl/7.45.0
    module load zlib/1.2.11

Now configure htslib plugins, and a few other things.

    cd htslib-${VERSION}
    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
    make -j10
    make -j10 test
    make install

And build samtools, referring to this new htslib.

    ./configure --prefix=$PREFIX --with-htslib=$PREFIX
    make -j10
    PATH=$PREFIX/bin:$PATH LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH  make -j20 test
    make install

Now update RPATH info in executables to point to the new htslib.

    cd $PREFIX/bin
    module purge
    module load uppmax
    module load patchelf/0.10
    for F in samtools wgsim md5fa md5sum-lite ; do
        patchelf --set-rpath "$(patchelf --print-rpath $F):/sw/bioinfo/samtools/1.10/rackham/lib" $F
    done

Now make sure all the executables can find their libhts and other libraries.

    ldd *

