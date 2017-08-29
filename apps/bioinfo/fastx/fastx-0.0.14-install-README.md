fastx/0.0.14
============

LOG
---

Using system gcc

    tar xzf libgtextutils-0.7.tar.gz
    cd libgtextutils-0.7
    ./configure --prefix=/sw/apps/bioinfo/fastx/0.0.14/milou/libgtextutils
    make
    make install

    export PKG_CONFIG_PATH=/sw/apps/bioinfo/fastx/0.0.14/milou/libgtextutils/lib/pkgconfig:$PKG_CONFIG_PATH
    export PERL5LIB=/sw/apps/bioinfo/fastx/0.0.14/milou/perl

    tar xjf fastx_toolkit-0.0.14.tar.bz2
    ./configure --prefix=/sw/apps/bioinfo/fastx/0.0.14/milou
    make
    make install
