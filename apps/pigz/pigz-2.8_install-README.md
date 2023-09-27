pigz/2.8
========

<https://zlib.net/pigz/>

Used under license:
Custom AS IS


Structure creating script (makeroom_pigz_2.8.sh) moved to /sw/apps/pigz/makeroom_2.8.sh

LOG
---

Build with recent gcc and link with recent zlib.

    makeroom.sh -f -c apps -t pigz -v 2.8 -w https://zlib.net/pigz/ -l "Custom AS IS" -d "A parallel implementation of gzip for modern multi-processor, multi-core machines"
    ./makeroom_pigz_2.8.sh 
    source /sw/apps/pigz/SOURCEME_pigz_2.8

    cd $SRCDIR
    wget https://zlib.net/pigz/pigz-2.8.tar.gz
    tar xf pigz-2.8.tar.gz 
    cd pigz-2.8/
    cat Makefile 
    ml gcc/12.3.0
    ml zlib/1.2.12
    make
    make tests

Check that RPATH is OK.

    ml purge
    ldd pigz

Yep. Install executable and man page. Note hard link of unpigz to pigz.

    mkdir -p $PREFIX/{bin,share/doc,share/man/man1}
    cp -av pigz $PREFIX/bin
    cp -av pigz.1 $PREFIX/share/man/man1/
    cp -av pigz.pdf $PREFIX/share/doc/
    cd $PREFIX/bin
    ln -f pigz unpigz

Wrap up.

    ./pigz-2.8_post-install.sh 
