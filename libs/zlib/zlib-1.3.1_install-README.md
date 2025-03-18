zlib/1.3.1
========

<https://zlib.net/>

Used under license:
Custom open-source 'as is'
<https://zlib.net/zlib_license.html>

Structure creating script (makeroom_zlib_1.3.1.sh) moved to /sw/libs/zlib/makeroom_1.3.1.sh

LOG
---

    makeroom.sh "-f" "-t" "zlib" "-v" "1.3.1" "-c" "libs" "-w" "https://zlib.net/" "-l" "Custom open-source 'as is'" "-L" "https://zlib.net/zlib_license.html" "-d" "a free, general-purpose, legally unencumbered -- that is, not covered by any patents -- lossless data-compression library for use on virtually any computer hardware and operating system"

    ./makeroom_zlib_1.3.1.sh

    source /sw/libs/zlib/SOURCEME_zlib_1.3.1
    cd $SRCDIR

Note: zlib configure is not an autoconf configure.  Just compile with system
gcc.  Note that 1.3.1 is the latest, but for consistency with older versions we
download its tarball from the `fossils/` subdirectory.

    [[ -f zlib-${VERSION}.tar.gz ]] || wget https://www.zlib.net/fossils/zlib-${VERSION}.tar.gz
    [[ -d zlib-${VERSION} ]] && rm -rf zlib-${VERSION}
    tar xzf zlib-${VERSION}.tar.gz 
    cd zlib-${VERSION}
    ml gcc/13.3.0
    ./configure --prefix=$PREFIX
    make test
    make install

Wrap up.

    cd $TOOLDIR
    ./zlib-1.3.1_post-install.sh
zlib/1.3.1
========================

<https://zlib.net/>

Used under license:
Custom open-source 'as is'
<https://zlib.net/zlib_license.html>

Structure creating script (makeroom_zlib_1.3.1.sh) moved to /sw/libs/zlib/makeroom_1.3.1.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "zlib" "-v" "1.3.1" "-c" "libs" "-w" "https://zlib.net/" "-l" "Custom open-source 'as is'" "-L" "https://zlib.net/zlib_license.html" "-d" "a free, general-purpose, legally unencumbered -- that is, not covered by any patents -- lossless data-compression library for use on virtually any computer hardware and operating system"
    ./makeroom_zlib_1.3.1.sh
