pear/0.9.10
===========

Paired-End Read Merger

<https://sco.h-its.org/exelixis/web/software/pear/index.html>

Installing the precompiled linux 64 version.

LOG
---

Sign up for licence; CC licence prohibits commercial work
(<https://www.h-its.org/downloads/pear-academic/#license>).  Download links
sent to UU email, download to office mac, then rsync from Uppmax.

    VERSION=0.9.10
    CLUSTER=milou
    TOOL=/sw/apps/bioinfo/pear
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    rsync -Pa douglasscofield@fb166.ebc.uu.se:Downloads/pear-* .
    tar xzf pear-0.9.10-linux-x86_64.tar.gz 
    mv pear-0.9.10-linux-x86_64 ../$CLUSTER
    cd ..
    for C in rackham irma bianca ; do rm -f $C && ln -sf $CLUSTER $C; done


LOG for source compilation
--------------------------

From a year ago, same PEAR version though.

<http://www.exelixis-lab.org/web/software/pear>

    VERSION=0.9.10
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir -p pear
    cd pear
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    module load gcc/4.9.2
    module load zlib/1.2.8
    ./configure --prefix=/sw/apps/bioinfo/pear/0.9.10/$CLUSTER

Was just picking up system zlib; should find general fix. Edit Makefile and src/Make:

    LIBS = -L/sw/libs/zlib/1.2.8/lib ...

    make && make install

