pear 0.9.10
===========

Paired-End Read Merger

<http://www.exelixis-lab.org/web/software/pear>

Expanding on Wes's original notes.

LOG
---

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
