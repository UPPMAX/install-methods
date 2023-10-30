libcurl/8.4.0
=============

<https://curl.se/>

Used under license:



Structure creating script (makeroom_libcurl_7.85.0.sh) moved to /sw/libs/libcurl/makeroom_7.85.0.sh

LOG
---

    makeroom.sh "-f" "-t" "libcurl" "-v" "8.4.0" "-c" "libs" "-w" "https://curl.se/" "-d" "a free and easy-to-use client-side URL transfer library supporting many formats"
    ./makeroom_libcurl_8.4.0.sh
    source /sw/libs/libcurl/SOURCEME_libcurl_8.4.0
    cd $SRCDIR

    wget https://curl.se/download/curl-8.4.0.tar.bz2
    tar xf curl-8.4.0.tar.bz2
    cd curl-8.4.0

    ml gcc/12.3.0
    ml zstd/1.5.2

    ./configure --prefix=$PREFIX --with-openssl --with-zstd

