lastz/1.04.22
========================

<https://github.com/lastz/lastz/>

Used under license:
MIT


Structure creating script (makeroom_lastz_1.04.22.sh) moved to /sw/bioinfo/lastz/makeroom_1.04.22.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "lastz" "-v" "1.04.22" "-w" "https://github.com/lastz/lastz/" "-d" "Program for aligning DNA sequences, a pairwise aligner." "-l" "MIT"
    ./makeroom_lastz_1.04.22.sh
lastz/1.04.00
=============

<http://www.bx.psu.edu/~rsharris/lastz/>

LOG
---

    VERSION=1.04.00
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/lastz
    mkdir $VERSION
    cd $VERSION
    mkdir -p $CLUSTER/bin src_$CLUSTER
    cd $CLUSTER/bin
    export LASTZ_INSTALL=$PWD
    cd ../../src_$CLUSTER
    wget http://www.bx.psu.edu/~rsharris/lastz/lastz-${VERSION}.tar.gz
    tar xzf lastz-${VERSION}.tar.gz
    cd lastz-distrib-${VERSION}

We export `LASTZ_INSTALL` since the makefiles reference that for installation location.

See previous README for switching off fatal warnings.  These no longer occur, even when loading gcc/4.9.4, so better not to bother.

    module load gcc/4.9.4

    cd src
    make
    make install

Also make executable for > 2GBa

    make clean
    make lastz_32
    make install_32

Also make version which allows Adjacent Indels

    mv $LASTZ_INSTALL/lastz_32 $LASTZ_INSTALL/tmp
    make clean
    make lastz_32 allowBackToBackGaps=ON
    make install_32
    mv $LASTZ_INSTALL/lastz_32 $LASTZ_INSTALL/lastz_ai
    mv $LASTZ_INSTALL/tmp $LASTZ_INSTALL/lastz_32 

Make sure versions show the differences we intend.

    for P in $LASTZ_INSTALL/* ; do echo $P; $P --version; done

