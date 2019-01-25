SHORE/0.9.3
===========

Replacing the earlier README which loaded gcc/4.9.2 but is having trouble
building on rackham.  Just use the system gcc and system boost libraries.  We
must also specify `--without-lzma` because it can't make use of the newer
`liblzma.so` available with the `xz/5.2.2` module... it finds the system one
first, which is too old on milou.

<http://shore.sourceforge.net/wiki>

LOG
---

Attempting to build without specifying any gcc or boost.

    VERSION=0.9.3
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/SHORE
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f shore-${VERSION}.tar.gz ]] || wget http://downloads.sourceforge.net/project/shore/Release_${VERSION%.*}/shore-${VERSION}.tar.gz
    tar xzf shore-${VERSION}.tar.gz 
    mv shore-${VERSION} shore-${VERSION}-$CLUSTER
    cd shore-${VERSION}-$CLUSTER
    ./configure --prefix=$PFX --without-lzma
    make
    make install

Check for libraries that can't be found.

    cd $PFX/bin
    ldd shore

For the mf file, since SHORE provides a C++ library, set up some variables for that.

    prepend-path    PATH                $modroot/bin
    prepend-path    CPLUS_INCLUDE_PATH  $modroot/include
    prepend-path    LIBRARY_PATH        $modroot/lib
    prepend-path    LD_RUN_PATH         $modroot/lib
    prepend-path    LD_LIBRARY_PATH     $modroot/lib

This will build on rackham and milou both.
