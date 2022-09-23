bzip2/1.0.8
===========

<https://sourceware.org/bzip2>

Used under license:
Custom open-source 'AS IS'
<https://sourceware.org/git/?p=bzip2.git;a=blob;f=LICENSE>

Structure creating script (makeroom_bzip2_1.0.8.sh) moved to /sw/libs/bzip2/makeroom_1.0.8.sh

LOG
---

    makeroom.sh "-f" "-t" "bzip2" "-v" "1.0.8" "-c" "libs" "-w" "https://sourceware.org/bzip2" "-l" "Custom open-source 'AS IS'" "-L" "https://sourceware.org/git/?p=bzip2.git;a=blob;f=LICENSE"
    ./makeroom_bzip2_1.0.8.sh

    source /sw/libs/bzip2/SOURCEME_bzip2_1.0.8 && cd $SRCDIR

    [[ -f bzip2-${VERSION}.tar.gz ]] || wget http://www.bzip.org/${VERSION}/bzip2-${VERSION}.tar.gz
    [[ -d bzip2-${VERSION} ]] && rm -rf bzip2-${VERSION}
    tar xf bzip2-${VERSION}.tar.gz
    cd bzip2-${VERSION}
    echo $PREFIX

    make PREFIX=$PREFIX
    make check PREFIX=$PREFIX
    make install PREFIX=$PREFIX

This makes the static library, now make the shared library.

    make clean
    make -f Makefile-libbz2_so
    mv libbz2.so.1.0* $PREFIX/lib/

We also need to make two additional symlinks to the library.

    cd $PREFIX/lib
    VVERSION=${VERSION%.*}
    [[ -e libbz2.so.${VVERSION} ]] || ln -s libbz2.so.${VERSION} libbz2.so.${VVERSION}
    VVVERSION=${VVERSION%.*}
    [[ -e libbz2.so.${VVVERSION} ]] || ln -s libbz2.so.${VERSION} libbz2.so.${VVVERSION}

The mf from 1.0.6 should work here.
