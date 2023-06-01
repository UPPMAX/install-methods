librdf/1.0.17
=============

<https://librdf.org/>

Used under license:
LGPL 2.1, GPL 2, Apache 2
<https://librdf.org/>

Structure creating script (makeroom_librdf_1.0.17.sh) moved to /sw/libs/librdf/makeroom_1.0.17.sh

I'd thought to build language bindings, but too much trouble.

LOG
---

    makeroom.sh -f -t librdf -v 1.0.17 -c libs -w https://librdf.org/ -d "a set of free software C libraries that provide support for the Resource Description Framework (RDF)" -l "LGPL 2.1, GPL 2, Apache 2" -L https://librdf.org/ 
    ./makeroom_librdf_1.0.17.sh 
    source /sw/libs/librdf/SOURCEME_librdf_1.0.17
    cd $SRCDIR
    wget http://download.librdf.org/source/raptor2-2.0.16.tar.gz
    wget http://download.librdf.org/source/rasqal-0.9.33.tar.gz
    wget http://download.librdf.org/source/redland-1.0.17.tar.gz

    ml gcc/10.3.0
    ml libcurl/7.85.0

Build, test, install raptor2 and rasqal, then set PKG_CONFIG_PATH to point into the PREFIX, then build redland/librdf.

    tar xf raptor2-2.0.16.tar.gz 
    cd raptor2-2.0.16/
    ./configure --prefix=$PREFIX
    ./configure --prefix=$PREFIX
    make -j10
    make test
    make install
    cd ..

    tar xf rasqal-0.9.33.tar.gz 
    cd rasqal-0.9.33/
    ml MPFR/4.1.0
    ml pcre/8.40
    ./configure --prefix=$PREFIX
    make -j10
    make test
    make install
    cd ..


    ml MariaDB/10.1.29
    ml sqlite/3.34.0
    ml PostgreSQL/10.3

    export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH

    ./configure --prefix=$PREFIX --enable-release --with-virtuoso=no

    make -j10
    make check
    make install

