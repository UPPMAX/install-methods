bzip2/1.0.6
===========

<http://www.bzip.org/>


Log
---

Would this be an upgrade?

    bzip2 --version

Yes, Milou has 1.0.5.  Not on rackham, which already has 1.0.6.  Note the
missing links below, that might still be a problem for some config process.

We go ahead building for Rackham etc. even though it isn't an upgrade, for
consistency.

    VERSION=1.0.6
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs
    mkdir -p bzip2
    cd bzip2/
    mkdir -p ${VERSION} mf
    cd ${VERSION}/
    mkdir -p $CLUSTER src
    cd $CLUSTER/
    export D=$PWD
    cd ../src/
    [[ -f bzip2-${VERSION}.tar.gz ]] || wget http://www.bzip.org/${VERSION}/bzip2-${VERSION}.tar.gz
    tar xzf bzip2-${VERSION}.tar.gz 
    mv bzip2-${VERSION} bzip2-${VERSION}-${CLUSTER}
    cd bzip2-${VERSION}-${CLUSTER}
    vi Makefile

Edit `Makefile` so `PREFIX=` points to `$D` which we set above.

    make
    make install

This makes the static library, now make the shared library.

    make clean
    make -f Makefile-libbz2_so
    mv libbz2.so.1.0* ../../$CLUSTER/lib/

We also need to make two additional symlinks to the library.

    ( cd ../../$CLUSTER/lib/ && ln -s libbz2.so.1.0 libbz2.so.1 )
    ( cd ../../$CLUSTER/lib/ && ln -s libbz2.so.1 libbz2.so )

Start with mf from zlib, but remove pkgconfig stuff, change man path, keep the
module load Wes added.

    cd ../../../mf
    cp /sw/mf/common/libraries/zlib/1.2.8 1.0.6

Fixup.

    cd ../..
    fixup -g bzip2

