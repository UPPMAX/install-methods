xz/5.2.6
========

<https://tukaani.org/xz>

XZ and liblzma

<http://tukaani.org/xz/>

Provides both the xz tool and (perhaps more importantly) the liblzma library.

Used under license:
Unknown


Structure creating script (makeroom_xz_5.2.6.sh) moved to /sw/apps/xz/makeroom_5.2.6.sh

LOG
---

    makeroom.sh "-f" "-t" "xz" "-v" "5.2.6" "-c" "apps" "-w" "https://tukaani.org/xz" "-l" "Unknown" "-d" "general-purpose data compression software with a high compression ratio"
    ./makeroom_xz_5.2.6.sh

    source /sw/apps/xz/SOURCEME_xz_5.2.6 && cd $SRCDIR
    
    [[ -f xz-${VERSION}.tar.gz ]] || wget http://tukaani.org/xz/xz-${VERSION}.tar.gz
    [[ -d xz-${VERSION} ]] && rm -rf xz-${VERSION}
    tar xf xz-${VERSION}.tar.gz 
    cd xz-${VERSION}
    ./configure --prefix=$PREFIX
    make -j4
    make check
    make install
    cd ..
    rm -rf xz-${VERSION}

Add symlink, for version X.Y.Z missing the symlink for X.Y

    cd $PREFIX/lib
    ln -s liblzma.so.${VERSION} liblzma.so.${VERSION%.*}

