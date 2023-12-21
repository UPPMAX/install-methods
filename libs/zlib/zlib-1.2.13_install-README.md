zlib/1.2.13
===========

<https://zlib.net/>

Used under license:
Custom open-source 'as is'
<https://zlib.net/zlib_license.html>

Structure creating script (makeroom_zlib_1.2.13.sh) moved to /sw/libs/zlib/makeroom_1.2.13.sh

LOG
---

    makeroom.sh "-f" "-t" "zlib" "-v" "1.2.13" "-c" "libs" "-w" "https://zlib.net/" "-l" "Custom open-source 'as is'" "-L" "http://zlib.net/zlib_license.html" "-d" "a free, general-purpose, legally unencumbered -- that is, not covered by any patents -- lossless data-compression library for use on virtually any computer hardware and operating system"

    ./makeroom_zlib_1.2.13.sh

    source /sw/libs/zlib/SOURCEME_zlib_1.2.13
    cd $SRCDIR

Note: zlib configure is not an autoconf configure.  Just compile with system
gcc.  Note that 1.2.13 is no longer the latest, so we need to fetch from the
`fossils/` subdirectory.

    [[ -f zlib-${VERSION}.tar.gz ]] || wget https://www.zlib.net/fossils/zlib-${VERSION}.tar.gz
    [[ -d zlib-${VERSION} ]] && rm -rf zlib-${VERSION}
    tar xzf zlib-${VERSION}.tar.gz 
    cd zlib-${VERSION}
    ./configure --prefix=$PREFIX
    make test
    make install

Wrap up.

    cd $TOOLDIR
    ./zlib-1.2.13_post-install.sh
