vcflib 2016-08-29
=================

C++ library and utilities for manipulating VCF files.

<https://github.com/vcflib/vcflib>

LOG
---

    CLUSTER=${CLUSTER:?CLUSTER must be set}
    VERSION=2016-08-29
    cd /sw/apps/bioinfo/vcflib/
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    git clone --recursive https://github.com/vcflib/vcflib.git
    cd vcflib/
    module load zlib/1.2.8 gcc/5.4.0
    make -j 4
    cp -av bin ../../$CLUSTER

Complete for both milou and tintin.
