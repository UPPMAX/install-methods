FastME/2.1.6.4
==============

<https://gite.lirmm.fr/atgc/FastME>

Used under license:
GPL


Structure creating script (makeroom_FastME_2.1.6.4.sh) moved to /sw/bioinfo/FastME/makeroom_2.1.6.4.sh

LOG
---

    makeroom.sh -f -t "FastME" -v "2.1.6.4" -w "https://gite.lirmm.fr/atgc/FastME" -l "GPL" -d "comprehensive, accurate and fast distance-based phylogeny inference program" -s "phylogeny"
    ./makeroom_FastME_2.1.6.4.sh 
    source /sw/bioinfo/FastME/SOURCEME_FastME_2.1.6.4
    cd $SRCDIR
    wget https://gite.lirmm.fr/atgc/FastME/-/raw/08e2150495640a45b89fb816edd894bec8219186/tarball/fastme-2.1.6.4.tar.gz
    tar xf fastme-2.1.6.4.tar.gz 
    cd fastme-2.1.6.4/

The binaries in `binaries/` are 2.1.6.2.  So build from source.

    ml purge
    ml gcc/12.3.0
    ./configure --prefix=$PREFIX
    ml purge
    make
    make check
    make install
    cd $PREFIX
    cd bin/
    ./fastme 
    ldd fastme 
    cd $TOOLDIR/mf
    vi 2.1.6.4
    ./FastME-2.1.6.4_post-install.sh 
