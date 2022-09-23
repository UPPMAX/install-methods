zlib/1.2.12
===========

<http://zlib.net/>

Used under license:
Custom open-source 'as is'
<http://zlib.net/zlib_license.html>

Structure creating script (makeroom_zlib_1.2.12.sh) moved to /sw/libs/zlib/makeroom_1.2.12.sh

LOG
---

    makeroom.sh "-f" "-t" "zlib" "-v" "1.2.12" "-c" "libs" "-w" "http://zlib.net/" "-l" "Custom open-source 'as is'" "-L" "http://zlib.net/zlib_license.html" "-d" "a free, general-purpose, legally unencumbered -- that is, not covered by any patents -- lossless data-compression library for use on virtually any computer hardware and operating system"

    ./makeroom_zlib_1.2.12.sh

    source /sw/libs/zlib/SOURCEME_zlib_1.2.12 && cd $SRCDIR

Note: zlib configure is not an autoconf configure.  Just compile with system gcc.

    [[ -f zlib-${VERSION}.tar.gz ]] || wget http://www.zlib.net/zlib-${VERSION}.tar.gz
    [[ -d zlib-${VERSION} ]] && rm -rf zlib-${VERSION}
    tar xzf zlib-${VERSION}.tar.gz 
    cd zlib-${VERSION}
    ./configure --prefix=$PREFIX
    make test
    make install

