# pcre-8.40-install-README.md

pcre/8.40
=========

<http://www.pcre.org/>

Log
---

    VERSION=8.40
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir pcre
    cd pcre/
    mkdir $VERSION
    cd $VERSION
    mkdir -p src $CLUSTER
    cd src/
    [[ -f pcre-${VERSION}.tar.gz ]] || wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${VERSION}.tar.gz
    tar xzf pcre-${VERSION}.tar.gz 
    mv pcre-${VERSION} pcre-${VERSION}-${CLUSTER}
    cd pcre-${VERSION}-${CLUSTER}

Additional config options to be added here that are set for a system install
that we should also set for our module install.  These were shown in the
`DISTCHECK_CONFIGURE_FLAGS` variable visible in `config.log`:

    --enable-pcre16 --enable-pcre32 --enable-jit --enable-cpp --enable-unicode-properties

So now the full config and build is:

    ./configure --prefix=/sw/libs/pcre/${VERSION}/${CLUSTER} --enable-pcre16 --enable-pcre32 --enable-jit --enable-cpp --enable-unicode-properties
    make -j 8
    make install

Because we can use the mf file from 8.38, just make a symlink in the `mf/` directory.

