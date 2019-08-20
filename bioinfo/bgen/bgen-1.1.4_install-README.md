bgen/1.1.4
==========

<https://bitbucket.org/gavinband/bgen>

Used under license:
Boost Software License v1.0

Structure creating script (makeroom_bgen_1.1.4.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/bgen/makeroom_1.1.4.sh

LOG
---

The tarball unpacks to a wordy directory name, so mv it.  Follow the rest of
the installation instructions, but improvise how to install it.  Build with the
system gcc, which is 4.8.5 as of this writing.  Note also we are removing the
unpacked source tree, it has a large number of individual files.


    TOOL=bgen
    VERSION=1.1.4
    makeroom.sh -t $TOOL -v $VERSION -s misc -w https://bitbucket.org/gavinband/bgen -l 'Boost Software License v1.0' -d 'Reference implementation of the BGEN format'
    ./makeroom_${TOOL}_${VERSION}.sh
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION}
    cd $VERSION/src
    wget https://bitbucket.org/gavinband/bgen/get/v${VERSION}.tar.bz2
    tar xjf v${VERSION}.tar.bz2


    mv gavinband-${TOOL}-* ${TOOL}-${VERSION}
    cd ${TOOL}-${VERSION}
    ./waf configure
    ./waf
    ./build/test/unit/test_bgen
    ./build/apps/bgenix -g example/example.16bits.bgen -list

    ./waf install --prefix=$PREFIX
    cd ..
    rm -rf ${TOOL}-${VERSION}

In the mf file, add `$modroot/bin` to `PATH`.
