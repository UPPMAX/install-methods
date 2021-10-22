gnuparallel/20180822
=====================

Gnu parallel: the parallel command

<https://www.gnu.org/software/parallel/>

LOG
---

    TOOL=gnuparallel
    VERSION=20180822
    mkdir -p /sw/parallel/$TOOL
    cd /sw/parallel/$TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src/
    wget https://ftp.acc.umu.se/mirror/gnu.org/gnu/parallel/parallel-${VERSION}.tar.bz2
    wget https://ftp.acc.umu.se/mirror/gnu.org/gnu/parallel/parallel-${VERSION}.tar.bz2.sig
    tar xjf parallel-${VERSION}.tar.bz2
    cd parallel-${VERSION}
    ./configure --prefix $PFX
    make
    make install

Mf file from previous version ok.
