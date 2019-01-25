htslib 1.8
==========

    VERSION=1.8
    CLUSTER+${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/htslib
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f htslib-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/htslib/releases/download/${VERSION}/htslib-${VERSION}.tar.bz2
    tar xjf htslib-${VERSION}.tar.bz2
    mv htslib-${VERSION} htslib-${VERSION}-${CLUSTER}
    cd htslib-${VERSION}-${CLUSTER}

    module load zlib/1.2.11

    ./configure --prefix=$PFX
    make -j 4
    make test
    make install

    cd ..
    rm -rf htslib-${VERSION}-${CLUSTER}

The mf file should set several variables so this can be properly compiled against.

    prepend-path    CPATH             $modroot/include
    prepend-path    LIBRARY_PATH      $modroot/lib
    prepend-path    LD_LIBRARY_PATH   $modroot/lib
    prepend-path    LD_RUN_PATH       $modroot/lib
    prepend-path    PKG_CONFIG_PATH   $modroot/lib/pkgconfig
    prepend-path    MANPATH           $modroot/share/man
    prepend-path    PATH              $modroot/bin
