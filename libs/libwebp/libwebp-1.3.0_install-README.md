libwebp/1.3.0
=============

<https://github.com/webmproject/libwebp>

Used under license:
BSD 3-clause

<https://raw.githubusercontent.com/webmproject/libwebp/main/COPYING>

Structure creating script (makeroom_libwebp_1.3.0.sh) moved to /sw/libs/libwebp/makeroom_1.3.0.sh


LOG
---

    makeroom.sh -f -t libwebp -v 1.3.0 -c libs -w https://github.com/webmproject/libwebp -l "BSD 3-clause" -L https://raw.githubusercontent.com/webmproject/libwebp/main/COPYING -d "library to encode and decode images in WebP format"
    ./makeroom_libwebp_1.3.0.sh 
    source /sw/libs/libwebp/SOURCEME_libwebp_1.3.0 && cd $SRCDIR
    wget https://github.com/webmproject/libwebp/archive/refs/tags/v1.3.0.tar.gz
    tar xf v1.3.0.tar.gz 

    module load zlib/1.2.12
    module load giflib/5.1.4

    cd libwebp-1.3.0/
    ./autogen.sh

    ./configure --prefix=$PREFIX
    make -j10
    make check
    make install

